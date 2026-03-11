package com.web.service;

import com.web.dto.request.WorkProcessStudentRequest;
import com.web.entity.StudentRegis;
import com.web.entity.User;
import com.web.entity.WorkProcess;
import com.web.entity.WorkProcessStudent;
import com.web.exception.MessageException;
import com.web.repository.StudentRegisRepository;
import com.web.repository.WorkProcessRepository;
import com.web.repository.WorkProcessStudentRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

@Service
public class WorkProcessStudentService {

    @Autowired
    private WorkProcessStudentRepository workProcessStudentRepository;

    @Autowired
    private StudentRegisRepository studentRegisRepository;

    @Autowired
    private WorkProcessRepository workProcessRepository;

    @Autowired
    private UserUtils userUtils;


    public WorkProcessStudent save(WorkProcessStudentRequest request){

        User user = userUtils.getUserWithAuthority();

        WorkProcess workProcess = workProcessRepository.findById(request.getWorkProcessId())
                .orElseThrow(() -> new MessageException("Không tìm thấy tiến độ"));

        Optional<StudentRegis> studentRegis = studentRegisRepository.findByStudentAndSemesterTeacher(user.getId(), workProcess.getSemesterTeacher().getId());


        WorkProcessStudent workProcessStudent;

        if(request.getId() == null){
            workProcessStudent = new WorkProcessStudent();
            workProcessStudent.setCreatedDate(LocalDateTime.now());
        }
        else{
            workProcessStudent = workProcessStudentRepository.findById(request.getId())
                    .orElseThrow(() -> new MessageException("Không tìm thấy công việc này"));
        }

        workProcessStudent.setTitle(request.getTitle());
        workProcessStudent.setContent(request.getContent());
        workProcessStudent.setFile(request.getFile());
        workProcessStudent.setPercent(request.getPercent());
        workProcessStudent.setStudentRegis(studentRegis.get());
        workProcessStudent.setWorkProcess(workProcess);

        return workProcessStudentRepository.save(workProcessStudent);
    }


    public Map<String,String> delete(Long id){
        try{
            workProcessStudentRepository.deleteById(id);
            return Map.of("message","Xóa thành công");
        }
        catch(Exception e){
            throw new MessageException("Không thể xóa");
        }
    }


    public WorkProcessStudent findById(Long id){
        return workProcessStudentRepository.findById(id)
                .orElseThrow(() -> new MessageException("Không tìm thấy tiến độ công việc"));
    }


    public Page<WorkProcessStudent> findAll(String search, Long workProcessId, Pageable pageable){

        if(workProcessId == null){
            throw new MessageException("workProcessId không được để trống");
        }

        if(search == null || search.trim().isEmpty()){
            return workProcessStudentRepository.findByWorkProcessId(workProcessId, pageable);
        }
        else{
            search = "%" + search + "%";
            return workProcessStudentRepository.findByParamAndWorkProcess(search, workProcessId, pageable);
        }
    }

}