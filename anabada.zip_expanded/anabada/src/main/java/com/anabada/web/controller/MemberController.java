package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.MemberService;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	// 회원가입 동의 get
	@RequestMapping(value = "/member/registerAgree", method = RequestMethod.GET)
	public void getRegisterAgree() throws Exception {
		logger.info("회원가입 동의 ~ ");

	}
	
	// 회원가입 동의 post
	@RequestMapping(value = "/member/registerAgree", method = RequestMethod.POST)
	public String postRegisterAgree() throws Exception {
		logger.info("회원가입 동의 ~ ");
		
		return "/member/registerView";
	}
	
	// 회원가입 get
	@RequestMapping(value = "/member/registerView", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("회원가입 get ~ ");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, HttpServletRequest req) throws Exception {
		logger.info("회원가입 post ~ ");
		service.register(vo);
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		session.setAttribute("member", login);
		session.setAttribute("id", login);
		logger.info("회원 가입 후 자동 로그인: " +  login);
		
		return "/member/registerEnd";
	}
	
	// 회원가입 완료
	@RequestMapping(value = "/member/registerEnd", method = RequestMethod.GET)
	public String getRegisterEnd() throws Exception {
		logger.info("회원가입 완료 ~ ");
		
		return "/member/registerEnd";
	}
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/member/idChk")
	public int idChk(MemberVO vo) throws Exception {
		logger.info("아이디 중복 체크 post ~ ");
		int result = service.idChk(vo);
		return result;
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="/member/nickChk")
	public int nickChk(MemberVO vo) throws Exception {
		logger.info("닉네임 중복 체크 post ~ ");
		int result = service.nickChk(vo);
		return result;
	}
	
	// 로그인 get
	@RequestMapping(value="/member/login", method = RequestMethod.GET)
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
			session.setAttribute("id", login);
			logger.info("member: " +  login);
		}
		return "redirect:/";
	}
	
	// 회원 정보 수정 get
	@RequestMapping(value="/member/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		logger.info("회원 정보 수정 get ~ ");
		return "member/memberUpdateView";
	}
	
	// 회원 정보 수정 post
	@RequestMapping(value="/member/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("회원 정보 수정 post ~ ");	
		service.memberUpdate(vo);
		session.invalidate();
		
		return "redirect:/"; 
	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
			
		return "redirect:/"; 
	}
	
	// 마이페이지
	@RequestMapping(value="/member/myPage")
	public String myPage() throws Exception {
		logger.info("마이페이지 get ~ ");
		return "member/myPage";
	}

}
