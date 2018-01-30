package com.seung.web1;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seung.web1.group.dao.GroupDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	GroupDAO groupdao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("홈 시작");
		
		
		
		logger.info("홈 종료");
		return "home";
	}
	
	
	
}
