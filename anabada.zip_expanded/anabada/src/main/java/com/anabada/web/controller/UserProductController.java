package com.anabada.web.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.UserProductService;
import com.anabada.web.vo.PBoardVO;

@Controller
@RequestMapping("/userProduct/*")
public class UserProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	UserProductService service;
	
	HttpServletRequest req;
	HttpSession session = req.getSession();
	private final String ID = (String) session.getAttribute("id");

	//user가 자기가 쓴 글 목록 보기 
	@RequestMapping(value = "/myBoardList", method=RequestMethod.GET)
	public String myBoardList( ) throws Exception{
		//HttpSession session = req.getSession();
		//String id = (String) session.getAttribute("id");
		List<PBoardVO> list = service.myBoardList(ID);
		
		return "";
	}
	


}
