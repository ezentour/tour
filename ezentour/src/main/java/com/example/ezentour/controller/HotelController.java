package com.example.ezentour.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.user.CartService;

@Controller
public class HotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	HotelService hotelService;
	@Inject
	CartService cartService;
	
	HotelDTO hotelDto;
	
	@RequestMapping(value = "hotel/main")
	public ModelAndView hotel_home(ModelAndView mav) {		
		
		List<HotelDTO> list = hotelService.listHotel();
		mav.setViewName("hotel/hotel_home");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "hotel/detail/cart")
	public String hotel_detail_cart(HttpServletRequest request,Model model) throws ParseException {	
		
		String num = request.getParameter("num"); // 받아온 파라미터에 따라 페이지 변동
		String checkInDate = request.getParameter("checkInDate"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkOutDate");
		
		hotelDto = hotelService.viewHotel(2); // 호텔 번호 1로 임의의 값을 줌 ( view에 아직 호텔 정보 없어 정보 못가져옴)
		cartService.insertCartList(10,hotelDto.getH_no(),hotelDto.getH_m_id(),checkInDate,checkOutDate);
		
		LOG.info("cartServiceCheck" +cartService.viewCartList().toString() );
		List<CartDTO> list = cartService.viewCartList();
		model.addAttribute("list", list);
		
		
		if(num.equals("1")) {
			return "user/mypage/mycart";
		} else {
			return "hotel/hotel_detail";
		}
	}
	
	@RequestMapping(value="hotel/detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model) {
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		return "hotel/hotel_detail";
	}
}
