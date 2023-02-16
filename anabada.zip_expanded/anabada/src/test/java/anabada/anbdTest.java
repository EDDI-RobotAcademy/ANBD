package anabada;

import java.util.List;

import javax.inject.Inject;

import com.anabada.web.service.ComplaintService;

public class anbdTest {
	
	@Inject
	ComplaintService complaintService;
	private static final String CURR_IMAGE_REPO_PATH = "C:\\pimages\\";
	
	public void deleteId_Test()throws Exception {
		
		List<Integer> pno_list = complaintService.pno_list("coco");
		System.out.println("pno : "+pno_list);
		List<String> filePath_list = complaintService.filePath_list(pno_list);
		for(String filePath : filePath_list) {
			System.out.println("파일 : "+filePath);
		}
		
	}
	

}
