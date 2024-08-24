package br.com.TaskManager.services;

import br.com.TaskManager.entities.Task;
import br.com.TaskManager.repositories.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public Optional<Task> getTaskById(Long id) {
        return taskRepository.findById(id);
    }

    public Task createTask(Task task) {
        return taskRepository.save(task);
    }

    public Task updateTask(Long id, Task taskDetails) {
        if (taskRepository.existsById(id)) {
            taskDetails.setId(id);
            return taskRepository.save(taskDetails);
        }
        return taskDetails;
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
}
