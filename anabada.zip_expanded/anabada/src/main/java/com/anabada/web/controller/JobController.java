package com.anabada.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.JobService;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobPageMaker;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

@Controller
@RequestMapping("/job/*") 
public class JobController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobController.class);
	
	@Inject
	JobService jobService;
	
	
	// 알바 구인 게시물 쓰기 눌렀을 때
	@RequestMapping(value = "/writeView_boss", method = RequestMethod.GET)
	public String write_boass_view(HttpServletRequest req) throws Exception{ // 임의로 내가 아이디줬음
		
		logger.info("write_boss_view");
		
		return "/job/write_boss";
	}
	
	// 알바 구인 게시글 등록하기
	@RequestMapping(value = "/write_boss", method = RequestMethod.POST)
	public String write_boss(@ModelAttribute JobVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("write_boss");
		
		System.out.println(vo.getJ_uploadImg()); // 저장한 파일 해쉬코드나옴
		MultipartFile uploadImg = vo.getJ_uploadImg(); // 업로드한 이미지 불러옴. 이미지 선택안해도 아래와 같이 저장됨
		// org.springframework.web.multipart.commons.CommonsMultipartFile@70f4eb58
		
		String imgName = uploadImg.getOriginalFilename(); // 진짜이미지이름 추출(확장자)
		System.out.println(imgName);
		
		if(imgName.lastIndexOf(".") > 0) { // 이미지 선택했다면 확장자때문에 .가 존재. 여기서 이미지 존재하지는 여부 확인
			String imgExtension = imgName.substring(imgName.lastIndexOf("."),imgName.length());// 확장자 추출
			
			String uploadFolder = "C:\\upload"; // 업로드할 폴더 경로

			/*
			파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		    업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
			타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
			고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
			*/
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열: " + uniqueName + ", 확장자명: " + imgExtension);
			uploadImg.transferTo(new File(uploadFolder+"\\"+uniqueName + imgExtension)); // 해당 경로에 폴더 업로드
			vo.setJ_img(uniqueName + imgExtension); // 빈에 이미지 이름 저장
		}
		
		System.out.println(vo);
		jobService.write_boss(vo);
		
		return "redirect:/job/job_list"; 
	}
	
	
	// 알바 게시판 목록 조회
	@RequestMapping(value = "/job_list", method = RequestMethod.GET) // 임의
	public String job_list(Model model, @ModelAttribute JobVO vo, HttpServletRequest req, @ModelAttribute("scri")JobSearchCriteria scri) throws Exception{
		
		logger.info("게시판 보기 눌렀음");
		
		model.addAttribute("j_list", jobService.job_list(scri));// 한 페이지에 출력될 게시물 객체들(단어 검색했을 때도 포함)
		System.out.println("알바 게시판:" + jobService.job_list(scri));
		
		JobPageMaker pageMaker = new JobPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(jobService.job_listCount(scri)); // 게시글 총 개수 받아서 페이징 처리함
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/job/job_list";
	}
	
	// 알바 구인 게시물 상세보기 페이지로 가는거
	@RequestMapping(value = "/job_readView", method = RequestMethod.GET) // job_list.jsp에서 사진 눌러서 상세보기할 때 실행
	public String job_readView(JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model, HttpServletRequest req) throws Exception{
		
		logger.info("상세보기 페이지~");
		System.out.println("번호: " + vo.getJ_bno());
		
		// 찜 여부 조회
		Map<String, String> check = new HashMap<String, String>();
		check.put("j_bno", Integer.toString(vo.getJ_bno()));
		check.put("id", (String) req.getSession().getAttribute("id"));
		
		int heart = jobService.heartCheck(check);
		
		//model.addAttribute("j_bno", vo.getJ_bno());
		model.addAttribute("j_read", jobService.job_view(vo.getJ_bno())); // 게시글 번호로 게시글 객체 불러옴
		model.addAttribute("scri", scri);
		model.addAttribute("heart", heart);
		System.out.println("상세보기 게시물:" + jobService.job_view(vo.getJ_bno()));
		
		return "/job/job_read";
	}
	
	// 알바 수정 게시물 페이지로 가는거
	@RequestMapping(value = "/updateView_boss", method = RequestMethod.GET)
	public String updateView_boss(JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model) throws Exception{
		
		logger.info("사장이 수정하려고함~~");
		
		model.addAttribute("j_update", jobService.job_view(vo.getJ_bno()));
		model.addAttribute("scri", scri);
		
		return "/job/update_boss"; // 수정 페이지로 이동
	}
	
	// 알바 게시글 수정게시글에서 수정 버튼 눌렀을 때 실행
	@RequestMapping(value = "/update_boss", method = RequestMethod.POST)
	public String update_boss(@ModelAttribute JobVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("수정완료 버튼 눌렀음");
		
		System.out.println(vo);
		
		MultipartFile uploadImg = vo.getJ_uploadImg(); // 업로드한 이미지 불러옴. 이미지 선택안해도 아래와 같이 저장됨
		// org.springframework.web.multipart.commons.CommonsMultipartFile@70f4eb58
		
		String imgName = uploadImg.getOriginalFilename(); // 이미지이름 추출
		
		if(imgName.lastIndexOf(".") > 0) { // 이미지 선택했다면 확장자때문에 .가 존재. 여기서 이미지 존재하지는 여부 확인
			String imgExtension = imgName.substring(imgName.lastIndexOf("."),imgName.length());// 확장자 추출
			
			String uploadFolder = "C:\\upload"; // 업로드할 폴더 경로

			/*
			파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		    업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
			타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
			고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
			*/
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열: " + uniqueName + ", 확장자명: " + imgExtension);
			uploadImg.transferTo(new File(uploadFolder+"\\"+uniqueName + imgExtension)); // 해당 경로에 폴더 업로드
			vo.setJ_img(uniqueName + imgExtension); // 빈에 이미지 이름 저장
		}
		System.out.println(vo);
		jobService.update_boss(vo);
		
		rttr.addAttribute("j_bno", vo.getJ_bno());
		
		return "redirect:/job/job_readView"; // 컨트롤러로 이동
		// 게시물 상세보기로
	}
	
	// 알바 구인 게시물 삭제할 떄
	@RequestMapping(value = "/delete_boss", method = RequestMethod.POST)
	public String delete_boss(@ModelAttribute JobVO vo) throws Exception{
		
		logger.info("사장이 삭제버튼 눌렀음"); 
		// 페이징 처리 안해줬음 
		
		//String j_image = jobService.get_image(vo.getJ_bno()); // 디비에 저장된 이미지 이름 불러옴
		
		logger.info("이미지 이름:" + vo.getJ_img());
		String j_image = vo.getJ_img();
		
		jobService.delete_boss(vo.getJ_bno()); // 디비 삭제 
		
		if(j_image != null || j_image != "") {
			File file = null;
			file = new File("C:\\upload\\"+j_image);
			System.out.println("파일 경로:"+"C:\\upload\\"+j_image);
			file.delete();
		}
				
		return "redirect:/job/job_list"; // 임의
		// 게시판 기본 상태로 돌아감
	}
	
	// 사장이 쓴 구인공고물들 목록 보기
	@RequestMapping(value = "/my_jobList", method = RequestMethod.GET)
	public String my_jobList(@ModelAttribute JobVO vo, HttpServletRequest req, Model model,@ModelAttribute("cri") JobCriteria cri) throws Exception{
		
		logger.info("사장이 지가 쓴 알바 글 목록 보려고함~~~");
		
		HttpSession session = req.getSession(); // HttpServletRequest는 HttpSession 객체 만드는데 필요
		//아이디 임의로 준거이!!!!!!!!!!!!!!!!!!
		//session.setAttribute("id", "korea");
		String id = (String)session.getAttribute("id");
		
		if(id == null) { // 로그인안했으면 바로 my_jobWrite.jsp가서 스크립트 실행해서 뒤로 보냄
			model.addAttribute("id", id);
			return "/job/my_jobWrite";
		}
		
		System.out.println("로그인한 아이디:" + id);
		
		//
		JobPageMaker pageMaker = new JobPageMaker();
		pageMaker.setCri(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id); // 세션에 저장된 아이디
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		model.addAttribute("my_jobList", jobService.my_jobList(map)); // 세션에 저장된 아이디와 같은 아이디가 쓴 글 불러움
		System.out.println(jobService.my_jobList(map));
		
		pageMaker.setTotalCount(jobService.my_jobListCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		System.out.println(pageMaker);
		
		return "/job/my_jobWrite";
	}
	
	// 게시글에서 찜하기 할때

	@RequestMapping(value = "/addHeart")
	@ResponseBody
	public Map<String, String> addHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("addHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int j_bno = Integer.parseInt(param.get("j_bno")); // 좋아요 누른 게시판번호
		jobService.addHeart(param); // Heart 테이블에 좋아요 누른 정보 저장
		jobService.upHeart(j_bno); // 게시글의 j_heart +1 하기
		hlist.put("hnum", Integer.toString(jobService.job_view(j_bno).getJ_heart())); // 찜한 총 개수

		return hlist;
	}
		
	// 게시글 찜 해제 할때
	@RequestMapping(value = "/subHeart")
	@ResponseBody
	public Map<String, String> subHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("subHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int j_bno = Integer.parseInt(param.get("j_bno")); // 게시판번호
		jobService.subHeart(param); // Heart 테이블에 좋아요 누른 정보 삭제
		jobService.downHeart(j_bno); // 게시글의 j_heart -1 하기
		hlist.put("hnum", Integer.toString(jobService.job_view(j_bno).getJ_heart()));

		return hlist;
	}

	
	
	
	
}
