package org.conan.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	


	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");		
	}
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile,Model model) {
		String uploadFolder="c:/upload";		
		for(MultipartFile multipartFile:uploadFile) {
			log.info("------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize()+"byte");
			File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e){
				log.error(e.getMessage());
			}
		}
	}
	@GetMapping("/uploadAjax")
	public void uploadAJax() {
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {	

		String uploadFolder = "c:/upload";	
		File uploadPath = new File(uploadFolder,getFolder());
		log.info("upload Path : "+uploadPath);
		for(MultipartFile multipartFile:uploadFile) {
			UUID uuid = UUID.randomUUID();
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			log.info("-----------------------");
			log.info("upload File Name : "+multipartFile.getOriginalFilename());
			log.info("upload File Size : "+multipartFile.getSize()+" byte");
			File saveFile = new File(uploadPath,uploadFileName);
			
			//폴더 생성하기
			
			if(uploadPath.exists()==false) {//폴더가 존재하지 않으면 새로 생성
				uploadPath.mkdirs();
			}
			try {				
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
	}
}
