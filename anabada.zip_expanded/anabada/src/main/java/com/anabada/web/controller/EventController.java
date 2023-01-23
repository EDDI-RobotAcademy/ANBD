package com.anabada.web.controller;

import java.io.File;
import java.net.MulticastSocket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.EventService;
import com.anabada.web.service.NoteService;
import com.anabada.web.vo.EfileVO;
import com.anabada.web.vo.EvPageMaker;
import com.anabada.web.vo.EvSearchCriteria;
import com.anabada.web.vo.EventBoardVO;
import com.anabada.web.vo.NoteVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;

@Controller
@RequestMapping("/event/*")
@SessionAttributes("member")
public class EventController {
	
	

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	// 이미지 파일 저장 폴더 설정
	private static final String CURR_IMAGE_REPO_PATH = "C:\\eventImg\\";

	@Inject
	EventService service;
	
	@Inject
	NoteService noteService;
	
	

	// 이벤트 게시판에서 게시글 쓰기 눌렀을때
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String eventWrite(HttpServletRequest req, HttpServletResponse res) {

		return "/event/eventWrite";
	}

	// 이벤트 글쓰기 저장
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(EventBoardVO eventBoardVO, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {

		logger.info("write");
		int num = service.write(eventBoardVO); // 글 DB저장
		multipartRequest.setCharacterEncoding("utf-8");
		List<String> fileList = fileProcess(multipartRequest);
		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				Map<String, String> fileMap = new HashMap<>();
				fileMap.put("eno", String.valueOf(num));
				fileMap.put("filePath", "/eventImg/" + (String) fileList.get(i));
				service.fileSave(fileMap);

			}
		}
	
		
		

		return "redirect:/event/list"; // 글 목록으로 보내기
	}

	// 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") EvSearchCriteria scri, HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		List<EventBoardVO> list = service.list(scri); // 게시글 정보 담아오기
		// 리스트에서 eno에 해당하는 사진 가져오기 (1번사진 가져오기)
		for (int i = 0; i < list.size(); i++) {

			EventBoardVO vo = list.get(i);
			String path = service.getImg(vo.getEno()); // eno에 해당하는 첫번째 사진 가져오기
			if (path == null) {
				vo.setE_filePath("/eventImg/img.png");
			} else {
				vo.setE_filePath(path);
			}
		}

		model.addAttribute("list", list); // 전체 게시글 조회 정보 담기
		EvPageMaker pageMaker = new EvPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "/event/list";
	}

	// 게시글 상세보기
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(EventBoardVO eventBoardvo, @ModelAttribute("scri") EvSearchCriteria scri, Model model,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("readView");
		int eno = eventBoardvo.getEno(); // 클릭한 게시글의 eno

		// 1. 회원의 참여여부 체크
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		Map<String, String> check = new HashMap<String, String>();
		check.put("id", id); // 회원의 id
		check.put("eno", Integer.toString(eno)); // 게시글 번호
		int ch = service.checkEv(check); // 이벤트 참여 여부 체크 참여했으면 1 , 아니면 0 반환
		model.addAttribute("check", ch);
		// 2. 게시글 정보 불러오기
		EventBoardVO read = service.read(eno);
		model.addAttribute("read", read);
	

		// 3. 게시글의 사진정보 불러오기
		model.addAttribute("filelist", service.filelist(eno));

		return "event/readView";

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(EventBoardVO eventBoardVO, @ModelAttribute("scri") EvSearchCriteria scri,
			RedirectAttributes rttr) throws Exception {
		logger.info("event delete ~");
		int eno = eventBoardVO.getEno();
		// 1.DB에 저장된 이미지 이름을 불러옴. 2. DB정보 삭제
		List<EfileVO> filelist = service.filelist(eno); // eno에 해당하는 파일들의 path가져오기
		if (filelist != null) {
			for (EfileVO vo : filelist) {
				deleteRealImg(vo.getFilepath()); // 서버에 저장된 파일 삭제
			}
		}
		// DB에서 게시글 삭제 (관계 설정 떄문에 게시글 삭제시 이미지 테이블에서 이미지삭제된다.)
		service.delete(eno); // 게시글 삭제

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("searchType", scri.getSearchType());

		return "redirect:/event/list";

	}

	// 이벤트 참여하기 클릭
	@RequestMapping(value = "/addHeart")
	@ResponseBody
	public Map<String, String> addHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("addHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int eno = Integer.parseInt(param.get("eno")); // 참여 누른 게시판번호
		service.addHeart(param); // eventmem 테이블에 좋아요 누른 정보 저장
		service.uptotal(eno); // eno 게시글의 e_total +1 하기
		hlist.put("hnum", Integer.toString(service.read(eno).getE_total()));

		return hlist;
	}

	// 이벤트 참여 취소
	@RequestMapping(value = "/subHeart")
	@ResponseBody
	public Map<String, String> subHeart(@RequestParam Map<String, String> param) throws Exception {
		logger.info("subHeart");
		Map<String, String> hlist = new HashMap<String, String>();
		int eno = Integer.parseInt(param.get("eno")); // 게시판번호
		service.subHeart(param); // 참여테이블에서 참여 누른 정보 삭제
		service.downtotal(eno); // e_total -1 하기
		hlist.put("hnum", Integer.toString(service.read(eno).getE_total()));

		return hlist;
	}

	// 이벤트 완료시키기
	@RequestMapping(value = "/endEvent")
	@ResponseBody
	public void endEvent(@RequestParam Map<String, String> param) throws Exception {
		logger.info("end event");

		service.endEvent(Integer.parseInt(param.get("eno"))); // DB에 완료로 변화시키기

	}

	@RequestMapping(value = "/winner")
	   @ResponseBody
	   public Map<String, String> winner(@RequestParam Map<String, String> param) throws Exception {
	      logger.info("winner");
	      Map<String, String> winner = new HashMap<>();
	      //당첨자에게 쪽지 보내기 
          Map<String, String> winNote = new HashMap<>();
	      int num = Integer.parseInt(param.get("num"));
	      int eno = Integer.parseInt(param.get("eno"));
	      //int num = param.get("num"); // 당첨자 수
	      //int eno = param.get("eno");
	      /*
	       * 1. 설정된 당첨자 보다 응모인원이 적은 경우 : 모든 인원 당첨으로 돌리기 2. 설정된 당첨자 보다 응모 인원이 많은 경우 랜덤으로
	       * 당첨자를 선택해서 리턴하기
	       * 
	       */
	      

	      int total = service.getTotal(eno); // 총 응모자 수
	      StringBuilder sb = new StringBuilder();
	      if (num >= total) { // 당첨자 >= 응모자 (모든사람 당첨시키기)

	         List<String> winnerList = service.getAll(eno); // 모든 사람의 id 불러움

	         for (String win : winnerList) {
	            sb.append(win);
	            sb.append(", ");
	            
	            // 당첨자에게 쪽지 보내기 
	            winNote.put("n_receiver", win);
	            winNote.put("n_content", "이벤트에 당첨되셨습니다. <br> 자세한 사항은 공지사항을 참조해 주세요");
	            winNote.put("n_rno", Integer.toString(eno));
	            noteService.send_event(winNote);
	            
	            
	         }

	      } else { // 당첨자(num) < 응모자(e_total)

	         Random r = new Random();
	         int random[] = new int[num]; // 랜덤된 당첨자의 번호를 적음 
	         for (int i = 0; i < num; i++) {
	            random[i] = r.nextInt(total) + 1;

	            for (int j = 0; j < i; j++) {
	               if (random[i] == random[j]) {
	                  i--;
	               }
	            }
	         }

	         // 각번호에 해당하는 사람들의 id를 뽑아오기 
	         for(int i : random) {
	            System.out.println("숫자 : "+i);
	            String winId = service.getWin(i);
	           // sb.append(service.getWin(i));
	            sb.append(winId);
	            sb.append(", ");
	            
	          
	            winNote.put("n_receiver", winId);
	            winNote.put("n_content", "이벤트에 당첨되셨습니다. <br> 자세한 사항은 공지사항을 참조해 주세요");
	            winNote.put("n_rno", Integer.toString(eno));
	            noteService.send_event(winNote);
	            //쪽지 보내기 끝  
	            
	         }
	         
	      }
	      
	      //db에 winenr 저장 
	      System.out.println("당첨자 : "+sb);
	   
	      EventBoardVO vo = new EventBoardVO();
	      vo.setEno(eno);
	      vo.setE_winner(sb.toString());
	      
	      service.winner(vo); 
	      
	      winner.put("winlist", sb.toString());

	      return winner;
	   }
	   
	
	
	//이벤트 게시글 수정하기 클릭했을때 
	@RequestMapping(value = "/editView", method = RequestMethod.GET)
	public String edit(EventBoardVO eventboardvo , @ModelAttribute("scri") EvSearchCriteria scri, Model model )
	throws Exception{
		logger.info("event edit");
		int eno = eventboardvo.getEno();
		model.addAttribute("update",service.read(eno));
		model.addAttribute("scri",scri);
		model.addAttribute("filelist",service.filelist(eno));
		return "event/eventeditView";
	}
	
	//이벤트 수정이 끝나고 저장할때 
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(EventBoardVO eventboardvo,@ModelAttribute("scri") SearchCriteriapro scri,Model model,@RequestParam String dlist, MultipartHttpServletRequest multipartRequest, HttpServletResponse response,RedirectAttributes rttr ) throws Exception {
		logger.info("update");
		
		String[] str = dlist.split(","); // 삭제할 사진 번호들
		// 수정시 삭제해야할 이미지 삭제 
		if (!(dlist.equals(""))) {
		

			removeImg(dlist);
		}
		service.update(eventboardvo);
		
		//넘어온 사진 저장 
		List<String> fileList = fileProcess(multipartRequest);
		if (fileList != null) {
			System.out.println("사진 넘어옴 ");
			for (int i = 0; i < fileList.size(); i++) {
			
				Map<String, String> fileMap = new HashMap<>();
				
				//fileMap.put("fno", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
				fileMap.put("filePath", "/eventImg/" + (String) fileList.get(i)); // 파일의 경로 저장
				fileMap.put("eno", String.valueOf(eventboardvo.getEno())); // 게시글 넘버 저장

				service.fileSave(fileMap); // 파일 저장
			}
		}
		//페이징 정보 
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getSearchType());
		
		
		
		
		return "redirect:/event/list";
	}
	
	

	// 사진 저장 메소드
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {

		// Iterator<String> fileNames = multipartRequest.getFileNames();
		List<MultipartFile> fileNameList = multipartRequest.getFiles("file");
		List<String> fileList = new ArrayList<>();
		for (MultipartFile mf : fileNameList) {
			String originalFileName = mf.getOriginalFilename(); // 원본 파일 명
			UUID uuid = UUID.randomUUID();

			if (originalFileName.length() > 0) { // 사진이 들어오면 확장자 때문에 . 존재
				String imgExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
						originalFileName.length()); // 확장자 추출

				String saveName = uuid.toString() + imgExtension;

				fileList.add(saveName);

				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + saveName);
				if (mf.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdir()) {
							file.createNewFile();
						}
					}
					mf.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + saveName));
				}

			}

		}

		return fileList;

	}

	// 해당 경로의 이미지를 삭제하는 메소드
	public void deleteRealImg(String filePath) {
		String realPath = filePath.substring(10);
		File file = null;
		file = new File(CURR_IMAGE_REPO_PATH + realPath);
		file.delete();

	}
	
	// 게시글 수정시 넘어온 이미지 삭제
	private void removeImg(String dlist) throws Exception {

		String[] list = dlist.split(",");
		for (String str : list) {
			int efno = Integer.parseInt(str);
			// 사진의 경로 가져오기
			String imgpath = service.imgPath(efno);
			deleteRealImg(imgpath); // 넣어준 경로의 사진을 서버에서 삭제해준다
			service.deleteImg(efno); // 해당 이미지를 테이블에서 삭제
		}
	}
	

}
