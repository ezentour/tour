package com.example.ezentour.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.service.member.MemberService;
import com.example.ezentour.service.user.CartService;

@Controller
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Inject
	CartService cartService;
	@Inject
	MemberService memberService;

	@RequestMapping(value = "mypage/user/main")
	public String home() {
		return "user/mypage/user_home";
	}

	@RequestMapping(value = "mypage/user/mycart")
	public String myCart(Model model, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		LOG.info("m_id Check : " + m_id);

		if (m_id == null) {
			return "user/mypage/mycart";
		} else if (m_id != null && m_id.length() != 0) {
			MemberDTO memberDto = memberService.viewMember(m_id);
			LOG.info("memberDto(usercontroller)" + memberDto);
			if ((memberDto.getM_field()).equals("U")) {
				LOG.info("check(userController)");
				List<CartDTO> list = cartService.viewCartList(m_id);
				model.addAttribute("list", list);
				return "user/mypage/mycart";
			}
		} return "user/mypage/mycart";
	}
}
