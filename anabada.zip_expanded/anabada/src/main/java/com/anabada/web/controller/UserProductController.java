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
	

	//user가 자기가 쓴 글 목록 보기 
	@RequestMapping(value = "/myBoardList", method=RequestMethod.GET)
	public String myBoardList(HttpServletRequest req, HttpServletResponse res ) throws Exception{
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		List<PBoardVO> list = service.myBoardList(id);
		
		return "";
	}
	
	// user가 자기가 찜한 목록 보기 
	

}
