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
import com.anabada.web.service.ResumeService;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.ResumeCriteria;
import com.anabada.web.vo.ResumePageMaker;
import com.anabada.web.vo.ResumeVO;

@Controller
@RequestMapping("/resume/*") 
public class ResumeController {
	
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Inject
	ResumeService resumeService;
	@Inject
	JobService jobService;
	
	// 알바구인 게시물보고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/resume_insert", method = RequestMethod.GET)
	public String resume_insert_view(@ModelAttribute JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, HttpServletRequest req, Model model) throws Exception{
		
		logger.info("지원하기 눌렀음");
		model.addAttribute("j_read", jobService.job_read(vo.getJ_bno()));
		model.addAttribute("scri", scri);
		
		return "/resume/resume_insert";
		
	}
		
	// 알바지원페이지 작성하고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/resume_insert", method = RequestMethod.POST)
	public String resume_insert(@ModelAttribute ResumeVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model) throws Exception{
		
		logger.info("지원서 다 썼음!");
		
		System.out.println(vo);
		
		model.addAttribute(model);
		model.addAttribute("scri", scri);
		
		resumeService.resume_insert(vo);
					
		return "redirect:/job/job_list"; // 알바 게시판 컨트롤러로 이동
	}
	
	// 해당 구인 게시물의 지원자들 목록 보기. 새로운 페이징 처리 위해 get
	@RequestMapping(value = "/resume_list", method = RequestMethod.GET)
	public String resume_list(@ModelAttribute ResumeVO putVO, @ModelAttribute JobVO jobVO, @ModelAttribute("cri") ResumeCriteria cri, Model model) throws Exception {
		
		logger.info("해당 구인 게시물의 알바 지원자들 목록 보기~~~");
		
		// 알바 구인게시물 번호로 지원자들 목록 불러오기. 페이징 처리도 해야함. 지원자들 많을 수도 있으니
		System.out.println(putVO.getJ_bno()); // 구인게시물 번호
		
		// 페이징 처리
		ResumePageMaker pageMaker = new ResumePageMaker();
		pageMaker.setCri(cri); 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("j_bno", putVO.getJ_bno());
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		// 해당 게시글 번호로 게시글 제목 가져오는 쿼리
		model.addAttribute("r_list", resumeService.resume_list(map));
		model.addAttribute("j_bno", putVO.getJ_bno()); // 페이지 유지하기 위해
		model.addAttribute("j_read", jobService.job_read(jobVO.getJ_bno()));
		
		pageMaker.setTotalCount(resumeService.resume_listCount(putVO.getJ_bno())); // 게시글 총 개수 받아서 페이징 처리함
		System.out.println("총개수: " + resumeService.resume_listCount(putVO.getJ_bno()));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/resume/resume_list";
	}

}
