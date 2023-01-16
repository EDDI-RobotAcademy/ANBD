package com.anabada.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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

import com.anabada.web.service.EventService;
import com.anabada.web.service.NoteService;
import com.anabada.web.service.ProductService;
import com.anabada.web.vo.EventBoardVO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NotePageMaker;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;
import com.anabada.web.vo.PBoardVO;

import oracle.net.aso.n;

@Controller
@RequestMapping("/note/*") 
public class NoteController {

	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

	@Inject
	NoteService noteService;
	
	@Inject
	ProductService productService;
	//이거 쪽지 상세보기에서 중고게시글로 넘어가기위해서 중고게시물 관련 클래스 필요
	
	@Inject
	EventService eventService;

	// 쪽지보내는 ajax
	@RequestMapping(value="/note_insert.ajax", method = RequestMethod.GET)
	@ResponseBody
    public boolean note_insert(HttpServletResponse resp, @ModelAttribute("noteVO") NoteVO noteVO) throws Exception {
        
		System.out.println("쪽지" + noteVO);
		
		noteVO.getN_rno();
		
		noteService.send(noteVO);
		
		boolean result = true;
        return result;
    }
	
	
	//쪽지 목록보기
	@RequestMapping(value = "/note_list", method = RequestMethod.GET)
	public String note_list(HttpSession session, Model model, NoteVO noteVO, @ModelAttribute("scri") NoteSearchCriteria scri) throws Exception{
		
		logger.info("쪽지 목록보기 눌렀음~~~~");
	
		String id = (String)session.getAttribute("id"); // 세션 아이디 받아옴
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("who", scri.getWho());
		map.put("rowStart", scri.getRowStart());
		map.put("rowEnd", scri.getRowEnd());
		
		model.addAttribute("n_list", noteService.note_list(map)); // 메시지 목록
		System.out.println("쪽지: " + noteService.note_list(map));
		model.addAttribute("who", scri.getWho());// 받는사람, 보낸사람 구분하려고
		
		NotePageMaker pageMaker = new NotePageMaker();
		pageMaker.setCri(scri); 
		pageMaker.setTotalCount(noteService.note_listCount(map)); // 로그인 아이디와(세션) who(NoteSearchCriteria) 넘겨야함
		System.out.println("총 개수: " + noteService.note_listCount(map));
		
		// 안읽으면 1, 읽으면 0
		model.addAttribute("no_read", noteService.no_readCount(id));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/note/note_list";
	}
	
	// 쪽지 삭제하는 ajax(목록에서)
	@RequestMapping(value = "/delete_chk.ajax", method =RequestMethod.GET)
	@ResponseBody
	public boolean delete_chk(HttpServletResponse resp, @RequestParam(value="delete_array") int[] delete_array, 
			@RequestParam(value="n_sender") String n_sender, @RequestParam(value="n_receiver") String n_receiver, HttpSession session) throws Exception{
		
		logger.info("쪽지함에서 삭제 눌렀음"); 
		// 페이징 처리 안해줬음 
		
		String id = (String)session.getAttribute("id");
		
		if(id.equals(n_sender)) {// 보낸 사람이랑 로그인한 회원이 같을 때
			noteService.delete_send(delete_array); 
		}else if(id.equals(n_receiver)){//보낸사람이랑 로그인한 회원이 같을 때 
			noteService.delete_receive(delete_array);
		}
		
		noteService.delete_all(delete_array); // 보낸 사람, 받는 사람 둘다 삭제했으면 디비에서도 삭제
	
		boolean result = true;
		return result;
        
	}
	
	// 쪽지 상세보기 + 쪽지보면 읽었다고 표시
	@RequestMapping(value = "/note_read", method =RequestMethod.GET)
	public String note_read(@ModelAttribute NoteVO noteVO, Model model,@ModelAttribute("scri") NoteSearchCriteria scri, 
			HttpSession session) throws Exception{
		
		logger.info("쪽지 상세보기로 들어왔으~~");
		
		System.out.println("하하하하");
		
		System.out.println("번호: " + noteVO.getN_bno());
		
		NoteVO n_read = noteService.note_view(noteVO.getN_bno());
		System.out.println(n_read);
		
		model.addAttribute("n_read", n_read); // 쪽지
		
		int n_rno = n_read.getN_rno(); // 쪽지에 게시물 번호
		String n_type = n_read.getN_type(); // 어떤 타입의 쪽지인지(일반, 중고, 이벤트)
		System.out.println("엔타입:" + n_type);
		
		
		if(n_type.equals("evnet")){ // 이벤트 쪽지일때
			
			EventBoardVO e_read = eventService.read(n_rno);
			
			if(e_read != null) { // 이벤트 삭제되지 않았을 때
				int eno = n_rno;
				model.addAttribute("eno", eno);
			}
			
		}else if(n_type.equals("no") || n_type.equals("review")) { // 일반 쪽지일때(그냥, 중고)
			
			PBoardVO p_read = productService.read(n_read.getN_rno()); // 게시글 관련 쪽지면 게시글 객체 저장
			System.out.println("p_read"+p_read);
			
			if(p_read != null && n_rno > 0) { // 중고 쪽지가 삭제되지 않았을 때삭제되지 않았을 때
				String path = productService.getImg(n_read.getN_rno()); // 첫번째 사진의 정보를 담음
				
				if (path == null) {
					p_read.setP_filepath("/tomcatImg/img.png");
				} else {
					p_read.setP_filepath(path);
					System.out.println(path);
				}
				model.addAttribute("p_read", p_read); // 중고게시글 객체도 불러옴
			}
			
		}
			
		// 만약 삭제된 중고, 이벤트 쪽지라면 model로 넘기지 않음
		
		model.addAttribute("scri", scri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("n_bno", noteVO.getN_bno());
		
		noteService.read_check(map); // 읽었다고 처리
		
		
		return "/note/note_read";
	}////////////////////////////////////////지애 추가가함
	
	// 쪽지 삭제하는 ajax(상세보기에서)
	@RequestMapping(value = "/delete_chk2.ajax", method =RequestMethod.GET)
	@ResponseBody
	public boolean delete_chk2(HttpServletResponse resp, @RequestParam(value="n_bno") int n_bno,
			@RequestParam(value="n_sender") String n_sender, @RequestParam(value="n_receiver") String n_receiver, HttpSession session) throws Exception{
			
		logger.info("쪽지 상세보기에서 삭제 눌렀음"); 
			
		String id = (String)session.getAttribute("id");
		
			
		if(id.equals(n_sender)) {// 보낸 사람이랑 로그인한 회원이 같을 때
			noteService.delete_send2(n_bno); 
		}else if(id.equals(n_receiver)){//보낸사람이랑 로그인한 회원이 같을 때 
			noteService.delete_receive2(n_bno);
		}
			
		noteService.delete_detail(n_bno); // 보낸 사람, 받는 사람 둘다 삭제했으면 디비에서도 삭제
				
		boolean result = true;
		return result;
	}	
	
	// 특정 중고게시물에 대해 쪽지한 사람 리스트
	@RequestMapping(value = "/product_note", method = RequestMethod.GET)
	public String product_note(@ModelAttribute NoteVO noteVO, Model model, HttpSession session,
			@ModelAttribute("cri") NoteCriteria cri) throws Exception{
		
		logger.info("해당 중고게시글에 쪽지한 사람들 목록");
		System.out.println("중고게시물 번호: " +noteVO.getN_rno());
		//중고게시물에서 pno번호가 넘어와야함!!
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("id", (String)session.getAttribute("id"));
		map.put("n_rno", noteVO.getN_rno());
		map.put("n_type", noteVO.getN_type());
		
		// 페이징 처리 10개씩! 아직 확인안해봄 나중에 확인해보기!!!
		NotePageMaker pageMaker = new NotePageMaker();
		pageMaker.setCri(cri); 
		System.out.println("페이지번호: " + cri.getPage());
		
		List<String> members = noteService.get_members(map); // 쪽지한 사람 전체 리스트
		pageMaker.setTotalCount(members.size());
		
		/*
		if(members.size() > 10) { // 우선 페이지 처리 4까지만 했음
			if(cri.getPage() == 2) {
				members = members.subList(10, 20);
			}else if(cri.getPage() == 3){
				members = members.subList(20, 30);
			}else if(cri.getPage() == 4){
				members = members.subList(30, 40);
			}
		}
		*/
		
		model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("m_list", members); // 쪽지한 아이디 리스트들 반환
	    model.addAttribute("p_read", productService.read(noteVO.getN_rno()));
	    // 중고 게시물 정보도 넘겨줘야함.
	    
	    return "/note/product_note";
	}
	
	// 판매리뷰 쪽지 보내기 ajax
    @RequestMapping(value="/review_note.ajax", method = RequestMethod.GET)
	@ResponseBody
	public boolean review_note(HttpServletResponse resp, @ModelAttribute("noteVO") NoteVO noteVO) throws Exception {
	        
    	System.out.println("쪽지" + noteVO);
			
		noteService.send(noteVO);
		
		boolean result = true;
		return result;
    }
    
    
    // 쪽지 신고하기 창 뜨게하기
    @RequestMapping(value = "/note_report", method = RequestMethod.GET)
	public String note_report(@RequestParam int n_bno, Model model) {
	
		model.addAttribute("n_bno", n_bno);
		
		return "/note/report";
	}
    
    
    // 쪽지 디비에 저장하기
    @RequestMapping(value = "/report_insert", method = RequestMethod.GET)
    public void report_insert() {
    	
    }
	
}
