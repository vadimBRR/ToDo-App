package com.example.ToDoApp2.controllers;

import com.example.ToDoApp2.models.ToDo;
import com.example.ToDoApp2.services.ToDoServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.Calendar;

@Controller
public class PageController {

    @Autowired
    ToDoServices services;

    @GetMapping("/")
    public String firstPage(@RequestParam(value = "activeTab", defaultValue = "all")String activeTab, @RequestParam(value = "taskDate", required = false) LocalDate taskDate, Model model, Principal principal){
        System.out.println(activeTab);
        if(activeTab.equals("all")){
            model.addAttribute("tasks", services.getAllTasks(principal));
        }else if(activeTab.equals("today")){
            model.addAttribute("tasks", services.getTodayTasks(principal));
        } else if(activeTab.equals("tomorrow")){
            model.addAttribute("tasks", services.getTomorrowTasks(principal));
        } else if(activeTab.equals("completed")){
            model.addAttribute("tasks", services.getCompletedTaska(principal));
        }

        model.addAttribute("imagePath", "image/instagram.svg");
        model.addAttribute("activeTab", activeTab);
        model.addAttribute("newtask", new String());
        model.addAttribute("today", LocalDate.now());
        model.addAttribute("tomorrow", LocalDate.now().plusDays(1));
//        model.addAttribute("user", principal.getName());

        if(taskDate!=null){
            model.addAttribute("taskDate", taskDate);
        }else{
            model.addAttribute("taskDate", LocalDate.now());
        }

        return "main-todo";
    }

    @PostMapping("/delete/{id}")
    public String deleteTaskPost(@PathVariable Long id){
        services.deleteTask(id);
        return "redirect:/";
    }


    @PostMapping("/add")
    public String addTask(@RequestParam String task, @RequestParam( "taskDate") LocalDate date, Principal principal){

        System.out.println("ggg");
        System.out.println(date);
        services.addTask(task, date, principal);
        return "redirect:/";
    }

    @PostMapping("/edit")
    public String editTask(@RequestParam String task, @RequestParam( "date") LocalDate date, @RequestParam("id") Long id){

        System.out.println(date);
        services.editTask(id, task, date);
        return "redirect:/";
    }



    @PostMapping("/change-status/{id}")
    public String changeStatusPost(@PathVariable Long id){
        System.out.println("here");
        services.changeStatus(id);
        return "redirect:/";
    }




}
