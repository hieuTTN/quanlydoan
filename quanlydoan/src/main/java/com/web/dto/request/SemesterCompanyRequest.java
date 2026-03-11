package com.web.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class SemesterCompanyRequest {

    private Long semesterId;

    private List<SemesterCompanyInsert> semesterCompanyInserts = new ArrayList<>();

    @Getter
    @Setter
    public class SemesterCompanyInsert{

        private Integer maxStudent;

        private Long companyId;
    }

    @Getter
    @Setter
    public class SemesterCompanyUpdate{
        private Long id;
        private Integer maxStudent;
    }

}