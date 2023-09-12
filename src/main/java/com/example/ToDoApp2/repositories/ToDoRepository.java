package com.example.ToDoApp2.repositories;

import com.example.ToDoApp2.models.ToDo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

public interface ToDoRepository extends JpaRepository<ToDo, Long> {
    List<ToDo> findByUsernameAndDateAndStatus(String username, LocalDate date, boolean status);
    List<ToDo> findByUsernameAndStatus(String username,boolean status);
}
