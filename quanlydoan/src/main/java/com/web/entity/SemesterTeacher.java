package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "semester_teacher")
@Getter
@Setter
public class SemesterTeacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer maxStudents;

    private Integer currentStudents = 0;

    @ManyToOne
    private User teacher;

    @ManyToOne
    private SemesterType semesterType;
}
