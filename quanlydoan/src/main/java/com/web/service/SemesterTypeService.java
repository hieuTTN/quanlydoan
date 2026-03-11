package com.web.service;

import com.web.dto.request.SemesterTypeRequest;
import com.web.entity.Semester;
import com.web.entity.SemesterTeacher;
import com.web.entity.SemesterType;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.repository.SemesterRepository;
import com.web.repository.SemesterTeacherRepository;
import com.web.repository.SemesterTypeRepository;
import com.web.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Map;

@Service
public class SemesterTypeService {

    @Autowired
    private SemesterTypeRepository semesterTypeRepository;

    @Autowired
    private SemesterTeacherRepository semesterTeacherRepository;

    @Autowired
    private SemesterRepository semesterRepository;

    @Autowired
    private UserRepository userRepository;


    @Transactional
    public SemesterType save(SemesterTypeRequest request){

        Semester semester = semesterRepository.findById(request.getSemesterId())
                .orElseThrow(() -> new MessageException("Không tìm thấy học kỳ"));

        SemesterType semesterType;

        if(request.getId() == null){
            semesterType = new SemesterType();
        }
        else{
            semesterType = semesterTypeRepository.findById(request.getId())
                    .orElseThrow(() -> new MessageException("Không tìm thấy loại đề tài"));
        }

        semesterType.setProjectName(request.getProjectName());
        semesterType.setDescriptionProject(request.getDescriptionProject());
        semesterType.setType(request.getType());
        semesterType.setSemester(semester);

        semesterTypeRepository.save(semesterType);


        // xử lý teacher
        for(SemesterTypeRequest.SemesterTeacherRequest t : request.getSemesterTeacherRequests()){

            User teacher = userRepository.findById(t.getTeacherId())
                    .orElseThrow(() -> new MessageException("Không tìm thấy giảng viên"));

            SemesterTeacher semesterTeacher;

            if(t.getId() == null){
                if(semesterTeacherRepository.findByTeacherAndSemesterType(t.getTeacherId(), semesterType.getId()).isPresent()){
                    continue;
                }
                semesterTeacher = new SemesterTeacher();
                semesterTeacher.setCurrentStudents(0);
                semesterTeacher.setSemesterType(semesterType);
            }
            else{
                semesterTeacher = semesterTeacherRepository.findById(t.getId())
                        .orElseThrow(() -> new MessageException("Không tìm thấy giảng viên hướng dẫn"));
            }

            semesterTeacher.setMaxStudents(t.getMaxStudents());
            semesterTeacher.setTeacher(teacher);

            semesterTeacherRepository.save(semesterTeacher);
        }

        return semesterType;
    }


    public Map<String,String> delete(Long id){
        try{
            semesterTypeRepository.deleteById(id);
            return Map.of("message","Xóa loại đề tài thành công");
        }
        catch (Exception e){
            throw new MessageException("Không thể xóa loại đề tài");
        }
    }


    public SemesterType findById(Long id){
        return semesterTypeRepository.findById(id)
                .orElseThrow(() -> new MessageException("Không tìm thấy loại đề tài"));
    }


    public Page<SemesterType> findAll(String search, Long semesterId, Pageable pageable){

        if(search == null || search.trim().isEmpty()){
            if(semesterId == null){
                return semesterTypeRepository.findAll(pageable);
            }
            else{
                return semesterTypeRepository.findBySemesterId(semesterId, pageable);
            }
        }
        else{
            search = "%" + search + "%";

            if(semesterId == null){
                return semesterTypeRepository.findByParam(search, pageable);
            }
            else{
                return semesterTypeRepository.findByParamAndSemester(search, semesterId, pageable);
            }
        }
    }

}