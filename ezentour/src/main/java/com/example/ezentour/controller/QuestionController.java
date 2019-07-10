package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {
	private static final Logger LOG = LoggerFactory.getLogger(QuestionController.class);

	@RequestMapping(value = "question/main")
	public String home() {		
		return "question/question_home";
	}
		@RequestMapping(value = "question/write")
		public String write() {		
			return "question/question_write";
	}
}
