package com.anabada.web.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "http://localhost:8081", allowedHeaders = "*")
public class VueTestController {
   
   @RequestMapping(value = "/vue/data/test", method = RequestMethod.GET)
   public void dataSendTest () {
      System.out.println("통신 성공!");
   }

}