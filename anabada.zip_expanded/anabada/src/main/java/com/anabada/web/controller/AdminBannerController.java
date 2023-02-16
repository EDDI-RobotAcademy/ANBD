package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.anabada.web.service.AdminBannerService;

@Controller
@RequestMapping("/a_banner/*") 
public class AdminBannerController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminBannerController.class);
	private static final String BANNER_IMG_PATH = "C:\\aimages\\";
	
	@Inject
	AdminBannerService service;
	
	// 배너 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Model model, MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
	
		// view에서 넘어온 사진들이 담긴 fileList
		List<String> fileList = fileProcess(multipartRequest);
		       
		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = "/banner/" + (String) fileList.get(i); // 파일의 경로 저장
				service.fileSave(filePath); // 파일 저장
				model.addAttribute("filePath", filePath);
			}
		}
	
		model.addAttribute("fileList", fileList);
		       
		return "redirect:/";
	}
	
	// 이벤트 배너 수정 페이지
	@RequestMapping(value = "/bannerUpdate", method = RequestMethod.GET)
	public String bannerUpdate() throws Exception {
		return "/a_banner/bannerUpdate";
	}
	
    // 배너 이미지 수정
    @RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam String dlist, MultipartHttpServletRequest multipartRequest) throws Exception{
	
    	multipartRequest.setCharacterEncoding("utf-8");
    	
    	// 삭제해야할 배너 이미지 삭제
        if (!(dlist.equals(""))) {
    		removeImg(dlist);
    	}
        
		// view에서 넘어온 사진들이 담긴 fileList
		List<String> fileList = fileProcess(multipartRequest);
    	
    	if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = "/banner/" + (String) fileList.get(i); // 파일의 경로 저장
				service.fileSave(filePath); // 파일 저장
			}
		}
    	
		return "index";
	}
    
    // 이미지 저장
    public List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {

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

 				File file = new File(BANNER_IMG_PATH + saveName);
 				if (mf.getSize() != 0) {
 					if (!file.exists()) {
 						if (file.getParentFile().mkdir()) {
 							file.createNewFile();
 						}
 					}
 					mf.transferTo(new File(BANNER_IMG_PATH + saveName));
 				}

 			}
 		}

 		return fileList;

 	}
 	
 	
	// 게시글 수정시 넘어온 이미지 삭제
    public void removeImg(String dlist) throws Exception {

		String[] list = dlist.split(",");
		for (String str : list) {
			int a_no = Integer.parseInt(str);
			// 사진의 경로 가져오기
			String imgpath = service.imgPath(a_no);
			deleteRealImg(imgpath); // 넣어준 경로의 사진을 서버에서 삭제해준다
			service.deleteImg(a_no); // 해당 이미지를 테이블에서 삭제
		}
	}
	
	// 해당 경로의 배너 이미지를 삭제하는 메소드
	public void deleteRealImg(String filePath) {
		String realPath = filePath.substring(11);
		File file = null;
		file = new File(BANNER_IMG_PATH + realPath);
		file.delete();

	}
	
	

}
