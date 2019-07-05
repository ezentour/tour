package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "mypage/admin/main")
	public String home() {		
		return "admin/mypage/admin_home";
	}
}
