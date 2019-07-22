package com.example.ezentour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.example.ezentour.model.board.dto.BoardCommentDTO;
import com.example.ezentour.model.board.dto.BoardDTO;
import com.example.ezentour.service.board.BoardCommentService;
import com.example.ezentour.service.board.BoardService;

@Controller
public class BoardController {
	private static final Logger LOG = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	@Inject
	BoardCommentService bCommentService;
	
	//검색
	@RequestMapping(value="board/search")
	public String search(Model model,HttpServletRequest request) {
		String search = request.getParameter("search");
		List<BoardDTO> list = boardService.boardSearch(search);
		model.addAttribute("list", list);
		return "board/board_home";
	}
	
     //보드 메인 화면
	@RequestMapping(value = "board/main")
	public String home(Model model,HttpServletRequest request) {
		int curPage = Integer.parseInt(request.getParameter("page"));
		int totalPage=boardService.boardCount() ;
		List<BoardDTO> list = boardService.boardList(curPage);
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curPage", curPage);
		model.addAttribute("list", list);
		return "board/board_home";
	}
	
	//게시판 글쓰기화면
	@RequestMapping(value = "board/write.do")
	public String bbsWrite(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		LOG.info("bbsWrite 시작");
		String m_id = (String) session.getAttribute("m_id");
	
		if(m_id == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.');</script>");
			out.flush(); 
			//model.addAttribute("msg", "로그인 해주세요.");
			return "member/login";
		} 
		return "board/board_write";
	}
	
	//게시판 상세화면 & 댓글 리스트 view
		@RequestMapping(value = "board/view.do")
		public String bbsView(@RequestParam int b_no, Model model) {
			List <BoardCommentDTO> list = bCommentService.commentList(b_no); // 댓글 리스트 출력
			
			model.addAttribute("list",list);
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
		
		return "redirect:../board/main?page=1";
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
		return "redirect:../board/main?page=1";
	}
	
	//댓글 삽입
		@RequestMapping(value="board/comment.do")
		public String comment(Model model,HttpServletRequest request,HttpSession session) {
			String c_content = request.getParameter("c_content");
			int c_b_no = Integer.parseInt(request.getParameter("c_b_no"));
			String c_m_id= (String) session.getAttribute("m_id");
			LOG.info("checkBoardController : " + c_content +" , " + c_b_no+", " +c_m_id);
			
			bCommentService.commetInsert(c_m_id, c_content, c_b_no);
			
			return "redirect:../board/view.do?b_no="+c_b_no;
			
		}
		
		//댓글 삭제
		@RequestMapping(value="board/commentDelete")
		public String commentDelete(HttpServletRequest request) throws IOException {
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int c_b_no = Integer.parseInt(request.getParameter("c_b_no"));
			
			bCommentService.commentDelete(c_no);
			return "redirect:../board/view.do?b_no="+c_b_no;
		}
	
}
