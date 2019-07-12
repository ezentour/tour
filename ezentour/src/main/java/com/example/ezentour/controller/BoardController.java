package com.example.ezentour.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ezentour.model.board.dto.BoardDTO;
import com.example.ezentour.service.board.BoardService;

@Controller
public class BoardController {
	private static final Logger LOG = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping(value = "board/main")
	public String home(Model model) {
		List<BoardDTO> list = boardService.boardList();
		model.addAttribute("list", list);
		return "board/board_home";
	}
	
	//게시판 글쓰기
	@RequestMapping(value = "board/write.do")
	public String bbsWrite() {
		LOG.info("bbsWrite 시작");
		return "board/board_write";
	}
	
	//게시판 상세화면
	@RequestMapping(value = "board/view.do")
	public String bbsView(@RequestParam String b_no, Model model) {
		LOG.info("bbsView 시작");
		model.addAttribute("dto", boardService.viewBoard(b_no));
		return "board/board_view";
	}
	
	@RequestMapping(value = "board/insert.do")
	public String bbsInsert(@ModelAttribute BoardDTO bDto) {
		LOG.info("bbsInsert 시작");
		boardService.insertBoard(bDto);
		return "redirect:board/main";
	}
}
