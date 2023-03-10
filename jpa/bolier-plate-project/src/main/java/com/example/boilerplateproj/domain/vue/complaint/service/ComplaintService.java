package com.example.boilerplateproj.domain.vue.complaint.service;

import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintRequest;
import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;

import java.util.List;

public interface ComplaintService {

    public List<Complaint> allList();

    public List<Complaint> boardTypelist(String board_type);

    public void deleteByParameters(String board_type, long c_bno);

    public Long totalCount(String boardType, long c_bno);

    public Long detailCount(String boardType, long c_bno, String c_content );

    public List<Complaint> findByReson(String boardType,long c_bno);
}
