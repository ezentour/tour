package com.example.ezentour.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping("mypage/company/josogo.do")
	public String mai1n(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("d");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		return "company/mypage/jusoPopup";
	}
}
