package com.example.boilerplateproj.domain.vue.complaint.controller;

import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import com.example.boilerplateproj.domain.vue.complaint.service.ComplaintService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("complaint")
@CrossOrigin(origins = "http://localhost:8081", allowedHeaders = "*")
public class ComplaintController {

    @Autowired
    private ComplaintService service;

    @GetMapping("/boardType/{boardType}")
    public List<Complaint> jobList (@PathVariable("boardType") String board_type) {
        log.info("jobList()");
        log.info("보드타입: " + board_type);

        List<Complaint> job = service.joblist(board_type);
        log.info(job.toString());
        return job;
    }

    @GetMapping("/all/list")
    public List<Complaint> List () {
        log.info("List()");

        List<Complaint> list = service.list();
        log.info(list.toString());
        return list;
    }


}
