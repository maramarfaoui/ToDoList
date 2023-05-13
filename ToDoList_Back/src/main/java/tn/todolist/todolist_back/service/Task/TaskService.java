package tn.todolist.todolist_back.service.Task;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.todolist.todolist_back.entity.Task;
import tn.todolist.todolist_back.repository.TaskRepository;
import tn.todolist.todolist_back.service.*;

import java.util.List;

@Service
@AllArgsConstructor
public class TaskService implements ITaskService, ICRUDService<Task,Long> {

    @Autowired
    TaskRepository taskRepository;
    @Override
    public List<Task> findAll() {
        return taskRepository.findAll();
    }

    @Override
    public Task findById(Long idTask) {
        return taskRepository.findById(idTask).get();
    }

    @Override
    public Task add(Task task) {
        return taskRepository.save(task);
    }

    @Override
    public void delete(Long idTask) {
        taskRepository.deleteById(idTask);
    }

    @Override
    public Task update(Task task) {
        return taskRepository.save(task);
    }
}
