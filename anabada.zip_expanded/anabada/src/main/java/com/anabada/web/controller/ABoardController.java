package com.anabada.web.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.ABoardService;
import com.anabada.web.service.ALikeService;
import com.anabada.web.service.AReplyService;
import com.anabada.web.service.ComplaintService;
import com.anabada.web.service.JobService;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.APageMaker;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("/a_board/*")
public class ABoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ABoardController.class);
	
	private static final String JOB_IMG_PATH = "C:\\upload\\"; // 알바 게시판 사진경로 
	
	@Inject
	ABoardService service;
	
	@Inject
	AReplyService replyService;
	
	@Inject
	ALikeService likeService;
	
	@Inject
	ComplaintService complaintService;

	@Inject
	JobService jobService;

	
	// 게시판글 작성 화면
	// 리턴값이랑 경로랑 같다면 안적어줘도 됨
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {

		logger.info("writeView");
	}

	//게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeView(ABoardVO boardVO) throws Exception {

		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/a_board/list";
		// redirect는 컨트롤러 주소를 찾아감
	}
	
	//ckeditor 파일 업로드 
		 @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
		    public void imageUpload(Model model, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile
		    		, @RequestParam MultipartFile upload) throws Exception{
		    	// 랜덤 문자 생성
		    	UUID uid = UUID.randomUUID();
		    	
		    	OutputStream out = null;
		    	PrintWriter printWriter = null;
		    	
		    	//인코딩
		    	response.setCharacterEncoding("utf-8");
		    	response.setContentType("text/html;charset=utf-8");
		    	try{
		    		//파일 이름 가져오기
		    		String fileName = upload.getOriginalFilename();
		    		byte[] bytes = upload.getBytes();
		    		
		    		//이미지 경로 생성
		    		String path = "C:\\ckeditor_upload_" + "ckImage/";
		    		String ckUploadPath = path + uid + "_" + fileName;
		    		File folder = new File(path);
		    		System.out.println("path111 : " + path);	// 이미지 저장경로 console에 확인
		    		
		    		//해당 디렉토리 확인
		    		if(!folder.exists()){
		    			try{
		    				folder.mkdirs(); // 폴더 생성
		    		}catch(Exception e){
		    			e.getStackTrace();
		    		}
		    	}
		    	
		    	out = new FileOutputStream(new File(ckUploadPath));
		    	out.write(bytes);
		    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
		    	System.out.println(1);
		    	String callback = request.getParameter("CKEditorFuncNum");
		    	printWriter = response.getWriter();
		    	String fileUrl = "/a_board/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
		    	System.out.println(2);
		    	// 업로드시 메시지 출력
		    	printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
		    	System.out.println(3);
		    	printWriter.flush();
		    	System.out.println(4);
		    	
		    	}
		    	catch(IOException e){
		    		e.printStackTrace();
		    	} 
		    	finally {
		    		try {
		    		if(out != null) { out.close(); }
		    		if(printWriter != null) { printWriter.close(); }
		    	} 
		    		catch(IOException e) { e.printStackTrace(); }
		    	}
		    	System.out.println(5);
		    	return;
		    }

		 	//서버로 전송된 이미지 뿌려주기
		    @RequestMapping(value = "/ckImgSubmit")
		    public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value="fileName") String fileName
		    		, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		    	System.out.println("여깅여기");
		    	//서버에 저장된 이미지 경로
		    	String path = "C:\\ckeditor_upload_" + "ckImage/"; // 저장된 이미지 경로
		    	System.out.println("path2222 : " + path);
		    	String sDirPath = path + uid + "_" + fileName;
		    	
		    	File imgFile = new File(sDirPath);
		    	
		    	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		    	if(imgFile.isFile()) {
		    		byte[] buf = new byte[1024];
		    		int readByte = 0;
		    		int length = 0;
		    		byte[] imgBuf = null;
		    		
		    		FileInputStream fileInputStream = null;
		    		ByteArrayOutputStream outputStream = null;
		    		ServletOutputStream out = null;
		    		
		    		try {
		    			fileInputStream = new FileInputStream(imgFile);
		    			outputStream = new ByteArrayOutputStream();
		    			out = response.getOutputStream();
		    			
		    			while((readByte = fileInputStream.read(buf)) != -1){
		    				outputStream.write(buf, 0, readByte); 
		    			}
		    			
		    			imgBuf = outputStream.toByteArray();
		    			length = imgBuf.length;
		    			out.write(imgBuf, 0, length);
		    			out.flush();
		    			
		    		}
		    		catch(IOException e){
		    			e.printStackTrace();
		    		}
		    		finally {
		    			outputStream.close();
		    			fileInputStream.close();
		    			out.close();
		   			}
		   		}
		    }

	//게시판 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req, @RequestParam(value = "loca", required = false) String loca) throws Exception {

		logger.info("게시판 목록 보기");
		
		model.addAttribute("list", service.list(scri));
		
		APageMaker pageMaker = new APageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/a_board/list";
	}
	
		//게시판 목록
		@RequestMapping(value = "/loca_list", method = RequestMethod.GET)
		public String loca_list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req, @RequestParam(value = "loca", required = false) String loca) throws Exception {

			logger.info("게시판 목록 보기");
			
			model.addAttribute("list", service.list(scri));
			
			APageMaker pageMaker = new APageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/a_board/loca_list";
		}

	//게시글 상세보기
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(Model model, ABoardVO boardVO, ALikeVO likeVO, MemberVO memberVO,
			@ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req) throws Exception {
		
		logger.info("게시글 상세보기");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		logger.info("id : " + id);
		
		String str = service.read(boardVO.getA_bno()).getA_content();
		Pattern pattern = Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
		Matcher matcher = pattern.matcher(str);
		
		while(matcher.find()) {
			System.out.println(matcher.group(1));
		}
		
		model.addAttribute("str", str);
		model.addAttribute("read", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);
		
		List<AReplyVO> replyList = replyService.readReply(boardVO.getA_bno());
		model.addAttribute("replyList", replyList);
		
		Map<String, String> likeChk = new HashMap<>();
		
		likeChk.put("id", id);
		likeChk.put("a_bno", Integer.toString(boardVO.getA_bno()));
		
		logger.info("likeChk : " + likeChk);

		int Chk = likeService.likeCheck(likeChk);

		//좋아요 여부 체크 좋아요 했으면 1, 좋아요 없으면 0
		model.addAttribute("Chk", Chk);

		logger.info("Chk : " + Chk);

		return "/a_board/readView";
	}

	
	//게시글 수정 화면
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(Model model, ABoardVO boardVO, MemberVO memberVO, @ModelAttribute("scri") ASearchCriteria scri) throws Exception {
		logger.info("게시글 수정하기 뷰페이지");
		
		model.addAttribute("update", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);

		return "a_board/updateView";
	}


	//게시글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("게시글 수정 완료");
		
		service.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());
		
		return "redirect:/a_board/list";
	}

	//게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("게시글 삭제 완료");
		
		service.delete(boardVO.getA_bno());

		//신고 내역 삭제
		Map<String, Object> map = new HashMap<>();
		
		map.put("c_bno", boardVO.getA_bno());
		map.put("board_type", "a_board");
		
		complaintService.delete_complaint(map);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());
		
		return "redirect:/a_board/list";
	}

	//좋아요 추가
	@RequestMapping(value = "/insertLike", method = RequestMethod.POST)
	public @ResponseBody String insertLike(ABoardVO boardVO, ALikeVO likeVO, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "a_bno", required = false) int a_bno, 
			HttpServletRequest request, Model model) throws Exception {
		System.out.println("잘 넘어는지 확인");
		
		Map<String, String> bnoId = new HashMap<>();
		
		bnoId.put("id", id);
		bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));

		likeService.insertLike(bnoId);

		int likeCnt = likeService.updateLike(likeVO.getA_bno());
		model.addAttribute("read", likeCnt);

		return "redirect:/a_board/readView";
	}

	//좋아요 삭제
	@RequestMapping(value = "/deleteLike", method = RequestMethod.POST)
	public @ResponseBody String deleteLike(ABoardVO boardVO, ALikeVO likeVO, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "a_bno", required = false) int a_bno, 
			HttpServletRequest request) throws Exception {
		
		Map<String, String> bnoId = new HashMap<>();
		
		bnoId.put("id", id);
		bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));

		likeService.deleteLike(bnoId);
		likeService.deleteIsLike(likeVO.getA_bno());

		return "redirect:/a_board/readView";
	}

	//신고 팝업 띄우기
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Model model, @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {
		
		model.addAttribute("a_bno", a_bno);
		return "a_board/report";
	}

	//신고 사유 선택 유효성 검사 팝업 띄우기
	@RequestMapping(value = "/reportError", method = RequestMethod.GET)
	public String reportError() throws Exception {
		return "a_board/reportError";
	}
	
	//게시글 신고 DB 저장까지
	@RequestMapping(value = "/reportComplaint", method = RequestMethod.GET)
	public String reportComplaint(Model model, ComplaintVO complaintVO) throws Exception {
		logger.info("게시글 신고");
		
		service.reportComplaint(complaintVO);
		
		return "a_board/report";
	}
	
	//마이페이지 내가 쓴 글 목록 
	@RequestMapping(value = "/myWriteList", method = RequestMethod.GET)
	public String myWriteList(Model model, ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		scri.setId(id);
		
		APageMaker pageMaker = new APageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.writeListCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("myWriteList", service.myWriteList(scri));
		
		return "a_board/myWriteList";
	}

		//게시글 신고 내역 상세보기
		@RequestMapping(value = "/complaintReadView", method = RequestMethod.GET)
		public String complaintRead(Model model, ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req,
				@RequestParam(value = "href") String href) throws Exception {
			
			logger.info("게시글 상세보기");
			
			model.addAttribute("read", service.complaintRead(boardVO.getA_bno()));
			model.addAttribute("scri", scri);
			model.addAttribute("href", href);
			
			
			return "/a_board/complaintReadView";
		}
		
		//관리자가 신고된 게시글 삭제
		@RequestMapping(value = "/admin_delete", method = RequestMethod.GET)
		@ResponseBody
		public boolean admin_delete(@ModelAttribute ABoardVO boardVO, @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {

			logger.info("관리자가 신고된 게시글 삭제");
			
			//신고 게시글 삭제
			service.delete(a_bno);
			
			//신고 내역 삭제
			Map<String, Object> map = new HashMap<>();
			
			map.put("c_bno", a_bno);
			map.put("board_type", "a_board");
			
			complaintService.delete_complaint(map);
			
			//신고된 게시글 작성자 경고 횟수 조회(caution값 조회)
			System.out.println("id : " + boardVO.getId());
			int count = complaintService.count_caution(boardVO.getId());
			
			if(count < 4) {
				complaintService.add_caution(boardVO.getId());
				
				String content = "회원님의 커뮤니티 게시물 '" + boardVO.getA_title() + "'은 부적접한 사유로 인해 삭제되었습니다."
	 					+ "\n회원님은 누적 경고수는 " + ++count + "입니다."
	 					+ "\n누적 경고수가 5가 되면 회원 강제 탈퇴가 이루어집니다.";
			
				Map<String, Object> map2 = new HashMap<>();
				
				map2.put("n_receiver", boardVO.getId());
				map2.put("n_content", content);
				
				complaintService.note_caution(map2);
			}
			else {
				String email = complaintService.expel_email(boardVO.getId());
				
				//회원 탈퇴시키기 전에 알바 게시물 관련 이미지 서버에서 먼저 삭제
	 			List img_list = jobService.img_list(boardVO.getId());
	 			
	 			if(img_list != null || !img_list.isEmpty()) { // 사진이 있다면 삭제
	 				
	 				for(int i = 0; i < img_list.size(); i++) {
	 					File file = null;
	 					file = new File(JOB_IMG_PATH + img_list.get(i));
	 					file.delete();
	 				}
	 			}
				
				
				complaintService.expel_member(boardVO.getId());
				complaintService.insert_email(email);
				
			}
			boolean result = true;
			return result;
		}
		
		//게시글 삭제 유효성 검사
		@RequestMapping(value = "/deleteChk", method = RequestMethod.GET)
		public @ResponseBody int deleteChk(@RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {
			
			System.out.println("게시글 상세보기 시 삭제된 게시물인지 확인");
			int result = service.deleteChk(a_bno);
			System.out.println("a_bno : " + result);
			
			return result;
		}
		
		//게시글 신고 유효성 검사
		@RequestMapping(value = "/complaintChk", method = RequestMethod.GET)
		public @ResponseBody int complaintChk (@RequestParam(value = "id") String id, @RequestParam(value = "a_bno") int a_bno, 
				@RequestParam(value = "a_board", required = false) String a_board) throws Exception {
			logger.info("신고 유효성 검사");
			
			Map<String, String> comChk = new HashMap<>();
			
			comChk.put("id", id);
			comChk.put("c_bno", Integer.toString(a_bno));
			comChk.put("board_type", a_board);
			
			int result = service.complaintChk(comChk);
			
			return result;
		}
		

}