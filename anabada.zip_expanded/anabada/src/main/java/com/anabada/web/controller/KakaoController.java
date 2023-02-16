package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anabada.web.service.KakaoService;
import com.anabada.web.vo.KakaoVO;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("*")
public class KakaoController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);

	@Inject
	KakaoService kakao;
	
	//카카오 로그인
	@RequestMapping(value="/member/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(MemberVO vo, Model model, @RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		
		System.out.println(code);
		
		String access_Token = kakao.getAccessToken(code);
		MemberVO userInfo = kakao.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		//어차피 nick 컬럼에 저장 되는 값은 랜덤 문자열이기 때문에 service단에서 name컬럼에 저장된 nickname을 불러와서 확인
		System.out.println("###카카오 로그인할 때 받아오는 nickname값을 name컬럼에 저장#### : " + userInfo.getName());
		System.out.println("###email#### : " + userInfo.getEmail());
		System.out.println("###id### : " + userInfo.getId());
		
		session.setAttribute("member", userInfo);
		session.setAttribute("id", userInfo);
		
		if(userInfo != null) {
			session.setAttribute("member", userInfo);
			session.setAttribute("id", userInfo.getId());
			logger.info("member : " + userInfo);
		}
		
		return "redirect:/";
	}
	
//	// 회원가입 get
//	@RequestMapping(value = "/member/kakaoRegisterView", method = RequestMethod.GET)
//	public void kakaoGetRegister() throws Exception {
//		logger.info("회원가입 get ~ ");
//		
//	}
//		
//	// 회원가입 post
//	@RequestMapping(value = "/member/kakaoRegister", method = RequestMethod.POST)
//	public String kakaoPostRestiger(MemberVO vo, HttpServletRequest req) throws Exception {
//		logger.info("회원가입 post ~ ");
//		service.register(vo);
//			
//		HttpSession session = req.getSession();
//		MemberVO login = service.login(vo);
//			
//		session.setAttribute("member", login);
//		session.setAttribute("id", login);
//		logger.info("회원 가입 후 자동 로그인: " +  login);
//			
//		return "/member/kakaoRegisterEnd";
//	}
//	
//	// 회원가입 완료
//		@RequestMapping(value = "/member/kakaoRegisterEnd")
//		public String kakaoRegisterEnd() throws Exception {
//			logger.info("회원가입 완료 ~ ");
//			
//			return "/member/kakaoRegisterEnd";
//		}
}
