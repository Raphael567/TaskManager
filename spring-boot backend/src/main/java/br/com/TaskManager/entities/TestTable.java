package br.com.TaskManager.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "TestTable")
public class TestTable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
}
