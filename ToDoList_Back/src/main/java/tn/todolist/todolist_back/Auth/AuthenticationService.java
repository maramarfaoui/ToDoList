package tn.todolist.todolist_back.Auth;



import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.config.JwtService;
import tn.todolist.todolist_back.entity.Token;
import tn.todolist.todolist_back.entity.TokenType;
import tn.todolist.todolist_back.entity.User;
import tn.todolist.todolist_back.repository.TokenRepository;
import tn.todolist.todolist_back.repository.UserRepository;


import java.util.Collections;
import java.util.Objects;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final UserRepository repository;
    private final TokenRepository tokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;


    public AuthenticationResponse register(RegisterRequest request)  {
        Random random = new Random();

        int randomNumber = random.nextInt(90000000) + 10000000;

        var user = User.builder()
                .username(request.getUsername())
                .name(request.getFirstname())
                .lastName(request.getLastname())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .roles(request.getRole())
                .locked(true)
                .expired(false)
                .codeActivation(randomNumber)
                .build();
        var savedUser = repository.save(user);
        var jwtToken = jwtService.generateToken(user);
        saveUserToken(savedUser, jwtToken);
        //emailService.sendWelcomeEmail(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }



    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );
        var user = repository.findByUsername(request.getUsername())
                .orElseThrow();
        if (user.isAccountNonExpired()){
        var jwtToken = jwtService.generateToken(user);
        //revokeAllUserTokens(user); hedhi eli lezem nraja33ha
        saveUserToken(user, jwtToken);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();}
        else if(user.isAccountNonLocked()){
            return AuthenticationResponse.builder()
                    .errors(Collections.singletonList("this profile is not yet verified. please check your mail to activate it"))
                    .build();
        }
        else {
            return AuthenticationResponse.builder()
                    .errors(Collections.singletonList("this profile is blocked."))
                    .build();
        }
    }

    public AuthenticationResponse authenticateViaWeb(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );
        User user = repository.findByUsername(request.getUsername())
                .orElseThrow();
        if (user.isAccountNonExpired()){
            var jwtToken = jwtService.generateToken(user);
            revokeAllUserTokens(user);
            saveUserToken(user, jwtToken);
            user.getTokens().clear();
            user.setPassword("");
            return AuthenticationResponse.builder()
                    .token(jwtToken)
					.user(user)
                    .build();
		}
        else if(user.isAccountNonLocked()){
            return AuthenticationResponse.builder()
                    .errors(Collections.singletonList("this profile is not yet verified. please check your mail to activate it"))
                    .build();
        }
        else {
            return AuthenticationResponse.builder()
                    .errors(Collections.singletonList("this profile is blocked."))
                    .build();
        }
    }
    public void saveUserToken(User user, String jwtToken) {
        var token = Token.builder()
                .user(user)
                .token(jwtToken)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();
        tokenRepository.save(token);
    }

    private void revokeAllUserTokens(User user) {
        var validUserTokens = tokenRepository.findAllValidTokenByUser(user.getId());
        if (validUserTokens.isEmpty())
            return;
        validUserTokens.forEach(token -> {
            token.setExpired(true);
            token.setRevoked(true);
        });
        tokenRepository.saveAll(validUserTokens);
    }
    public String verifAccount(String mail, Integer code) {
        User u = repository.findByEmail(mail).get();
        if (Objects.equals(u.getCodeActivation(), code)) {
            u.setLocked(false);
            repository.save(u);
            return "done";
        }
        else return "error";
    }

	public AuthenticationResponse demResetPassword(String email)  {
		User user = repository.findByEmail(email).get();
		Random random = new Random();
		int randomNumber = random.nextInt(90000000) + 10000000;
		user.setCodeReset(randomNumber);
		//emailService.sendCodeReset(user);
		return AuthenticationResponse.builder()
			.user(user)
			.build();
	}
    public String criptMDP(String  pwd){
        return  passwordEncoder.encode(pwd);
    }


}
