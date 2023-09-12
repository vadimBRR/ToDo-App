package com.example.ToDoApp2.services;

import com.example.ToDoApp2.models.User;
import com.example.ToDoApp2.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UserService  {
    @Autowired
    UserRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public boolean registerUser(User user){
        System.out.println("register1");
        String username = user.getUsername();
        if(repository.findByUsername(username)!=null) return false;

        System.out.println("register2");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving user: {}", username);
        repository.save(user);
        return true;
    }



    public User findByUsername(String username){
        return repository.findByUsername(username);
    }

//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        User user= repository.findByUsername(username);
//        if(user==null){
//            throw new UsernameNotFoundException("User with username "+username+" not found!");
//        }
//        return (UserDetails) user;
//    }
}
