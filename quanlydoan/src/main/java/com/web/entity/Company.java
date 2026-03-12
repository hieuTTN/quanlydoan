package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "company")
@Getter
@Setter
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String imageBanner;

    private String address;

    private String phone;

    private String email;

    private String website;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String taxCode;

    private Boolean active = true;
}
