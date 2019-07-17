package com.example.ezentour.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//게시판 글쓰기화면
	@RequestMapping(value = "board/write.do")
	public String bbsWrite(HttpSession session, Model model) {
		LOG.info("bbsWrite 시작");
		String m_id = (String) session.getAttribute("m_id");
	
		if(m_id == null) {
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "member/login.do"); 
		} 
		return "board/board_write";
	}
	
	//게시판 상세화면
	@RequestMapping(value = "board/view.do")
	public String bbsView(@RequestParam int b_no, Model model) {
		LOG.info("bbsView 시작");
		model.addAttribute("dto", boardService.viewBoard(b_no));
		
		return "board/board_view";
	}
	
	//게시판 글쓰기 삽입
	@RequestMapping(value = "board/insert.do")
	public String bbsInsert(@ModelAttribute BoardDTO bDto, HttpSession session, Model model) {
		LOG.info("bbsInsert 시작");
		String m_id = (String) session.getAttribute("m_id");
		LOG.info("m_id Check : " + m_id);
		bDto.setB_m_id(m_id);
		LOG.info("-----------------:" + bDto.toString());
		
		boardService.insertBoard(bDto);
		
		return "redirect:../board/main";
	}
	
	//게시판 수정화면
	@RequestMapping("board/{b_no}")
	public ModelAndView bbsUpdate(@ModelAttribute BoardDTO bDto, Model model, HttpSession session,
			@PathVariable("b_no") int b_no, ModelAndView mav) {
		String m_id = (String) session.getAttribute("m_id");
		bDto.setB_m_id(m_id);
		mav.setViewName("board/board_update"); 	//이동할 페이지
		mav.addObject("dto", boardService.viewBoard(b_no));
		return mav;
	}
	
	//게시판 수정삽입
	@RequestMapping(value = "board/update.do")
	public String update(BoardDTO bDto, HttpSession session) {
		LOG.info("update 시작");
		boardService.updateBoard(bDto);
		
		return "redirect:../board/view.do?b_no=" + bDto.getB_no();
	}
	
	//게시판 글삭제
	@RequestMapping(value = "board/delete.do")
	public String bbsDelete(@ModelAttribute BoardDTO bDto, HttpServletRequest request) {
		LOG.info("bbsDelete 시작");
		int bno = Integer.parseInt(request.getParameter("b_no"));
		//bDto.getB_no();
		LOG.info("****************" + bno);

		boardService.deleteBoard(bno);
		return "redirect:../board/main";
		
	}
	
}
