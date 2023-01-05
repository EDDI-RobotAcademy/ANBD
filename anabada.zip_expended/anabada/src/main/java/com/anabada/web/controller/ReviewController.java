package com.anabada.web.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anabada.web.service.ReviewService;
import com.anabada.web.vo.ReviewVO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ReviewService reviewService;
	
	@RequestMapping(value = "/review_register.ajax", method = RequestMethod.GET)
	@ResponseBody
    public void review_register(HttpServletResponse resp, @ModelAttribute ReviewVO reviewVO) throws Exception {
        
		System.out.println("후기" + reviewVO);
		
		boolean result = false;
		
		reviewService.review_register(reviewVO);
		
		result = true;
        
        PrintWriter writer = resp.getWriter();
        resp.setCharacterEncoding("UTF-8"); 
        resp.setContentType("text/html;charset=UTF-8");
        writer.println(result);
    }
	
	@RequestMapping(value = "/review_chk.ajax", method = RequestMethod.GET)	
	@ResponseBody
	public int review_chk(@RequestParam(value="pno") int pno) throws Exception{
		
		int chk = reviewService.review_chk(pno);
		System.out.println("후기남겼는지 체크 1이면 이미 작성한거: " + pno);
		System.out.println(chk);
		
		return chk;
	}
}
