package com.example.ezentour.controller.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
	private static final Logger LOG = LoggerFactory.getLogger(CompanyController.class);

	@RequestMapping(value = "mypage/company/hotel_list")
	public String home() {
		return "company/mypage/hotel_list";
	}
	
	@RequestMapping(value = "mypage/company/hotel_insert")
	public String hotelInsert() {
		return "company/mypage/hotel_insert";
	}

	@RequestMapping(value = "mypage/company/reservation")
	public String reservation() {
		return "company/mypage/reservation";
	}

}
