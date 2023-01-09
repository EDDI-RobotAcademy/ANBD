package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.KakaoService;
import com.anabada.web.service.MemberService;
import com.anabada.web.vo.KakaoVO;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	KakaoService kakao;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("회원가입 get ~ ");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("회원가입 post ~ ");
		service.register(vo);
		
		return "redirect:/";
	}
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() throws Exception {
		logger.info("로그인 get ~ ");
	}
	
	// 로그인 post
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	    logger.info("로그인 post ~ ");
	      
	    HttpSession session = req.getSession();
	    MemberVO login = service.login(vo);
	      
	    if (login == null) {
	       session.setAttribute("member", null);
	       session.setAttribute("id", null);
	         
	       rttr.addFlashAttribute("msg", false);
	         
	    } else {
	       session.setAttribute("member", login);
	       session.setAttribute("id", login.getId());
	       
	       logger.info("member: " +  login);
	    }
	      return "redirect:/";
   }
	
	// 회원 정보 수정 get
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		logger.info("회원 정보 수정 get ~ ");
		return "member/memberUpdateView";
	}
	
	// 회원 정보 수정 post
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("회원 정보 수정 post ~ ");
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/"; 
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
			
		return "redirect:/"; 
	}
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		
		System.out.println(code);
		
		String access_Token = kakao.getAccessToken(code);
		KakaoVO userInfo = kakao.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getNickname());
		System.out.println("###email#### : " + userInfo.getAccount_email());
		
		session.setAttribute("kakaoN", userInfo.getNickname());
		session.setAttribute("kakaoE", userInfo.getAccount_email());
		
		if(userInfo.getAccount_email() != null) {
			session.setAttribute("email", userInfo.getAccount_email());
			session.setAttribute("access_Token", access_Token);
		}
		return "redirect:/";
	}
	
	
	
}
