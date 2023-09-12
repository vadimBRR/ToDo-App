package com.example.ToDoApp2.configs;


import com.example.ToDoApp2.services.CustomUserDetailService;
import com.example.ToDoApp2.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SecurityConfig  {
    @Autowired
    private CustomUserDetailService userDetailService;


    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }


//    @Bean
//    protected SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http.
//                csrf(csrf->csrf.disable())
//                .authorizeRequests((requests)->requests
//                        .requestMatchers("/registration","/login").permitAll()
//                        .anyRequest().authenticated())
//
//                .formLogin((form) -> form
//                        .loginPage("/login")
//                        .defaultSuccessUrl("/", true)
//                        .permitAll()
//                )
//                .logout((logout)->logout
//                        .logoutSuccessUrl("/login")
//                        .permitAll()
//                );
//
//        return http.build();
//
//    }
@Bean
public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
            .csrf(csrf->csrf.disable())

            .authorizeRequests((requests) -> requests
                    .requestMatchers("/login", "/registration").permitAll()
                    .anyRequest().authenticated()
            )
            .formLogin((form) -> form
                    .loginPage("/login")
                        .defaultSuccessUrl("/", true)

                    .permitAll()
            )
            .logout((logout) -> logout.permitAll());

    return http.build();
}
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService)
                .passwordEncoder(passwordEncoder());
    }

}
