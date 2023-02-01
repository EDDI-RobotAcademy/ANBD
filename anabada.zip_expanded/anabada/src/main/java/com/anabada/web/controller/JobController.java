package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.JobService;
import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.JheartVO;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobPageMaker;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.ResumeVO;

@Controller
@RequestMapping("/job/*") 
public class JobController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobController.class);
	
	@Inject
	JobService jobService;
	
	
	// 알바 구인 게시물 쓰기 눌렀을 때
	@RequestMapping(value = "/job_insert", method = RequestMethod.GET)
	public String job_insert_view(HttpServletRequest req) throws Exception{ // 임의로 내가 아이디줬음
		
		logger.info("알바구인공고 쓰기");
		
		return "/job/job_insert";
	}
	
	// 알바 구인 게시글 등록하기
	@RequestMapping(value = "/job_insert", method = RequestMethod.POST)
	public String job_insert(@ModelAttribute JobVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("알바 구인등록 버튼 누름");
		
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
		jobService.job_insert(vo);
		
		return "redirect:/job/job_list"; 
	}
	
	
	// 알바 게시판 목록 조회
	@RequestMapping(value = "/job_list", method = RequestMethod.GET) // 임의
	public String job_list(Model model, @ModelAttribute JobVO vo, @ModelAttribute("scri")JobSearchCriteria scri) throws Exception{
		
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
	@RequestMapping(value = "/job_read", method = RequestMethod.GET) // job_list.jsp에서 사진 눌러서 상세보기할 때 실행
	public String job_read(JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model, HttpServletRequest req) throws Exception{
		
		logger.info("상세보기 페이지~");
		System.out.println("번호: " + vo.getJ_bno());
		
		// 찜 여부 조회
		Map<String, String> check = new HashMap<String, String>();
		check.put("j_bno", Integer.toString(vo.getJ_bno()));
		check.put("id", (String) req.getSession().getAttribute("id"));
		
		int heart = jobService.job_heartCheck(check);
		
		//model.addAttribute("j_bno", vo.getJ_bno());
		model.addAttribute("j_read", jobService.job_read(vo.getJ_bno())); // 게시글 번호로 게시글 객체 불러옴
		model.addAttribute("scri", scri);
		model.addAttribute("heart", heart);
		System.out.println("상세보기 게시물:" + jobService.job_read(vo.getJ_bno()));
		
		return "/job/job_read";
	}
	
	// 알바 수정 게시물 페이지로 가는거
	@RequestMapping(value = "/job_update", method = RequestMethod.GET)
	public String job_update_view(JobVO vo, @ModelAttribute("scri") JobSearchCriteria scri, Model model) throws Exception{
		
		logger.info("사장이 수정하려고함~~");
		
		model.addAttribute("j_update", jobService.job_read(vo.getJ_bno()));
		model.addAttribute("scri", scri);
		
		return "/job/job_update"; // 수정 페이지로 이동
	}
	
	// 알바 게시글 수정게시글에서 수정 버튼 눌렀을 때 실행
	@RequestMapping(value = "/job_update", method = RequestMethod.POST)
	public String job_update(@ModelAttribute JobVO vo, RedirectAttributes rttr, @RequestParam String d_img) throws Exception{
		
		logger.info("수정완료 버튼 눌렀음");
		System.out.println(d_img);
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
		jobService.job_update(vo);
		
		if(d_img != null || d_img != "") { // 이전 사진 컴퓨터에서 삭제
			File file = null;
			file = new File("C:\\upload\\"+ d_img);
			System.out.println("파일 경로:"+"C:\\upload\\" + d_img);
			file.delete();
		}
		
		rttr.addAttribute("j_bno", vo.getJ_bno());
		
		return "redirect:/job/job_read"; // 컨트롤러로 이동
		// 게시물 상세보기로
	}
	
	// 알바 구인 게시물 삭제할 떄
	@RequestMapping(value = "/job_delete", method = RequestMethod.POST)
	public String job_delete(@ModelAttribute JobVO vo) throws Exception{
		
		logger.info("사장이 삭제버튼 눌렀음"); 
		// 페이징 처리 안해줬음 
		
		//String j_image = jobService.get_image(vo.getJ_bno()); // 디비에 저장된 이미지 이름 불러옴
		
		logger.info("이미지 이름:" + vo.getJ_img());
		String j_image = vo.getJ_img();
		
		jobService.job_delete(vo.getJ_bno()); // 디비 삭제 
		
		if(j_image != null || j_image != "") { // 컴퓨터에서 삭제
			File file = null;
			file = new File("C:\\upload\\"+j_image);
			System.out.println("파일 경로:"+"C:\\upload\\"+j_image);
			file.delete();
		}
				
		return "redirect:/job/job_list"; // 임의
		// 게시판 기본 상태로 돌아감
	}
	
	
	// 게시글에서 찜하기 할때
	@RequestMapping(value = "/addHeart")
	@ResponseBody
	public Map<String, String> job_addHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("addHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int j_bno = Integer.parseInt(param.get("j_bno")); // 좋아요 누른 게시판번호
		jobService.job_addHeart(param); // Heart 테이블에 좋아요 누른 정보 저장
		jobService.job_upHeart(j_bno); // 게시글의 j_heart +1 하기
		hlist.put("hnum", Integer.toString(jobService.job_read(j_bno).getJ_heart())); // 찜한 총 개수

		return hlist;
	}
		
	// 게시글 찜 해제 할때
	@RequestMapping(value = "/subHeart")
	@ResponseBody
	public Map<String, String> subHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("subHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int j_bno = Integer.parseInt(param.get("j_bno")); // 게시판번호
		jobService.job_subHeart(param); // Heart 테이블에 좋아요 누른 정보 삭제
		jobService.job_downHeart(j_bno); // 게시글의 j_heart -1 하기
		hlist.put("hnum", Integer.toString(jobService.job_read(j_bno).getJ_heart()));

		return hlist;
	}
	
	
	
	
	//마이페이지 컨트롤러 만들면 거기에 추가하기
	// 사장이 쓴 구인공고물들 목록 보기
	@RequestMapping(value = "/my_job", method = RequestMethod.GET)
	public String my_jobList(@ModelAttribute JobVO vo, HttpServletRequest req, Model model, @ModelAttribute("cri") JobCriteria cri) throws Exception{
		//NoteCriteria가 10개씩 보여줌. JobCriteria는 16개씩 보여줌
		
		logger.info("사장이 지가 쓴 알바 글 목록 보려고함~~~");
			
		HttpSession session = req.getSession(); // HttpServletRequest는 HttpSession 객체 만드는데 필요
		//아이디 임의로 준거이!!!!!!!!!!!!!!!!!!
		//session.setAttribute("id", "korea");
		String id = (String)session.getAttribute("id");
			
		Map<String, Object> map = new HashMap<String, Object>();
			
		map.put("id", id); // 세션에 저장된 아이디
		map.put("rowStart2", cri.getRowStart2());
		map.put("rowEnd2", cri.getRowEnd2());
		System.out.println(cri.getRowStart() + "하하하하" + cri.getRowEnd());
			
		model.addAttribute("my_jobList", jobService.my_jobList(map)); // 세션에 저장된 아이디와 같은 아이디가 쓴 글 불러움
		System.out.println(jobService.my_jobList(map));
		
		JobPageMaker pageMaker = new JobPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount2(jobService.my_jobListCount(id));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/job/my_job";
	}
		
	// 마이페이지 게시물 삭제 ajax
	@RequestMapping(value = "/delete_chk.ajax", method = RequestMethod.GET)
	@ResponseBody
	public boolean delete_chk(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
			HttpSession session) throws Exception{
			
		logger.info("알바 마이페이지에서 삭제 눌렀음"); 
		// 페이징 처리 안해줬음 
			
		jobService.my_jobDelete(delete_array); // 마이페이지 게시물들 번호 배열로 받아서 삭제
		logger.info("삭제 성공");
		
		boolean result = true;
		return result;
	}
	
	// 알바 찜목록페이지로 가기
	@RequestMapping(value = "/heart_job", method = RequestMethod.GET)
	public String heart_job(HttpSession session, Model model, @ModelAttribute("cri") JobCriteria cri) throws Exception{
		
		logger.info("알바 찜~");
		
		String id = (String)session.getAttribute("id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id); // 세션에 저장된 아이디
		map.put("rowStart2", cri.getRowStart2());
		map.put("rowEnd2", cri.getRowEnd2());
		
		List<JheartVO> list = jobService.heart_jobList(map); // 유저가 찜한 j_bno 받아옴
		List<JobVO> h_list =  new ArrayList<JobVO>(); // 찜 목록 담을 리스트
		
		if(list.size() != 0) { // 찜목록이 있을 때만 실행
			
			for(int i = 0; i < list.size(); i++) {
			    int j_bno = list.get(i).getJ_bno(); 
				JobVO jobVO = jobService.job_read(j_bno);
				h_list.add(jobVO);
			}
			
			model.addAttribute("h_list", h_list);
		}
		
		JobPageMaker pageMaker = new JobPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount2(jobService.heart_jobListCount(id));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/job/heart_job";
		
	}
	
	// 마이페이지 게시물 삭제 ajax
	@RequestMapping(value = "/delete_chk2.ajax", method = RequestMethod.GET)
	@ResponseBody
	public boolean delete_chk2(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
			HttpSession session) throws Exception{
				
		logger.info("찜 목록에서 삭제 눌렀음"); 
		// 페이징 처리 안해줬음 
				
		jobService.heart_delete(delete_array); // 마이페이지 게시물들 번호 배열로 받아서 삭제
		logger.info("삭제 성공");
			
		boolean result = true;
		return result;
	}
	
	// 알바 신고하기 창 뜨게하기
    @RequestMapping(value = "/job_report", method = RequestMethod.GET)
	public String note_report(@RequestParam int j_bno, Model model) throws Exception{
	
		model.addAttribute("j_bno", j_bno);
		
		return "/job/report";
	}
    
    // 알바 디비에 저장하기
    @RequestMapping(value = "/report_insert", method = RequestMethod.GET)
    public String report_insert(@ModelAttribute ComplaintVO vo, Model model) throws Exception{
    	
    	
    	logger.info("알바 신고 디비에 저장하려고 함~~");
    	
    	jobService.report_insert(vo);
    	
    	model.addAttribute("success", "success");
    	
    	
    	return "/job/report";
    }
    
    // 쪽지 신고한적 있는지 체크
    @RequestMapping(value = "/report_chk.ajax", method = RequestMethod.GET)
    @ResponseBody
    public int report_chk(@ModelAttribute ComplaintVO vo) throws Exception{
       
       logger.info("알바 신고 한적 있는지 체크");
       System.out.println(vo);
       
       int result = jobService.report_chk(vo);
       return result;
    }
    
    
    // 관리자가 신고된 알바 게시물 보기
 	@RequestMapping(value = "/complaint_job", method = RequestMethod.GET)
 	public String job_read(JobVO vo, Model model, @RequestParam(value="href") String href) throws Exception{
 		
 		logger.info("관리자가 신고된 알바 게시물 봄!");
 		System.out.println("번호: " + vo.getJ_bno());
 		
 		model.addAttribute("j_read", jobService.job_read(vo.getJ_bno())); // 게시글 번호로 게시글 객체 불러옴
 		model.addAttribute("href", href);
 		
 		return "/job/complaint_job";
 	}
 	
 	// 알바 구인 게시물 삭제할 떄
 	@RequestMapping(value = "/delete_admin.ajax", method =RequestMethod.GET)
	@ResponseBody
 	public boolean delete_admin(@ModelAttribute JobVO vo) throws Exception{
 		
 		logger.info("관리자가 알바 삭제버튼 눌렀음"); 
 		logger.info("이미지 이름:" + vo.getJ_img());
 		
 		String j_image = vo.getJ_img();
 		
 		jobService.job_delete(vo.getJ_bno()); // 디비 삭제 
 		
 		if(j_image != null || j_image != "") { // 컴퓨터에서 삭제
 			File file = null;
 			file = new File("C:\\upload\\"+j_image);
 			System.out.println("파일 경로:"+"C:\\upload\\"+j_image);
 			file.delete();
 		}
 		
 		// 신고내역도 삭제
 		Map<String, Object> map = new HashMap<String, Object>();
 		map.put("c_bno", vo.getJ_bno());
 		map.put("board_type", "job");
 		
 		jobService.delete_complaint(map);
 				
 		boolean result = true;
        return result;
 	}
}
