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
	
	private static final String JOB_IMG_PATH = "C:\\upload\\"; // �븣諛� 寃뚯떆�뙋 �궗吏꾧꼍濡� 
	private static final String CURR_IMAGE_REPO_PATH = "C:\\pimages\\";
	
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

	
	// 寃뚯떆�뙋湲� �옉�꽦 �솕硫�
	// 由ы꽩媛믪씠�옉 寃쎈줈�옉 媛숇떎硫� �븞�쟻�뼱以섎룄 �맖
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {

		logger.info("writeView");
	}

	//寃뚯떆湲� �옉�꽦
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeView(ABoardVO boardVO) throws Exception {

		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/a_board/list";
		// redirect�뒗 而⑦듃濡ㅻ윭 二쇱냼瑜� 李얠븘媛�
	}
	
	//ckeditor �뙆�씪 �뾽濡쒕뱶 
		 @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
		    public void imageUpload(Model model, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile
		    		, @RequestParam MultipartFile upload) throws Exception{
		    	// �옖�뜡 臾몄옄 �깮�꽦
		    	UUID uid = UUID.randomUUID();
		    	
		    	OutputStream out = null;
		    	PrintWriter printWriter = null;
		    	
		    	//�씤肄붾뵫
		    	response.setCharacterEncoding("utf-8");
		    	response.setContentType("text/html;charset=utf-8");
		    	try{
		    		//�뙆�씪 �씠由� 媛��졇�삤湲�
		    		String fileName = upload.getOriginalFilename();
		    		byte[] bytes = upload.getBytes();
		    		
		    		//�씠誘몄� 寃쎈줈 �깮�꽦
		    		String path = "C:\\ckeditor_upload_" + "ckImage/";
		    		String ckUploadPath = path + uid + "_" + fileName;
		    		File folder = new File(path);
		    		System.out.println("path111 : " + path);	// �씠誘몄� ���옣寃쎈줈 console�뿉 �솗�씤
		    		
		    		//�빐�떦 �뵒�젆�넗由� �솗�씤
		    		if(!folder.exists()){
		    			try{
		    				folder.mkdirs(); // �뤃�뜑 �깮�꽦
		    		}catch(Exception e){
		    			e.getStackTrace();
		    		}
		    	}
		    	
		    	out = new FileOutputStream(new File(ckUploadPath));
		    	out.write(bytes);
		    	out.flush(); // outputStram�뿉 ���옣�맂 �뜲�씠�꽣瑜� �쟾�넚�븯怨� 珥덇린�솕
		    	System.out.println(1);
		    	String callback = request.getParameter("CKEditorFuncNum");
		    	printWriter = response.getWriter();
		    	String fileUrl = "/a_board/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // �옉�꽦�솕硫�
		    	System.out.println(2);
		    	// �뾽濡쒕뱶�떆 硫붿떆吏� 異쒕젰
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

		 	//�꽌踰꾨줈 �쟾�넚�맂 �씠誘몄� 肉뚮젮二쇨린
		    @RequestMapping(value = "/ckImgSubmit")
		    public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value="fileName") String fileName
		    		, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		    	System.out.println("�뿬源낆뿬湲�");
		    	//�꽌踰꾩뿉 ���옣�맂 �씠誘몄� 寃쎈줈
		    	String path = "C:\\ckeditor_upload_" + "ckImage/"; // ���옣�맂 �씠誘몄� 寃쎈줈
		    	System.out.println("path2222 : " + path);
		    	String sDirPath = path + uid + "_" + fileName;
		    	
		    	File imgFile = new File(sDirPath);
		    	
		    	//�궗吏� �씠誘몄� 李얠� 紐삵븯�뒗 寃쎌슦 �삁�쇅泥섎━濡� 鍮� �씠誘몄� �뙆�씪�쓣 �꽕�젙�븳�떎.
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

	//寃뚯떆�뙋 紐⑸줉
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req, @RequestParam(value = "loca", required = false) String loca) throws Exception {

		logger.info("寃뚯떆�뙋 紐⑸줉 蹂닿린");
		
		model.addAttribute("list", service.list(scri));
		
		APageMaker pageMaker = new APageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/a_board/list";
	}
	
		//寃뚯떆�뙋 紐⑸줉
		@RequestMapping(value = "/loca_list", method = RequestMethod.GET)
		public String loca_list(Model model, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req, @RequestParam(value = "loca", required = false) String loca) throws Exception {

			logger.info("寃뚯떆�뙋 紐⑸줉 蹂닿린");
			
			model.addAttribute("list", service.list(scri));
			
			APageMaker pageMaker = new APageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/a_board/loca_list";
		}

	//寃뚯떆湲� �긽�꽭蹂닿린
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(Model model, ABoardVO boardVO, ALikeVO likeVO, MemberVO memberVO,
			@ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req) throws Exception {
		
		logger.info("寃뚯떆湲� �긽�꽭蹂닿린");
		
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

		//醫뗭븘�슂 �뿬遺� 泥댄겕 醫뗭븘�슂 �뻽�쑝硫� 1, 醫뗭븘�슂 �뾾�쑝硫� 0
		model.addAttribute("Chk", Chk);

		logger.info("Chk : " + Chk);

		return "/a_board/readView";
	}

	
	//寃뚯떆湲� �닔�젙 �솕硫�
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(Model model, ABoardVO boardVO, MemberVO memberVO, @ModelAttribute("scri") ASearchCriteria scri) throws Exception {
		logger.info("寃뚯떆湲� �닔�젙�븯湲� 酉고럹�씠吏�");
		
		model.addAttribute("update", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);

		return "a_board/updateView";
	}


	//寃뚯떆湲� �닔�젙
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("寃뚯떆湲� �닔�젙 �셿猷�");
		
		service.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());
		
		return "redirect:/a_board/list";
	}

	//寃뚯떆湲� �궘�젣
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("寃뚯떆湲� �궘�젣 �셿猷�");
		
		service.delete(boardVO.getA_bno());

		//�떊怨� �궡�뿭 �궘�젣
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

	//醫뗭븘�슂 異붽�
	@RequestMapping(value = "/insertLike", method = RequestMethod.POST)
	public @ResponseBody String insertLike(ABoardVO boardVO, ALikeVO likeVO, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "a_bno", required = false) int a_bno, 
			HttpServletRequest request, Model model) throws Exception {
		System.out.println("�옒 �꽆�뼱�뒗吏� �솗�씤");
		
		Map<String, String> bnoId = new HashMap<>();
		
		bnoId.put("id", id);
		bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));

		likeService.insertLike(bnoId);

		int likeCnt = likeService.updateLike(likeVO.getA_bno());
		model.addAttribute("read", likeCnt);

		return "redirect:/a_board/readView";
	}

	//醫뗭븘�슂 �궘�젣
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

	//�떊怨� �뙘�뾽 �쓣�슦湲�
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Model model, @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {
		
		model.addAttribute("a_bno", a_bno);
		return "a_board/report";
	}

	//�떊怨� �궗�쑀 �꽑�깮 �쑀�슚�꽦 寃��궗 �뙘�뾽 �쓣�슦湲�
	@RequestMapping(value = "/reportError", method = RequestMethod.GET)
	public String reportError() throws Exception {
		return "a_board/reportError";
	}
	
	//寃뚯떆湲� �떊怨� DB ���옣源뚯�
	@RequestMapping(value = "/reportComplaint", method = RequestMethod.GET)
	public String reportComplaint(Model model, ComplaintVO complaintVO) throws Exception {
		logger.info("寃뚯떆湲� �떊怨�");
		
		service.reportComplaint(complaintVO);
		
		return "a_board/report";
	}
	
	//留덉씠�럹�씠吏� �궡媛� �벖 湲� 紐⑸줉 
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

		//寃뚯떆湲� �떊怨� �궡�뿭 �긽�꽭蹂닿린
		@RequestMapping(value = "/complaintReadView", method = RequestMethod.GET)
		public String complaintRead(Model model, ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req,
				@RequestParam(value = "href") String href) throws Exception {
			
			logger.info("寃뚯떆湲� �긽�꽭蹂닿린");
			
			model.addAttribute("read", service.complaintRead(boardVO.getA_bno()));
			model.addAttribute("scri", scri);
			model.addAttribute("href", href);
			
			
			return "/a_board/complaintReadView";
		}
		
		//愿�由ъ옄媛� �떊怨좊맂 寃뚯떆湲� �궘�젣
		@RequestMapping(value = "/admin_delete", method = RequestMethod.GET)
		@ResponseBody
		public boolean admin_delete(@ModelAttribute ABoardVO boardVO, @RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {

			logger.info("愿�由ъ옄媛� �떊怨좊맂 寃뚯떆湲� �궘�젣");
			
			//�떊怨� 寃뚯떆湲� �궘�젣
			service.delete(a_bno);
			
			//�떊怨� �궡�뿭 �궘�젣
			Map<String, Object> map = new HashMap<>();
			
			map.put("c_bno", a_bno);
			map.put("board_type", "a_board");
			
			complaintService.delete_complaint(map);
			
			//�떊怨좊맂 寃뚯떆湲� �옉�꽦�옄 寃쎄퀬 �슏�닔 議고쉶(caution媛� 議고쉶)
			System.out.println("id : " + boardVO.getId());
			int count = complaintService.count_caution(boardVO.getId());
			
			if(count < 4) {
				complaintService.add_caution(boardVO.getId());
				deleteWithdrawal(boardVO.getId());
				complaintService.review_null(boardVO.getId());
				
				String content = "�쉶�썝�떂�쓽 而ㅻ�ㅻ땲�떚 寃뚯떆臾� '" + boardVO.getA_title() + "'�� 遺��쟻�젒�븳 �궗�쑀濡� �씤�빐 �궘�젣�릺�뿀�뒿�땲�떎."
	 					+ "\n�쉶�썝�떂�� �늻�쟻 寃쎄퀬�닔�뒗 " + ++count + "�엯�땲�떎."
	 					+ "\n�늻�쟻 寃쎄퀬�닔媛� 5媛� �릺硫� �쉶�썝 媛뺤젣 �깉�눜媛� �씠猷⑥뼱吏묐땲�떎.";
			
				Map<String, Object> map2 = new HashMap<>();
				
				map2.put("n_receiver", boardVO.getId());
				map2.put("n_content", content);
				
				complaintService.note_caution(map2);
			}
			else {
				String email = complaintService.expel_email(boardVO.getId());
				
				//�쉶�썝 �깉�눜�떆�궎湲� �쟾�뿉 �븣諛� 寃뚯떆臾� 愿��젴 �씠誘몄� �꽌踰꾩뿉�꽌 癒쇱� �궘�젣
	 			List img_list = jobService.img_list(boardVO.getId());
	 			
	 			if(img_list != null || !img_list.isEmpty()) { // �궗吏꾩씠 �엳�떎硫� �궘�젣
	 				
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
		
		//寃뚯떆湲� �궘�젣 �쑀�슚�꽦 寃��궗
		@RequestMapping(value = "/deleteChk", method = RequestMethod.GET)
		public @ResponseBody int deleteChk(@RequestParam(value = "a_bno", required = false) int a_bno) throws Exception {
			
			System.out.println("寃뚯떆湲� �긽�꽭蹂닿린 �떆 �궘�젣�맂 寃뚯떆臾쇱씤吏� �솗�씤");
			int result = service.deleteChk(a_bno);
			System.out.println("a_bno : " + result);
			
			return result;
		}
		
		//寃뚯떆湲� �떊怨� �쑀�슚�꽦 寃��궗
		@RequestMapping(value = "/complaintChk", method = RequestMethod.GET)
		public @ResponseBody int complaintChk (@RequestParam(value = "id") String id, @RequestParam(value = "a_bno") int a_bno, 
				@RequestParam(value = "a_board", required = false) String a_board) throws Exception {
			logger.info("�떊怨� �쑀�슚�꽦 寃��궗");
			
			Map<String, String> comChk = new HashMap<>();
			
			comChk.put("id", id);
			comChk.put("c_bno", Integer.toString(a_bno));
			comChk.put("board_type", a_board);
			
			int result = service.complaintChk(comChk);
			
			return result;
		}
		
		
		//중고 게시판 밑 리뷰 게시판 탈퇴시 처리 

		public void deleteRealImg(String filePath) {
			String realPath = filePath.substring(11);
			File file = null;
			file = new File(CURR_IMAGE_REPO_PATH + realPath);
			file.delete();

		}

		// �쉶�썝 �깉�눜�떆 �꽌踰꾩긽�뿉�꽌 �쉶�썝�씠 pboard�뿉 �궓湲� �궗吏� �젙蹂� �궘�젣
		public void deleteWithdrawal(String id) throws Exception {
			// �꽌踰꾩긽�뿉�꽌 pfile�뿉 �빐�떦�븯�뒗 �궗吏꾩젙蹂대뱾 �궘�젣
			List<Integer> pno_list = complaintService.pno_list(id); // �궗�슜�옄�쓽 寃뚯떆湲� pno遺덈윭�삤湲�

			if (!pno_list.isEmpty()) { // �옉�꽦�븳 寃뚯떆湲��씠 議댁옱�븳�떎硫� �떎�뻾
				List<String> filePath_list = complaintService.filePath_list(pno_list); // filePath_list遺덈윭�삤湲�
				// �꽌踰꾩긽�뿉�꽌 �궗吏꾩젙蹂� �궘�젣
				for (String filePath : filePath_list) {
					deleteRealImg(filePath);
				}
			}

		}
		

}