package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    @RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(MultipartHttpServletRequest multipartRequest) throws Exception{
	
    	multipartRequest.setCharacterEncoding("utf-8");

		// view에서 넘어온 사진들이 담긴 fileList
		List<String> fileList = fileProcess(multipartRequest);
    	
    	if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				String filePath = "/tomcatImg/" + (String) fileList.get(i); // 파일의 경로 저장
				service.fileSave(filePath); // 파일 저장
			}
		}
		
		return "index";
	}
    
    // 배너 이미지 수정
    @RequestMapping(value = "/update", method = RequestMethod.GET)
	public String insert(@RequestParam int n_bno, Model model) throws Exception{
	
		model.addAttribute("n_bno", n_bno);
		
		return "/note/report";
	}
    
    
    
    // 이미지 저장
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
	
	

}
