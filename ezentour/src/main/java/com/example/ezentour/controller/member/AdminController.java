package com.example.ezentour.controller.member;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.service.hotel.HotelService;

@Controller
public class AdminController {
	private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	HotelService hotelService;
	@RequestMapping(value = "mypage/admin/user_list")
	public String home() {		
		return "admin/mypage/user_list";
	}

	@RequestMapping(value = "mypage/admin/hotel_list_Y")
	public ModelAndView hotellist_yes(ModelAndView mav) {		
		mav.setViewName("admin/mypage/hotel_list_Y");
		mav.addObject("list", hotelService.Hotel_approve("Y"));
		return mav;	
	}

	@RequestMapping(value = "mypage/admin/hotel_list_N")
	public ModelAndView hotellist_no(ModelAndView mav) {		
		mav.setViewName("admin/mypage/hotel_list_N");
		mav.addObject("list", hotelService.Hotel_approve("N"));
		return mav;	
	}
	
	@RequestMapping(value = "mypage/admin/hotel_detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model) {
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		return "admin/mypage/hotel_detail";
	}
	
	@RequestMapping(value = "mypage/admin/hotel_approve_update")
	public String update(@RequestParam int h_no) {
		hotelService.updateHotel_approve(h_no);		
		return "redirect:hotel_list_N";
	}
	
	@RequestMapping(value = "mypage/admin/hotel_approve_delete")
	public String delete(@RequestParam int h_no) {
		hotelService.deleteHotel(h_no);		
		return "redirect:hotel_list_N";
	}
}
