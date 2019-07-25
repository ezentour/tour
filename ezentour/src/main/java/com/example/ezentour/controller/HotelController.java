package com.example.ezentour.controller;


import java.io.PrintWriter;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ezentour.model.board.dto.BoardDTO;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelReviewDTO;
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
		mav.addObject("hsList", list);
		
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
	public String hotel_list_detail(@RequestParam int h_no, Model model,HttpSession session) {
		// 호텔 정보
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		// 호텔 리뷰 정보
		model.addAttribute("reviewList", hotelReviewService.listReview(h_no));
		
		String m_id = (String) session.getAttribute("m_id");
		if(m_id != null) {
			model.addAttribute("field", memberService.viewMember(m_id).getM_field());
			return "hotel/hotel_detail";
		} 
		return "hotel/hotel_detail";
	}
	
	// 호텔 리뷰 작성 페이지로 이동
	@RequestMapping(value = "hotel/hotel_review_write.do")
	public String hotel_review_write(HttpServletRequest request, HttpSession session,
			Model model, HttpServletResponse response) throws Exception {
		LOG.info("hotel_review_write()");
		
		int h_no = Integer.parseInt(request.getParameter("h_no"));
		
		// 호텔 정보
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		// 호텔 리뷰 정보
		model.addAttribute("reviewList", hotelReviewService.listReview(h_no));
		
		//session.setAttribute("h_no", hno);
		
		//HotelReviewService.write(hno);
		//return "redirect:../board/main?page=1";
		
		String m_id = (String) session.getAttribute("m_id");
		
		if(m_id == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.');</script>");
			out.flush(); 
			return "member/login";
		}
		return "hotel/hotel_review";
	}
	
	@RequestMapping(value="hotel/searchDetail.do", method=RequestMethod.POST)
	public String hotel_detailSearch(Model model, HttpServletRequest request) throws ParseException {
		String checkIn = request.getParameter("checkin");
		String checkOut = request.getParameter("checkout");
		String hotelType = request.getParameter("hotel-type");
		int select_room = Integer.parseInt(request.getParameter("room"));
		int minPrice = Integer.parseInt(request.getParameter("minPrice"));
		int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
		LOG.info("priceCheck HotelController : " + minPrice + ", " + maxPrice);
				
		if (checkIn.equals("") && checkOut.equals("")) {
			List<HotelDTO> list = hotelService.priceSearch(minPrice,maxPrice);
			model.addAttribute("hsList", list);
			return "hotel/hotel_home";
		} else {
			List<HotelDTO> hsList = hotelService.priceSearchList(minPrice, maxPrice, select_room, checkIn, checkOut, hotelType);
			model.addAttribute("hsList", hsList);
			return"hotel/hotel_home";
		}
	}
	// 호텔 리뷰 작성 완료 버튼 클릭
	@RequestMapping(value = "hotel/hotel_review_writeBtn", method=RequestMethod.POST)
	public String hotel_review_writeBtn(@ModelAttribute HotelReviewDTO hreDto, HttpServletRequest request, Model model,HttpSession session) {
		int hre_h_no = Integer.parseInt(request.getParameter("h_no"));
		
		// 호텔 정보
		model.addAttribute("hotel", hotelService.viewHotel(hre_h_no));
		// 호텔 리뷰 정보
		model.addAttribute("reviewList", hotelReviewService.listReview(hre_h_no));
	
		String m_id = (String) session.getAttribute("m_id");
		
		hreDto.setHre_h_no(hre_h_no);
		hreDto.setHre_m_id(m_id);

		hotelReviewService.insertReview(hreDto);

		return "redirect:../hotel/detail.do?h_no=" + hre_h_no;
		
	}
	
	
}