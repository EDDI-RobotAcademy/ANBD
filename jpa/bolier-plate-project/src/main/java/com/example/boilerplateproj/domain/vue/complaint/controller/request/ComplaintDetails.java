package com.example.boilerplateproj.domain.vue.complaint.controller.request;

import com.example.boilerplateproj.domain.vue.complaint.entity.Complaint;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;


@Getter
@Setter
@ToString
@AllArgsConstructor
public class ComplaintDetails {

    ComplaintTotalRequest complaintTotalRequest;
    List<Complaint> list ;



}
