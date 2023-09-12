package com.example.ToDoApp2.services;

import com.example.ToDoApp2.models.ToDo;
import com.example.ToDoApp2.repositories.ToDoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@Service
public class ToDoServices {
    @Autowired
    ToDoRepository repository;

    public void addTask(String task, LocalDate date, Principal principal) {
        System.out.println("fsdlfjsd");
        ToDo newTask = new ToDo();
        newTask.setTask(task);
        newTask.setDate(date);
        newTask.setStatus(false);
        newTask.setUsername(principal.getName());
        repository.save(newTask);
    }
//        if(date.)
//        Calendar calendar = Calendar.getInstance();
//        todo.setDate(calendar.getTime());
//        todo.setStatus(false);
//        repository.save(todo);

    public List<ToDo> getAllTasks(Principal principal){
        return repository.findByUsernameAndStatus(principal.getName() ,false);
    }

    public List<ToDo> getTodayTasks(Principal principal){
        return repository.findByUsernameAndDateAndStatus(principal.getName(),LocalDate.now(), false);
    }

    public List<ToDo> getTomorrowTasks(Principal principal){
        return repository.findByUsernameAndDateAndStatus(principal.getName(), LocalDate.now().plusDays(1), false);
    }

    public List<ToDo> getCompletedTaska(Principal principal){
        return repository.findByUsernameAndStatus(principal.getName(), true);
    }

    public void changeStatus(Long id){
        ToDo toDo = repository.getById(id);
        System.out.println("1)" + toDo.isStatus());
        toDo.setStatus(true);
        System.out.println("2)" + toDo.isStatus());
        repository.save(toDo);
    }

    public void deleteTask(Long id){
        repository.deleteById(id);
    }
    
    public void editTask(Long id, String task, LocalDate date){
        ToDo toDo = repository.getById(id);
        toDo.setTask(task);
        toDo.setDate(date);
        repository.save(toDo);
        
    }
}
