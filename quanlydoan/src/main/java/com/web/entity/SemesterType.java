package com.web.entity;

import com.web.enums.InternshipType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "semester_type")
@Getter
@Setter
public class SemesterType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String projectName;

    private String descriptionProject;

    @Enumerated(EnumType.STRING)
    private InternshipType type;

    @ManyToOne
    private Semester semester;

}
