package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "related_documents")
@Getter
@Setter
public class RelatedDocuments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    private LocalDateTime createdDate;

    private LocalDateTime deadline;

    @ManyToOne
    private SemesterTeacher semesterTeacher;
}
