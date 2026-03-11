package com.web.dto.request;

import com.web.enums.InternshipType;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class SemesterTypeRequest {

    private Long id;

    private String projectName;

    private String descriptionProject;

    private InternshipType type;

    private Long semesterId;

    private List<SemesterTeacherRequest> semesterTeacherRequests = new ArrayList<>();

    @Getter
    @Setter
    public class SemesterTeacherRequest {

        private Long id;

        private Integer maxStudents;

        private Long teacherId;

    }

}