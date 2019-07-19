package com.example.ezentour.controller;


import java.text.ParseException;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.service.hotel.HotelReviewService;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.member.MemberService;
import com.example.ezentour.service.user.CartService;

@Controller
public class HotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	HotelService hotelService;
	@Inject
	CartService cartService;
	@Inject
	MemberService memberService;
	@Inject
	HotelReviewService hotelReviewService;
	
	@RequestMapping(value = "hotel/main")
	public ModelAndView hotel_home(ModelAndView mav) {		
		
		List<HotelDTO> list = hotelService.listHotel();
		mav.setViewName("hotel/hotel_home");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "hotel/detail/cart")
	public String hotel_detail_cart(HttpServletRequest request,Model model,HttpSession session,RedirectAttributes redirectAttributes) throws ParseException {	
		
		String num = request.getParameter("num"); // 받아온 파라미터에 따라 페이지 변동
		String checkInDate = request.getParameter("checkin"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkout");
		String m_id = (String) session.getAttribute("m_id");
		String str = request.getParameter("h_no");
		int h_no = Integer.parseInt(str);
		LOG.info("checkInDate : " + checkInDate);
		
		HotelDTO hotelDto = hotelService.viewHotel(h_no);
		LOG.info(hotelDto.toString());
		
		cartService.insertCartList(hotelDto.getH_no(),m_id,checkInDate,checkOutDate);
		
		//1이면 장바구니이동?yes 그외 그 페이지
		if(num.equals("1")) {
			return "redirect:../../mypage/user/mycart?page=1";
		} else {
			 redirectAttributes.addAttribute("h_no", h_no);
			return "redirect:../../hotel/detail.do";
		}
	}
	
	@RequestMapping(value="hotel/detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model,HttpSession sesstion) {
		// 호텔 정보
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		// 호텔 리뷰 정보
		model.addAttribute("reviewList", hotelReviewService.listReview(h_no));
		
		String m_id = (String) sesstion.getAttribute("m_id");
		if(m_id != null) {
			model.addAttribute("field", memberService.viewMember(m_id).getM_field());
			return "hotel/hotel_detail";
		} 
		return "hotel/hotel_detail";
	}
}