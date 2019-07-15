package com.example.ezentour.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.service.member.MemberService;

@Controller
public class MemberController {
private static final Logger LOG = LoggerFactory.getLogger(MemberController.class);
	@Inject //의존관계 주입
	MemberService memberService; 

	@RequestMapping(value = "member/login.do")
	public String login() {		
		return "member/login";
	}
	
	@RequestMapping(value = "member/signUp.do")
	public String signUp() {		
		return "member/signUp";
	}

	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		LOG.info("****** login_check.do ******" + dto.toString());
		//로그인 성공 true, 실패 false
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		
		if(result) { //로그인 성공
			session.setAttribute("m_id", dto.getM_id());
			session.setAttribute("m_field", dto.getM_field());
			mav.setViewName("redirect:/"); //뷰의 이름
		}else { //로그인 실패
			mav.setViewName("redirect:/member/login.do");
			//뷰에 전달할 값
			//mav.addObject("message", "error");
		}
		return mav;
	}
	
	
	@RequestMapping("member/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 초기화
		// 메인 페이지로 이동
		return "redirect:/";
	}
	
	
	
	 // 글 작성 get
	 @RequestMapping(value = "member/register", method = RequestMethod.GET)
	 public void getRegister() throws Exception {
		 LOG.info("get register");
	 }

	 // 글 작성 post
	 @RequestMapping(value = "member/register", method = RequestMethod.POST)
	 public String postRegister(MemberDTO dto) throws Exception {
		 LOG.info("post resister");
		 LOG.info("*************************************** " + dto.getM_email());
		 memberService.register(dto);
		 return "redirect:/";
	 }
	 
	 // 회원 확인
	@ResponseBody
	@RequestMapping(value = "member/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest request) throws Exception {
		LOG.info("post idCheck");
		String m_id = request.getParameter("m_id");
		MemberDTO idCheck = memberService.idCheck(m_id);
		int result = 0;
		if (idCheck != null)
			result = 1;
		return result;
	}
	 
	
}
