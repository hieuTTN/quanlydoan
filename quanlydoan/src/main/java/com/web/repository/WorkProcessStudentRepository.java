package com.web.repository;

import com.web.entity.WorkProcessStudent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface WorkProcessStudentRepository extends JpaRepository<WorkProcessStudent, Long> {

    @Query("select w from WorkProcessStudent w where lower(w.title) like lower(?1) and w.workProcess.id = ?2")
    Page<WorkProcessStudent> findByParamAndWorkProcess(String search, Long workProcessId, Pageable pageable);

    Page<WorkProcessStudent> findByWorkProcessId(Long workProcessId, Pageable pageable);
}