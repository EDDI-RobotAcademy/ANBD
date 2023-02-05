package com.example.boilerplateproj.domain.vue.complaint.controller.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComplaintTotalRequest {

    private Long comNum;
    private String id;
    private String c_content;



    private Long totalNum; // 총 신고 당한 횟수

    private Long type1;
    private Long type2;
    private Long type3;
    private Long type4;
    private Long type5;
    private Long type6;
    private Long type7;




    private Long c_bno; // 신고 당한 게시물 번호
    private  String boardType; // 보드 타입

}
