package tn.todolist.todolist_back.controller.Task;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.todolist.todolist_back.entity.Category;
import tn.todolist.todolist_back.entity.Status;
import tn.todolist.todolist_back.entity.Task;
import tn.todolist.todolist_back.repository.TaskRepository;
import tn.todolist.todolist_back.service.Task.TaskService;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/task")
public class TaskController {
    @Autowired
    TaskService taskService;
    TaskRepository taskRepository ;

    @GetMapping("/getAll")
    public List findAll(){
        return taskService.findAll();
    }
    @GetMapping("/findById/{idTask}")
    public Task findById(@PathVariable("idTask") Long idTask){
        return taskService.findById(idTask);
    }
    @PostMapping("/add")
    public Task add(@RequestBody Task task){
        return taskService.add(task);
    }

    @DeleteMapping("/delete/{idTask}")
    public void delete(@PathVariable("idTask") Long idTask){
        taskService.delete(idTask);
    }
    @PutMapping("/update")
    public Task update(Task task){
        return taskService.update(task);
    }
    @GetMapping("/{category}/percentage")
    public double getTaskPercentageByCategoryAndStatus(@PathVariable Category category, @RequestParam Status status) {
        List<Task> tasks = taskRepository.findByCategory(category);
        long totalTasks = tasks.size();
        long completedTasks = tasks.stream().filter(task -> task.getStatus() == Status.COMPLETED).count();
        return (double) completedTasks / totalTasks * 100;
    }
}
