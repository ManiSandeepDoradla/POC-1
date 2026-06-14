package com.sandeep;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @GetMapping("/")
    public String home() {
        return "<h1>Sandeep's POC-1 YAYYYYYYYYYYYYYYYYY!</h1> <h1>POC-1: DevSecOps Java App Deployed via Maven, SonarQube, OWASP, & Trivy!</h1>";
    }
}
