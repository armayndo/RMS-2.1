package com.mitrais.rms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mitrais.rms.entity.User;
import com.mitrais.rms.service.UserService;
import com.mitrais.rms.user.CrmUser;

@Controller
public class DemoController {
	
	@Autowired
    private UserService userService;
	
	@GetMapping("/")
	public String showHome() {
		return "index";
	}
	
		// add request mapping for /leaders
		@GetMapping("/leaders")
		public String showLeaders() {
			
			return "leaders";
		}
		
		@GetMapping("/systems")
		public String showAdmins() {
			
			return "systems/systems";
		}
		
		
		@GetMapping("/profile/updateProfile")
		public String updateProfile(@RequestParam(name="id") String userId, Model theModel ) {
					    
			User users = userService.findByUserName(userId);
			theModel.addAttribute("user", users);
			theModel.addAttribute("crmUser", new CrmUser());
			
			return "update-form";
		}
		
		@GetMapping("/login1")
		public String showLogin1() {
			
			return "fancy-login";
		}
		
		@GetMapping("/login2")
		public String showLogin2() {
			
			return "users/login";
		}

}
