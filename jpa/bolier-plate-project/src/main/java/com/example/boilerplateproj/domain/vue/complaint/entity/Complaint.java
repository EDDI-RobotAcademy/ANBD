package com.example.boilerplateproj.domain.vue.complaint.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@ToString
@Table(name="complaint")
@NoArgsConstructor
public class Complaint {

    @Id
    @Column(name = "com_num")
    private Long comNum;

    @Column(name = "id")
    private String id;

    @Column(name = "c_content")
    private String c_content;

    @Column(name = "c_bno")
    private Long c_bno;

    @Column(name = "board_type")
    private String boardType;
}
