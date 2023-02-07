package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "/member/registerEnd")
	public String RegisterEnd() throws Exception {
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
	
	// 닉네임 업데이트 중복 체크
	@ResponseBody
	@RequestMapping(value="/member/nickUpdateChk")
	public int nickUpdateChk(MemberVO vo) throws Exception {
		logger.info("닉네임 업데이트 중복 체크 post ~ ");
		int result = service.nickUpdateChk(vo);
		return result;
	}
	
	// 로그인 get
	@RequestMapping(value="/member/login", method = RequestMethod.GET)
	public void login() throws Exception {
		logger.info("로그인 get ~ ");
	}
	
	// 로그인 세션 post
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		logger.info("로그인 post ~ ");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		// 세션 유지 시간 설정
		session.setMaxInactiveInterval(-1);
		
		if (login != null) {
			session.setAttribute("member", login);
			session.setAttribute("id", login.getId());
			logger.info("member: " +  login);
			
			return "redirect:/";
			
		} else {
			rttr.addFlashAttribute("msg", false);
			
			return "redirect:/member/login";
		}

	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/"; 
	}
	
	// 아이디 찾기 Get
	@RequestMapping(value="/member/findId", method = RequestMethod.GET)
	public void findId() throws Exception {
		logger.info("아이디 찾기 get ~ ");
	}
	
	// 아이디 찾기 결과
	@RequestMapping(value="/member/resultId")
	public String resultId(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "name") String name, 
		    @RequestParam(required = true, value = "email") String email,
		    MemberVO vo) {

		try {
			vo.setName(name);
			vo.setEmail(email);
			MemberVO memberFind = service.memberFindId(vo);
		    
		    model.addAttribute("vo", memberFind);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생했습니다.");
		}
		 
		return "/member/resultId";
	}
	
	// 비밀번호 찾기 Get
	@RequestMapping(value="/member/findPass", method = RequestMethod.GET)
	public void findPass() throws Exception {
		logger.info("비밀번호 찾기 get ~ ");
	}
	
	// 비밀번호 찾기 결과
	@RequestMapping(value="/member/resultPass")
	public String resultPass(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "id") String id, 
		    @RequestParam(required = true, value = "email") String email,
		    MemberVO vo) {

		try {
			vo.setName(id);
			vo.setEmail(email);
			
			int memberSearch = service.memberPwdCheck(vo);
		    
			if(memberSearch == 0) {
		        model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
		        return "/member/findPass";
		    }
			
			String newPwd = RandomStringUtils.randomAlphanumeric(10);
			vo.setPass(newPwd);
			
			service.findPwdUpdate(vo);
			
			model.addAttribute("newPwd", newPwd);
			
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생했습니다.");
		}
		 
		return "/member/resultPass";
	}

	// 마이페이지
	@RequestMapping(value="/member/myPage")
	public String myPage() throws Exception {
		logger.info("마이페이지 ~ ");
		return "member/myPage";
	}
	
	// 회원 정보 수정 get
	@RequestMapping(value="/member/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		logger.info("회원 정보 수정 get ~ ");
		return "/member/memberUpdateView";
	}
	
	// 회원 정보 수정 post
	@RequestMapping(value="/member/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("회원 정보 수정 post ~ ");
		service.memberUpdate(vo);
		session.invalidate();

		return "redirect:/member/memberUpdateEnd"; 
	}
	
	// 회원 정보 수정 완료
	@RequestMapping(value="/member/memberUpdateEnd", method = RequestMethod.GET)
	public String registerUpdateEnd() throws Exception {
		logger.info("정보 수정 완료 ~ ");
		
		return "/member/memberUpdateEnd";
	}
	
	// 비밀번호 변경 get
	@RequestMapping(value="/member/passUpdateView", method = RequestMethod.GET)
	public String passUpdateView() throws Exception {
		logger.info("비밀번호 변경 페이지 ~ ");
		return "/member/passUpdateView";
	}
	
	// 비밀번호 변경 post
	@RequestMapping(value="/member/passUpdate", method = RequestMethod.POST)
	public String passUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("비밀번호 변경 post ~ ");
		
		service.passUpdate(vo);
		session.invalidate();

		return "redirect:/member/memberUpdateEnd"; 
	}
	
	// 회원 탈퇴 get
	@RequestMapping(value="/member/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/member/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 세션에있는 비밀번호
		String sessionPass = member.getPass();
		// vo로 들어오는 비밀번호
		String voPass = vo.getPass();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/member/memberDeleteEnd";
	}
	
	// 회원 탈퇴 완료
	@RequestMapping(value = "/member/memberDeleteEnd")
	public String memberDeleteEnd() throws Exception {
		logger.info("회원 탈퇴 완료 ~ ");
		
		return "/member/memberDeleteEnd";
	}

}
