package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "mypage/admin/user_list")
	public String home() {		
		return "admin/mypage/user_list";
	}
	
	@RequestMapping(value = "mypage/admin/hotel_list_yes")
	public String hotellist_yes() {		
		return "admin/mypage/hotel_list_yes";
	}
	
	@RequestMapping(value = "mypage/admin/hotel_list_no")
	public String hotellist_no() {		
		return "admin/mypage/hotel_list_no";
	}
}
