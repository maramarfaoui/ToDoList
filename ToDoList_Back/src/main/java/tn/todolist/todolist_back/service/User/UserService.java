package tn.todolist.todolist_back.service.User;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.Auth.AuthenticationService;
import tn.todolist.todolist_back.entity.Role;
import tn.todolist.todolist_back.entity.User;
import tn.todolist.todolist_back.repository.UserRepository;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Lazy
@EnableScheduling
@AllArgsConstructor
@Slf4j
public class UserService {

    private UserRepository userRepository;


    private AuthenticationService authenticationService;



    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(long id) {
        return userRepository.findById(id);
    }

    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void createUser(User user) {
        userRepository.save(user);
    }

    public void updateUser(User user) {
        userRepository.save(user);
    }

    public User updateRoleUser(Long id, String r) {
        User user = userRepository.findById(id).get();
        user.setRoles(Role.valueOf(r));
        return userRepository.save(user);
    }

    public void deleteUser(long id) {
        userRepository.deleteById(id);
    }/*

    public void updateAuthenticationType(String username, String oauth2ClientName) {
        AuthenticationProvider authType = AuthenticationProvider.valueOf(oauth2ClientName.toUpperCase());
        userRepository.updateAuthenticationType(username, authType);
    }*/

    public User setUserExpiration (Long id,Integer duration)  {
        User user = userRepository.findById(id).get();
        user.setExpired(true);
        LocalDate currentDate = LocalDate.now();
        LocalDate unexpirDate = currentDate.plusDays(duration);
        Date dateToUnexpire = Date.from(unexpirDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        user.setDateToUnexired(dateToUnexpire);
        userRepository.save(user);

        return user;
    }

    public User setUserunExpiration(Long id) {
        User user = userRepository.findById(id).get();
        user.setExpired(false);
        userRepository.save(user);
        return user;
    }


    public User demReserPassword(String email)  {
        User user = userRepository.findByEmail(email).get();
        Random random = new Random();
        int randomNumber = random.nextInt(90000000) + 10000000;
        user.setCodeReset(randomNumber);
        return userRepository.save(user);
    }

    public String reserPassword(Integer code, String pwd) {
        User user = userRepository.findByCodeReset(code).get();
        if (user == null){
            return "User Not Found";
        }
        else {
            user.setPassword(authenticationService.criptMDP(pwd));
            return "done";
        }
    }




}
