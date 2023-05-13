package tn.todolist.todolist_back.controller.User;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.todolist.todolist_back.entity.User;
import tn.todolist.todolist_back.service.User.UserService;


import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/user")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/getAll")
    public List findAll(){
        return userService.findAll();
    }
    @GetMapping("/findById/{idUser}")
    public User findById(@PathVariable("idUser") Long idUser){
        return userService.findById(idUser);
    }
    @PostMapping("/add")
    public User add(@RequestBody User user){
        return userService.add(user);
    }

    @DeleteMapping("/delete/{idUser}")
    public void delete(@PathVariable("idUser") Long idUser){
        userService.delete(idUser);
    }
    @PutMapping("/update")
    public User update(User user){
        return userService.update(user);
    }
}
