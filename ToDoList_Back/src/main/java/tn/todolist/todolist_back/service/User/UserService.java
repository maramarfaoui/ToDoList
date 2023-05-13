package tn.todolist.todolist_back.service.User;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.service.*;

import java.util.List;
@Service
@AllArgsConstructor
public class UserService implements IUserService, ICRUDService {

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public Object findById(Object idItem) {
        return null;
    }

    @Override
    public Object add(Object class1) {
        return null;
    }

    @Override
    public void delete(Object o) {

    }

    @Override
    public Object update(Object Classe1) {
        return null;
    }
}
