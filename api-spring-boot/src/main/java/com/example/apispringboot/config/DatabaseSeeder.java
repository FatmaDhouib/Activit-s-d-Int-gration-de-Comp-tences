package com.example.apispringboot.config;

import com.example.apispringboot.entity.Etudiant;
import com.example.apispringboot.repository.EtudiantRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class DatabaseSeeder {

    @Bean
    CommandLineRunner initDatabase(EtudiantRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                        new Etudiant(null, "11111111", "Ahmed Ben Ali", LocalDate.of(2000, 5, 12)),
                        new Etudiant(null, "22222222", "Sami Trabelsi", LocalDate.of(1999, 8, 20)),
                        new Etudiant(null, "33333333", "Fatma Dhouib", LocalDate.of(2001, 2, 15)),
                        new Etudiant(null, "44444444", "Youssef Gharbi", LocalDate.of(1998, 11, 30)),
                        new Etudiant(null, "55555555", "Amina Mansour", LocalDate.of(2002, 7, 5))
                ));
                System.out.println("Base de données initialisée avec 5 étudiants.");
            }
        };
    }
}
