package com.example.ezentour.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.member.MemberService;
import com.example.ezentour.service.user.CartService;

@Controller
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Inject
	CartService cartService;
	@Inject
	MemberService memberService;
	@Inject
	HotelService hotelService;

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
		}
		return "user/mypage/mycart";
	}
	
	@RequestMapping(value = "mypage/user/delete")
	public String delete(HttpServletRequest request,HttpSession session,Model model) {
		String[] checkBox = request.getParameterValues("check");
		LOG.info("checkBox.length"+checkBox.length);
		for(int i = 0;i<=checkBox.length-1;i++) {
			int intCheckBox = Integer.parseInt(checkBox[i]);
			LOG.info("IntCheckBox(userController) : " +intCheckBox);
			cartService.cartDelete(intCheckBox);
		}
		String m_id = (String) session.getAttribute("m_id");
		List<CartDTO> list = cartService.viewCartList(m_id);
		model.addAttribute("list", list);
		return "user/mypage/mycart";
	}
	
	@RequestMapping(value = "mypage/user/reservation_check")
	public ModelAndView reservation_check(HttpServletRequest request, HttpSession session, ModelAndView mav, @RequestParam int h_no) {
		String m_id = (String) session.getAttribute("m_id");
		String checkInDate = request.getParameter("checkInDate"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkOutDate");
		String room = request.getParameter("r_room");
		int r_room = Integer.parseInt(room);
		
		HotelDTO hDto = hotelService.viewHotel(h_no);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("h_name", hDto.getH_name());
		map.put("h_price", hDto.getH_price());
		map.put("r_checkin", checkInDate);
		map.put("r_checkout", checkOutDate);
		map.put("r_room", r_room);
		
		mav.setViewName("/hotel/hotel_reservation");
		mav.addObject("reservation", map);
		
		return mav;

	}
}
