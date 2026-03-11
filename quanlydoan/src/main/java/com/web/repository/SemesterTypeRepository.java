package com.web.repository;

import com.web.entity.SemesterType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SemesterTypeRepository extends JpaRepository<SemesterType, Long> {

    @Query("select s from SemesterType s where lower(s.projectName) like lower(?1)")
    Page<SemesterType> findByParam(String search, Pageable pageable);

    Page<SemesterType> findBySemesterId(Long semesterId, Pageable pageable);

    @Query("select s from SemesterType s where lower(s.projectName) like lower(?1) and s.semester.id = ?2")
    Page<SemesterType> findByParamAndSemester(String search, Long semesterId, Pageable pageable);
}
