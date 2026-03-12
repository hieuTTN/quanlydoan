package com.web.repository;

import com.web.entity.Semester;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface SemesterRepository extends JpaRepository<Semester, Long> {

    Optional<Semester> findByIsActiveTrue();

    boolean existsByYearName(String yearName);

    @Query("select count(e.id) > 0 from Semester e where e.yearName = ?1 and e.id <> ?2")
    boolean existsByYearName(String yearName, Long id);
}
