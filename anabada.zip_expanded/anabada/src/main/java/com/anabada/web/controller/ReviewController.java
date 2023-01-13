package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    public boolean review_register(HttpServletResponse resp, @ModelAttribute ReviewVO reviewVO) throws Exception {
        
		System.out.println("후기" + reviewVO);
		//review에 해당하는 사람의 새싹점수 반영하기 
		reviewService.updateLev(reviewVO); 
		
		reviewService.review_register(reviewVO);
		
		boolean result = true;
		return result;
    }
	
	@RequestMapping(value = "/review_chk.ajax", method = RequestMethod.GET)	
	@ResponseBody
	public int review_chk(@RequestParam(value="pno") int pno) throws Exception{
		
		int chk = reviewService.review_chk(pno);
		System.out.println("후기남겼는지 체크 1이면 이미 작성한거: " + pno);
		System.out.println(chk);
		
		return chk;
	}
	
	// 이거 임시로 내 홈 만든거
	@RequestMapping(value="/home_test", method = RequestMethod.GET)
	public String home_test(HttpSession session) {
		logger.info("임시로 홈 만듦!!");
		
		session.setAttribute("id", "seoul");
		
		return "/note/home_test";
	}
	
}
