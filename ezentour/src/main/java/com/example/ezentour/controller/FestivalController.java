package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FestivalController {
private static final Logger LOG = LoggerFactory.getLogger(FestivalController.class);
	
	@RequestMapping(value = "festival/main")
	public String home() {		
		return "festival/festival_home";
	}

}
