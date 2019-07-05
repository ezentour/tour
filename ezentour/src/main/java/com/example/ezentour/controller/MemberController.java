package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
private static final Logger LOG = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "member/login.do")
	public String login() {		
		return "member/login";
	}
	
	@RequestMapping(value = "member/signUp.do")
	public String signUp() {		
		return "member/signUp";
	}

}
