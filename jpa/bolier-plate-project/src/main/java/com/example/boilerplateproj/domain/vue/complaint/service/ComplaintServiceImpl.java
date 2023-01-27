package com.example.boilerplateproj.domain.vue.complaint.service;

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
    public List<Complaint> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "comNum"));
    }

    @Override
    public List<Complaint> joblist(String board_type) {

        System.out.println("보트타타타입: " + board_type);
        return repository.findAllByBoardType(board_type);

    }
}
