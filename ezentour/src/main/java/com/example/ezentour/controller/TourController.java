package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {
	private static final Logger LOG = LoggerFactory.getLogger(TourController.class);

	@RequestMapping(value = "tour/main")
	public String home() {		
		return "tour/tour_home";
	}
}
