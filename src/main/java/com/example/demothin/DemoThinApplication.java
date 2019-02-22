package com.example.demothin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@SpringBootApplication
@RestController
public class DemoThinApplication {

    @GetMapping("/")
    public String index(HttpServletRequest request) {
        return "test";
    }

    public static void main(String[] args) {
        SpringApplication.run(DemoThinApplication.class, args);
    }

}
