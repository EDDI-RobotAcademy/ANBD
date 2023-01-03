package com.anabada.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.JobService;
import com.anabada.web.service.PutInService;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.PutInCriteria;
import com.anabada.web.vo.PutInPageMaker;
import com.anabada.web.vo.PutInVO;

@Controller
@RequestMapping("/putIn/*") 
public class PutInController {
	
	private static final Logger logger = LoggerFactory.getLogger(PutInController.class);
	
	@Inject
	PutInService putInService;
	@Inject
	JobService jobService;
	
	// 알바구인 게시물보고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/putIn_job", method = RequestMethod.GET)
	public String putIn_job(@ModelAttribute JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, HttpServletRequest req, Model model) throws Exception{
		
		logger.info("지원하기 눌렀음");
		model.addAttribute("j_read", jobService.job_view(vo.getJ_bno()));
		model.addAttribute("scri", scri);
		
		return "/putIn/putIn_job";
		
	}
		
	// 알바지원페이지 작성하고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/putIn_done", method = RequestMethod.GET)
	public String putIn_done(@ModelAttribute PutInVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model) throws Exception{
		
		logger.info("지원서 다 썼음!");
		
		System.out.println(vo);
		
		model.addAttribute(model);
		model.addAttribute("scri", scri);
		
		putInService.putIn_job(vo);
					
		return "redirect:/job/job_list"; // 알바 게시판 컨트롤러로 이동
	}
	
	// 해당 구인 게시물의 지원자들 목록 보기. 새로운 페이징 처리 위해 get
	@RequestMapping(value = "/putIn_list", method = RequestMethod.GET)
	public String putIn_list(@ModelAttribute PutInVO putVO, @ModelAttribute JobVO jobVO, @ModelAttribute("cri") PutInCriteria cri, Model model) throws Exception {
		
		logger.info("해당 구인 게시물의 알바 지원자들 목록 보기~~~");
		
		// 알바 구인게시물 번호로 지원자들 목록 불러오기. 페이징 처리도 해야함. 지원자들 많을 수도 있으니
		System.out.println(putVO.getJ_bno()); // 구인게시물 번호
		
		// 페이징 처리
		PutInPageMaker pageMaker = new PutInPageMaker();
		pageMaker.setCri(cri); 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("j_bno", putVO.getJ_bno());
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		// 해당 게시글 번호로 게시글 제목 가져오는 쿼리
		model.addAttribute("j_title",putInService.job_title(putVO.getJ_bno())); 
		model.addAttribute("p_list", putInService.putIn_list(map));
		model.addAttribute("j_bno", putVO.getJ_bno()); // 페이지 유지하기 위해
		model.addAttribute("j_read", jobService.job_view(jobVO.getJ_bno()));
		
		pageMaker.setTotalCount(putInService.putIn_listCount()); // 게시글 총 개수 받아서 페이징 처리함
		System.out.println("총개수: " + putInService.putIn_listCount());
		
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/putIn/putIn_list";
	}

}
