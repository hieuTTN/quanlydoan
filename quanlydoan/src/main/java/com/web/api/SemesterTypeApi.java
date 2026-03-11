package com.web.api;

import com.web.dto.request.SemesterTypeRequest;
import com.web.entity.SemesterType;
import com.web.service.SemesterTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/semester-type")
public class SemesterTypeApi {

    @Autowired
    private SemesterTypeService semesterTypeService;


    @PostMapping("/admin/create-update")
    public SemesterType createUpdate(@RequestBody SemesterTypeRequest request){
        return semesterTypeService.save(request);
    }


    @GetMapping("/public/find-all")
    public Page<SemesterType> findAll(Pageable pageable, @RequestParam(required = false) String search
            , @RequestParam(required = false) Long semesterId){
        return semesterTypeService.findAll(search,semesterId, pageable);
    }


    @GetMapping("/public/find-by-id")
    public SemesterType findById(@RequestParam Long id){
        return semesterTypeService.findById(id);
    }


    @DeleteMapping("/admin/delete")
    public Map<String,String> delete(@RequestParam Long id){
        return semesterTypeService.delete(id);
    }

}