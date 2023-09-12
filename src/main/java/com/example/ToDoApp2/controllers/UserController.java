package com.example.ToDoApp2.controllers;

import com.example.ToDoApp2.models.User;
import com.example.ToDoApp2.repositories.UserRepository;
import com.example.ToDoApp2.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginPage(){
        return "/login";
    }

    @GetMapping("/registration")
    public String registerPage(){
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        System.out.println("postMapping");
        if(!userService.registerUser(user)){
        System.out.println("postMapping2");
            model.addAttribute("User with this username is already created!");
            return "/registration";
        }
        System.out.println("postMapping3");

        return "redirect:/login";
    }
}
