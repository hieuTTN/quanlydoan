package com.web.entity;

import com.web.enums.InternshipType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "student_regis")
@Getter
@Setter
public class StudentRegis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime localDateTime;

    private Boolean accept;

    private String companyName;

    private String companyAddress;

    private String companyPhone;

    private String taxCode;

    private String introductionPaper;

    private Float totalScore;

    private String evaluate;

    @Enumerated(EnumType.STRING)
    private InternshipType internshipType;

    @ManyToOne
    private User student;

    @ManyToOne
    private SemesterTeacher semesterTeacher;

    @ManyToOne
    private SemesterCompany semesterCompany;
}
