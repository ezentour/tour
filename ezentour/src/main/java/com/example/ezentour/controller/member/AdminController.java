package com.example.ezentour.controller.member;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.model.price.dto.PriceDTO;
import com.example.ezentour.model.price.service.PriceService;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.member.MemberService;

@Controller
public class AdminController {
	private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	HotelService hotelService;
	
	@Inject
	MemberService memberService;
	
	@Inject
	PriceService priceService;

	// 관리자가 사용자 명단 확인
	@RequestMapping(value = "mypage/admin/user_list")
	public ModelAndView memberList(ModelAndView mav, HttpSession session) {
		List<MemberDTO> mList = memberService.memberList();
		mav.setViewName("admin/mypage/user_list");
		mav.addObject("mList", mList);
		return mav;
	}
	
	// 관리자가 사용자 상세 페이지로 이동
	@RequestMapping(value = "mypage/admin/user_detail")
	public String memberDetail(@RequestParam String showM_id, Model model) {
		LOG.info("memberDetail()");
		model.addAttribute("member", memberService.memberDetail(showM_id));
		return "admin/mypage/user_detail";
	}
	
	// 관리자가 사용자 수정 페이지로 이동
	@RequestMapping(value = "mypage/admin/user_update")
	public String memberUpdate(@RequestParam String showMID, Model model) {
		LOG.info("memberUpdate()");
		model.addAttribute("member", memberService.memberDetail(showMID));
		return "admin/mypage/user_update";
	}
	
	// 관리자가 사용자 수정 완료 버튼을 누름
	@RequestMapping(value="mypage/admin/user_update_btn.do")
	public String memberUpdateBtn(@ModelAttribute MemberDTO dto) {
		LOG.info("memberUpdateBtn()");
		memberService.memberUpdate(dto);
		// redirect:mypage/admin/user_detail?list?
		//return "admin/mypage/user_detail";
		return "redirect:../../mypage/admin/user_detail?showM_id=" + dto.getM_id();
	}
	
	// 관리자가 사용자 탈퇴시키기
	@RequestMapping(value = "mypage/admin/user_delete") 
	public ModelAndView memberDelete(@RequestParam String showM_id, ModelAndView mav) {
		LOG.info("memberDelete()");
		memberService.memberDelete(showM_id);
		List<MemberDTO> mList = memberService.memberList();
		mav.setViewName("admin/mypage/user_list");
		mav.addObject("mList", mList);
		return mav;
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
	
	@RequestMapping(value = "mypage/admin/grossprofit")
	public ModelAndView grossprofit(ModelAndView mav) {
		List<PriceDTO> list = priceService.selectAll();
		mav.setViewName("admin/mypage/grossprofit");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value = "mypage/admin/grossprofit_detail")
	public ModelAndView grossprofit_detail(ModelAndView mav, @RequestParam int p_r_no) {
		List<PriceDTO> list = priceService.select_detail(p_r_no);
		mav.setViewName("admin/mypage/grossprofit_detail");
		mav.addObject("list",list);
		mav.addObject("p_r_no", p_r_no);
		mav.addObject("total",priceService.select_total(p_r_no));
		return mav;
	}
}
