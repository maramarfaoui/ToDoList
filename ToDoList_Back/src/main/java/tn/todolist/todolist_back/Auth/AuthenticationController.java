package tn.todolist.todolist_back.Auth;



import lombok.RequiredArgsConstructor;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tn.todolist.todolist_back.config.JwtService;
import tn.todolist.todolist_back.entity.User;
import tn.todolist.todolist_back.repository.TokenRepository;
import tn.todolist.todolist_back.repository.UserRepository;
import tn.todolist.todolist_back.service.User.UserService;

import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "*", maxAge = 3600)
public class AuthenticationController {

    private final AuthenticationService service;
    private final UserRepository repository;
    private final AuthenticationManager authenticationManager;
    private final TokenRepository tokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @Valid @RequestBody RegisterRequest request,
            BindingResult result
    )  {
        /*if (result.hasErrors()) {
            List<String> errors = result.getAllErrors()
                    .stream()
                    .map(DefaultMessageSourceResolvable::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest()
                    .body(AuthenticationResponse.builder()
                            .errors(errors)
                            .build());
        }*/
        return ResponseEntity.ok(service.register(request));
    }

    /*@PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest request,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            List<String> errors = result.getAllErrors()
                    .stream()
                    .map(DefaultMessageSourceResolvable::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest()
                    .body(AuthenticationResponse.builder()
                            .errors(errors)
                            .build());
        }
        return ResponseEntity.ok(service.authenticate(request));
    }*/
    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest request
    ) {
        return ResponseEntity.ok(service.authenticate(request));
    }

	@PostMapping("/webAuthenticate")
	public ResponseEntity<AuthenticationResponse> webAuthenticate(
		@RequestBody AuthenticationRequest request,
		BindingResult result
	) {
		if (result.hasErrors()) {
			List<String> errors = result.getAllErrors()
				.stream()
				.map(DefaultMessageSourceResolvable::getDefaultMessage)
				.collect(Collectors.toList());
			return ResponseEntity.badRequest()
				.body(AuthenticationResponse.builder()
					.errors(errors)
					.build());
		}
		return ResponseEntity.ok(service.authenticateViaWeb(request));
	}

    @PostMapping("/verif/{mail}/{code}")
    public String verifAccount(@PathVariable("mail") String mail,@PathVariable("code") Integer code){
        return service.verifAccount(mail,code);
    }

	@PostMapping("/demResetPassword/{email}")
	public ResponseEntity<?> demResetPassword(@PathVariable("email") String email)  {
		Optional<User> user = repository.findByEmail(email);
		if (user.isPresent()) {
			service.demResetPassword(email);
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
	}
	private UserService userService;
	@PostMapping("/ResetPassword/{code}/{pwd}")
	public String demResetPassword(@PathVariable("code") Integer code,@PathVariable("pwd") String pwd)  {
		return userService.reserPassword(code,pwd);
	}

}
