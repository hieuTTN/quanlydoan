package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "related_document_student")
@Getter
@Setter
public class RelatedDocumentStudent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime createdDate;

    private String fileUrl;

    private String fileName;

    private String fileType;

    @ManyToOne
    private StudentRegis studentRegis;
}
