package com.example.ezentour.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	private static final Logger LOG = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "board/main")
	public String home() {		
		return "board/board_home";
	}
	
	@RequestMapping(value="board/write.do")
	public String bbsWrite() {
		return "board/board_write";
	}
	
}
