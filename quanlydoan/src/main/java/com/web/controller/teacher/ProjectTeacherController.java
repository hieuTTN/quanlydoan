package com.web.controller.teacher;

import com.web.entity.SemesterTeacher;
import com.web.entity.StudentRegis;
import com.web.entity.User;
import com.web.entity.WorkProcess;
import com.web.exception.MessageException;
import com.web.repository.SemesterTeacherRepository;
import com.web.repository.StudentRegisRepository;
import com.web.repository.WorkProcessRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class ProjectTeacherController {

    @Autowired
    private SemesterTeacherRepository semesterTeacherRepository;

    @Autowired
    private StudentRegisRepository studentRegisRepository;

    @Autowired
    private WorkProcessRepository workProcessRepository;

    @Autowired
    private UserUtils userUtils;

    @RequestMapping(value = {"/project"}, method = RequestMethod.GET)
    public String project(Model model) {
        User user = userUtils.getUserWithAuthority();
        List<SemesterTeacher> semesterTeachers = semesterTeacherRepository.findByTeacher(user.getId());
        model.addAttribute("semesterTeachers",semesterTeachers);
        return "teacher/project/project";
    }

    @RequestMapping(value = {"/project-detail/{id}"}, method = RequestMethod.GET)
    public String projectDetail(Model model, @PathVariable("id") Long id) {
        SemesterTeacher semesterTeacher = semesterTeacherRepository.findById(id).orElseThrow(()->new MessageException("Không tìm thấy đề tài thực tập"));
        List<StudentRegis> studentRegis = studentRegisRepository.findBySemesterTeacher(id);
        List<WorkProcess> workProcesses = workProcessRepository.findBySemesterTeacherId(id);
        model.addAttribute("semesterTeacher",semesterTeacher);
        model.addAttribute("studentRegis",studentRegis);
        model.addAttribute("workProcesses",workProcesses);
        model.addAttribute("semesterTeacherId",id);
        return "teacher/project/project-detail";
    }

}
