package com.seung.web1.user.controller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import com.seung.web1.common.util.FileService;
import com.seung.web1.user.dao.UserDAO;
import com.seung.web1.user.vo.User;

@Controller
@RequestMapping(value="user")
public class UserInfoRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoRestController.class);
	
	@Autowired
	UserDAO dao;
	
	final String uploadPath = "/profile";
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute User user) {
		logger.info("유저 업데이트 시작");
		System.out.println(dao.updateUser(user));
		
		logger.info("유저 업데이트 종료");
		return "redirect:infoForm";
	}
	
	@RequestMapping(value="profileUpdate", method=RequestMethod.POST)
	public String  profileUpdate(HttpSession session, MultipartFile upload,Model model){
		logger.info("프로필 이미지 업로드 시작");
		model.addAttribute("windowState", "on");
		
		String id = (String)session.getAttribute("id");
		if(!upload.isEmpty()){
			String savedfile =	FileService.saveFile(upload, uploadPath);
			User user = dao.idSearch(id);
			user.setImg(savedfile);
			if(savedfile == null){
				logger.info("파일저장x 프로필 이미지 업로드 실패");
				model.addAttribute("state", false);
				return "customer/profileForm";
			}else{
				logger.info("프로필 이미지 업로드 성공ddddddddddddddddd");	
				//dao.updateCustomer(customer);
				dao.updateUser(user);
				model.addAttribute("state", true);
				
				return "user/profileForm";
			}
		}else{
			logger.info("파일없어서 프로필 이미지 업로드 실패");
			model.addAttribute("state", false);
		}
		
		logger.info("프로필 이미지 업로드 실패");
		return "user/profileForm";
	}
	
	@RequestMapping(value="download", method=RequestMethod.GET)
	public void downloadFile(HttpSession session, HttpServletResponse response){
		String id = (String)session.getAttribute("id");
		User c = dao.idSearch(id);
		String fullPath = uploadPath+"/"+c.getImg();
		
		//response의 Header영역에 원본 파일 이름을 인코딩해서 등록, 이거 안하면 오픈만 되고 다운로드가 안됨
		try {
			//setHeader 설정추가 ,attachment 전달, 그리고 한글로도 잘 전달 할 수 있게 인코딩
			response.setHeader("Content-Disposition", "attachment;filename="
		+URLEncoder.encode(fullPath, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
}
