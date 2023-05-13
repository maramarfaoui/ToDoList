package tn.todolist.todolist_back.service.User;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.entity.User;
import tn.todolist.todolist_back.repository.UserRepository;
import tn.todolist.todolist_back.service.*;

import java.util.List;
@Service
@AllArgsConstructor
public class UserService implements IUserService, ICRUDService<User,Long> {

    @Autowired
    UserRepository userRepository;
    @Override
    public List findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findById(Long idUser) {
        return userRepository.findById(idUser).get();
    }

    @Override
    public User add(User user) {
        return userRepository.save(user);
    }

    @Override
    public void delete(Long idUser) {
        userRepository.deleteById(idUser);
    }

    @Override
    public User update(User user) {
        return userRepository.save(user);
    }


}
