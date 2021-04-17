package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;

//@SpringBootApplication(exclude = {
//        MultipartAutoConfiguration.class
//})
@SpringBootApplication
public class QuizOnlineApplication {

    public static void main(String[] args) {
        SpringApplication.run(QuizOnlineApplication.class, args);
    }

}
