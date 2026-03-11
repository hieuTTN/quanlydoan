package com.web.repository;

import com.web.entity.SemesterTeacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface SemesterTeacherRepository extends JpaRepository<SemesterTeacher, Long> {

    @Query("select s from SemesterTeacher s where s.teacher.id = ?1 and s.semesterType.id = ?2")
    Optional<SemesterTeacher> findByTeacherAndSemesterType(Long teacherId, Long id);
}