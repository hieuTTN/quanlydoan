package com.web.service;

import com.web.dto.request.WorkProcessRequest;
import com.web.entity.SemesterTeacher;
import com.web.entity.WorkProcess;
import com.web.exception.MessageException;
import com.web.repository.SemesterTeacherRepository;
import com.web.repository.WorkProcessRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

@Service
public class WorkProcessService {

    @Autowired
    private WorkProcessRepository workProcessRepository;

    @Autowired
    private SemesterTeacherRepository semesterTeacherRepository;


    public WorkProcess save(WorkProcessRequest request){

        SemesterTeacher semesterTeacher = semesterTeacherRepository.findById(request.getSemesterTeacherId())
                .orElseThrow(() -> new MessageException("Không tìm thấy giảng viên hướng dẫn"));

        WorkProcess workProcess;

        if(request.getId() == null){
            workProcess = new WorkProcess();
            workProcess.setCreatedDate(LocalDateTime.now());
        }
        else{
            workProcess = workProcessRepository.findById(request.getId())
                    .orElseThrow(() -> new MessageException("Không tìm thấy tiến độ công việc"));
        }

        workProcess.setTitle(request.getTitle());
        workProcess.setDescription(request.getDescription());
        workProcess.setDeadline(request.getDeadline());
        workProcess.setSemesterTeacher(semesterTeacher);

        return workProcessRepository.save(workProcess);
    }


    public Map<String,String> delete(Long id){
        try{
            workProcessRepository.deleteById(id);
            return Map.of("message","Xóa tiến độ công việc thành công");
        }
        catch (Exception e){
            throw new MessageException("Không thể xóa tiến độ công việc");
        }
    }


    public WorkProcess findById(Long id){
        return workProcessRepository.findById(id)
                .orElseThrow(() -> new MessageException("Không tìm thấy tiến độ công việc"));
    }


    public Page<WorkProcess> findAll(String search, Long semesterTeacherId, Pageable pageable){

        if(semesterTeacherId == null){
            throw new MessageException("semesterTeacherId không được để trống");
        }

        if(search == null || search.trim().isEmpty()){
            return workProcessRepository.findBySemesterTeacherId(semesterTeacherId, pageable);
        }
        else{
            search = "%" + search + "%";
            return workProcessRepository.findByParamAndTeacher(search, semesterTeacherId, pageable);
        }
    }

}