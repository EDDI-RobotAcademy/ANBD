package com.example.boilerplateproj.domain.vue.complaint.controller.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Id;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class ComplaintRequest {

    private Long c_bno;

    private String boardType;

}

