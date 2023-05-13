package tn.todolist.todolist_back.service.Task;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.service.*;

import java.util.List;

@Service
@AllArgsConstructor
public class TaskService implements ITaskService, ICRUDService {
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
