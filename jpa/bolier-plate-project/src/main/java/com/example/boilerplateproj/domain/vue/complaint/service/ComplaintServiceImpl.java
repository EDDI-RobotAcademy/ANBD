package com.example.boilerplateproj.domain.vue.complaint.service;

import com.example.boilerplateproj.domain.vue.complaint.controller.request.ComplaintRequest;
import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import com.example.boilerplateproj.domain.vue.complaint.repository.ComplaintRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ComplaintServiceImpl implements ComplaintService{

    @Autowired
    ComplaintRepository repository;

    @Override
    public List<Complaint> allList() {

        return repository.findAllComplaint();
    }

    @Override
    public List<Complaint> boardTypelist(String board_type) {

        System.out.println("보트타타타입: " + board_type);
        return repository.findAllByBoardType(board_type);

    }

    @Override
    public void deleteByParameters(String board_type, long c_bno) {
        repository.deleteByParameters(board_type, c_bno);
    }
}
