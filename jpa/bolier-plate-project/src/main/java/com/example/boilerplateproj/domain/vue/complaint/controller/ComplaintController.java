package com.example.boilerplateproj.domain.vue.complaint.controller;

import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintDetails;
import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintRequest;
import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintTotalRequest;
import com.example.boilerplateproj.domain.vue.complaint.controller.request.DetailForm;
import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import com.example.boilerplateproj.domain.vue.complaint.service.ComplaintService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
    @PostMapping("/details")
    public ComplaintDetails details(@RequestBody DetailForm form){
        Long c_bno = Long.parseLong(form.getC_bno())  ;
        String board_type = form.getBoardType();
        log.info("디테일 보기 클릭");
        log.info("타입 : "+board_type + ", c_bno : "+c_bno);

        ComplaintTotalRequest complaintTotal = new ComplaintTotalRequest();
        complaintTotal.setC_bno(c_bno);
        complaintTotal.setBoardType(board_type);
        //총 신고 수
        Long total = service.totalCount(board_type,c_bno);
        complaintTotal.setTotalNum( total );
        //사유별 신고 수
        Long type1, type2,type3,type4,type5, type6,type7;

        if(board_type.equals("pboard")){
            type1 =service.detailCount(board_type,c_bno,"판매 금지 물품 판매");
            type2 = service.detailCount(board_type,c_bno,"홍보,영리목적");
            type3 = service.detailCount(board_type,c_bno,"불법 정보");
            type4=service.detailCount(board_type,c_bno,"음란, 청소년 유해");
            type5=service.detailCount(board_type,c_bno,"사기 글이에요");
            type6=service.detailCount(board_type,c_bno,"도배, 스팸");
            type7 = total -type1-type2-type3-type4-type5-type6;

            complaintTotal.setType1(type1);
            complaintTotal.setType2(type2);
            complaintTotal.setType3(type3);
            complaintTotal.setType4(type4);
            complaintTotal.setType5(type5);
            complaintTotal.setType6(type6);
            complaintTotal.setType7(type7);

        }else {
            type1 =service.detailCount(board_type,c_bno,"욕설, 비방, 차별, 혐오");
            type2 = service.detailCount(board_type,c_bno,"홍보, 영리목적");
            type3 = service.detailCount(board_type,c_bno,"불법 정보");
            type4=service.detailCount(board_type,c_bno,"음란, 청소년 유해");
            type5=service.detailCount(board_type,c_bno,"개인 정보 노출, 유포, 거래");
            type6=service.detailCount(board_type,c_bno,"도배, 스팸");
            type7 = total -type1-type2-type3-type4-type5-type6;

            complaintTotal.setType1(type1);
            complaintTotal.setType2(type2);
            complaintTotal.setType3(type3);
            complaintTotal.setType4(type4);
            complaintTotal.setType5(type5);
            complaintTotal.setType6(type6);
            complaintTotal.setType7(type7);
        }

        // 기타에 해당하는 사유 가져오기
        List<Complaint> list = service.findByReson(board_type,c_bno);
        ComplaintDetails complaintDetails = new ComplaintDetails(complaintTotal, list);
        System.out.println("보드타입 : "+complaintTotal.getBoardType());


        return  complaintDetails;
    }










}
