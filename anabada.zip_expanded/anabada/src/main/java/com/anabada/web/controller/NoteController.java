package com.anabada.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anabada.web.service.EventService;
import com.anabada.web.service.NoteService;
import com.anabada.web.service.ProductService;

import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NotePageMaker;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;
import com.anabada.web.vo.PBoardVO;


@Controller
@RequestMapping("/note/*") 
public class NoteController {

   private static final Logger logger = LoggerFactory.getLogger(NoteController.class);


    }
   
}