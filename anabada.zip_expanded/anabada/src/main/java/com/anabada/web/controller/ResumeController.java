package com.anabada.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/resume_chk.ajax", method = RequestMethod.GET)	
	@ResponseBody
	public int resume_chk(@ModelAttribute ResumeVO vo) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", vo.getId());
		map.put("j_bno", vo.getJ_bno());	
		
		int chk = resumeService.resume_chk(map);
		System.out.println(chk);
		
		return chk;
	}
	
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
	public String resume_list(@ModelAttribute ResumeVO resumeVO, @ModelAttribute JobVO jobVO, @ModelAttribute("cri") ResumeCriteria cri, Model model) throws Exception {
		
		logger.info("해당 구인 게시물의 알바 지원자들 목록 보기~~~");
		
		// 알바 구인게시물 번호로 지원자들 목록 불러오기. 페이징 처리도 해야함. 지원자들 많을 수도 있으니
		System.out.println(resumeVO.getJ_bno()); // 구인게시물 번호
		
		// 페이징 처리
		ResumePageMaker pageMaker = new ResumePageMaker();
		pageMaker.setCri(cri); 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("j_bno", resumeVO.getJ_bno());
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		// 해당 게시글 번호로 게시글 제목 가져오는 쿼리
		model.addAttribute("r_list", resumeService.resume_list(map));
		model.addAttribute("j_bno", resumeVO.getJ_bno()); // 페이지 유지하기 위해
		model.addAttribute("j_read", jobService.job_read(jobVO.getJ_bno()));
		
		pageMaker.setTotalCount(resumeService.resume_listCount(resumeVO.getJ_bno())); // 게시글 총 개수 받아서 페이징 처리함
		System.out.println("총개수: " + resumeService.resume_listCount(resumeVO.getJ_bno()));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/resume/resume_list";
	}
	
	// 마이페이지 알바 지원 목록
	@RequestMapping(value = "/my_resume", method = RequestMethod.GET)
	public String my_resume(@ModelAttribute("cri") ResumeCriteria cri, Model model, HttpSession session) throws Exception{
			
		logger.info("내 지원목록 보기");
				
		String id = (String)session.getAttribute("id");		
		
		ResumePageMaker pageMaker = new ResumePageMaker();
		pageMaker.setCri(cri); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		
		List<ResumeVO> mr_list = resumeService.my_resumeList(map);
		model.addAttribute("mr_list", mr_list);
		
		System.out.println("하하하하");
		
		pageMaker.setTotalCount(resumeService.my_resumeListCount(id));
		model.addAttribute("pageMaker", pageMaker);
		
		//알바 게시물 객체도 보여주기 위해서
		int[] jbno_array = new int[mr_list.size()]; 
		System.out.println("하하하하");
		System.out.println(mr_list.size());
		 
		// 알바 지원목록이 있을때만 해당 알바 구인 공고 게시물 번호 배열들을 전달함
		if(mr_list.size() != 0) {
			
			for(int i = 0; i < mr_list.size(); i++) {
			    ResumeVO resumeVO = mr_list.get(i);
				jbno_array[i] = resumeVO.getJ_bno();
			}
			
			List<JobVO> j_list = resumeService.my_resumeJob(jbno_array);
			model.addAttribute("j_list", j_list);
		}
		
		
		return "/resume/my_resume"; // 알바 게시판 컨트롤러로 이동
	}
	
	// 마이페이지 게시물 삭제 ajax
	@RequestMapping(value = "/delete_chk.ajax", method = RequestMethod.GET)
	@ResponseBody
	public void delete_chk(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
		HttpSession session) throws Exception{
				
		logger.info("알바 지원 마이페이지에서 삭제 눌렀음"); 
		// 페이징 처리 안해줬음 
				
		resumeService.my_resumeDelete(delete_array); // 마이페이지 게시물들 번호 배열로 받아서 삭제
			
		logger.info("삭제 성공");
	}
	
	// 마이페이지에서 지원 수정 게시물 페이지로 가는거
	@RequestMapping(value = "/resume_update_view", method = RequestMethod.GET)
	public String resume_update_view(ResumeVO resumeVO, JobVO jobVO, @ModelAttribute("cri") ResumeCriteria cri, Model model) throws Exception{
			
		logger.info("알비 지원 수정하려고함~~");
			
		model.addAttribute("r_read", resumeService.resume_read(resumeVO.getR_bno()));
		model.addAttribute("j_read", jobService.job_read(jobVO.getJ_bno()));
		model.addAttribute("cri", cri);
			
		return "/resume/resume_update"; // 수정 페이지로 이동
	}
	
	//지원 게시물 수정
	@RequestMapping(value = "/resume_update", method = RequestMethod.GET)
	public String resume_update(HttpServletResponse resp, ResumeVO vo, @ModelAttribute("cri") ResumeCriteria cri, Model model) throws Exception{
			
		logger.info("알비 지원 수정 완료 버튼 누름~~");
			
		System.out.println(vo);
		resumeService.resume_update(vo);
			
	    model.addAttribute("cri", cri);
	        
        return "redirect:/resume/my_resume";
	}
	
	
	
}
