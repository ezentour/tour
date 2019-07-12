package com.example.ezentour.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		LOG.info("****** login_check.do ******");
		//로그인 성공 true, 실패 false
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		
		if(result) { //로그인 성공
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
	
	
}
