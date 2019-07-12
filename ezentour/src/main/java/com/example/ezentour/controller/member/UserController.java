package com.example.ezentour.controller.member;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.service.user.CartService;

@Controller
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Inject
	CartService cartService;
	@RequestMapping(value = "mypage/user/main")
	public String home() {		
		return "user/mypage/user_home";
	}
	
	@RequestMapping(value = "mypage/user/mycart")
	public String myCart(Model model) {		
		List<CartDTO> list = cartService.viewCartList();
		model.addAttribute("list", list);
		return "user/mypage/mycart";
	}
}
