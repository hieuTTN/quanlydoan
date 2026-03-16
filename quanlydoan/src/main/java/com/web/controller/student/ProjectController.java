package com.web.controller.student;

import com.web.entity.StudentRegis;
import com.web.entity.User;
import com.web.repository.StudentRegisRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/student")
public class ProjectController {

    @Autowired
    private StudentRegisRepository studentRegisRepository;

    @Autowired
    private UserUtils userUtils;

    @RequestMapping(value = {"/project"}, method = RequestMethod.GET)
    public String project(Model model) {
        User user = userUtils.getUserWithAuthority();
        List<StudentRegis> studentRegis = studentRegisRepository.findByUser(user.getId());
        model.addAttribute("studentRegis",studentRegis);
        return "student/project";
    }

    @RequestMapping(value = {"/project-detail"}, method = RequestMethod.GET)
    public String projectDetail(Model model) {
        User user = userUtils.getUserWithAuthority();
        return "student/project-detail";
    }

}
