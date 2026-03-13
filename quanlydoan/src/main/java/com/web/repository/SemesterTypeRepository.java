package com.web.repository;

import com.web.entity.SemesterType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SemesterTypeRepository extends JpaRepository<SemesterType, Long> {


    Page<SemesterType> findBySemesterId(Long semesterId, Pageable pageable);

    @Query("select s from SemesterType s where s.semester.id = ?1")
    List<SemesterType> findByParamAndSemester(Long semesterId);
}
