package com.example.boilerplateproj.domain.vue.complaint.controller.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.logging.LoggingPermission;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class DetailForm {

    private String c_bno;
    private String boardType;

}
