package com.example.boilerplateproj.domain.vue.complaint.controller;

import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintRequest;
import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import com.example.boilerplateproj.domain.vue.complaint.service.ComplaintService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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

        List<Complaint> boardTypeList = service.boardTypelist(board_type);
        log.info(boardTypeList.toString());
        return boardTypeList;
    }

    @GetMapping("/all/list")
    public List<Complaint> List () {
        log.info("List()");

        //List<Complaint> list = service.list();
        List<Complaint> list = service.allList();
        log.info(list.toString());
        return list;
    }

    @GetMapping("/delete/{c_bno}/{boardType}")
    public void delete(@PathVariable("boardType") String board_type, @PathVariable("c_bno") long c_bno) {
        log.info("하하하하하");

        log.info(board_type + c_bno);


        // 삭제할 게시글 번호, 게시글 유형 받아서 삭제
        if(board_type != null && c_bno != 0){
            service.deleteByParameters(board_type, c_bno);
        }
    }

}
