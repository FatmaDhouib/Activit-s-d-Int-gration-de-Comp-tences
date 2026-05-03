package com.example.api_spring_boot.controller;

import com.example.api_spring_boot.entity.Etudiant;
import com.example.api_spring_boot.repository.EtudiantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@RestController
@RequestMapping("/api/etudiants")
@CrossOrigin(origins = "*") // To allow mobile app requests easily
public class EtudiantController {

    @Autowired
    private EtudiantRepository etudiantRepository;

    @GetMapping
    public List<Etudiant> getAllEtudiants() {
        return etudiantRepository.findAll();
    }
}
