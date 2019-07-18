package com.example.ezentour.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;
import com.example.ezentour.model.member.dto.MemberDTO;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.model.user.dto.ReservationDTO;
import com.example.ezentour.service.hotel.HotelRoomService;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.member.MemberService;
import com.example.ezentour.service.user.CartService;
import com.example.ezentour.service.user.ReservationService;

@Controller
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Inject
	CartService cartService;
	@Inject
	MemberService memberService;
	@Inject
	HotelService hotelService;
	@Inject
	HotelRoomService hotelroomService;
	@Inject
	ReservationService reservationService;

	@RequestMapping(value = "mypage/user/main")
	public String home() {
		return "user/mypage/user_home";
	}

	@RequestMapping(value = "mypage/user/mycart")
	public String myCart(Model model, HttpSession session,HttpServletRequest request) {
		String m_id = (String) session.getAttribute("m_id");
		int curPage = Integer.parseInt(request.getParameter("page"));
		LOG.info("curPage(UserControl) : " +curPage);
		int totalPage = cartService.cartListCount();
		LOG.info("m_id Check : " + m_id);

		if (m_id == null) {
			return "user/mypage/mycart";
		} else if (m_id != null && m_id.length() != 0) {
			MemberDTO memberDto = memberService.viewMember(m_id);
			LOG.info("memberDto(usercontroller)" + memberDto);

			if ((memberDto.getM_field()).equals("U")) {
				LOG.info("check(userController)");
				List<CartDTO> list = cartService.viewCartList(m_id,curPage);
				model.addAttribute("totalPage",totalPage);
				model.addAttribute("curPage", curPage);
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
		return "redirect:../../mypage/user/mycart?page=1";
	}

	@RequestMapping(value = "mypage/user/reservation_check")
	public ModelAndView reservation_check(HttpServletRequest request, HttpSession session, ModelAndView mav, @RequestParam int h_no) throws ParseException {
		String checkInDate = request.getParameter("checkin"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkout");
		String room = request.getParameter("r_room");
		int r_room = Integer.parseInt(room);
		String result = "";
		String dateOk = "";
		
		HotelDTO hDto = hotelService.viewHotel(h_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("h_no", h_no);
		map.put("h_name", hDto.getH_name());
		map.put("h_price", hDto.getH_price());
		map.put("r_checkin", checkInDate);
		map.put("r_checkout", checkOutDate);
		map.put("r_room", r_room);
		
		
		ArrayList<String> dates = dateInteval(checkInDate, checkOutDate);
		
		for(String date : dates) {
			String check = hotelroomService.RoomCheck(h_no, date, r_room);
			
			if(check == null)
				check = "true";			
			System.out.println("check " + check );
			
			if (check.equals("true")) {
				if(!result.equals("예약불가"))
					result = "예약가능";			
			} else {
				result = "예약불가";
				dateOk += date + ", ";
			}
		}
		
		if(result.equals("예약불가")) {
			result += " (" + dateOk + " 방이 부족합니다.)";
		}
		
		map.put("result", result);
		
		mav.setViewName("/hotel/hotel_reservation");
		mav.addObject("reservation", map);

		return mav;

	}
	
	@RequestMapping(value = "mypage/user/reservation")
	public void reservation(@ModelAttribute ReservationDTO rDto, HttpSession session, @RequestParam int r_h_no) {
		String m_id = (String) session.getAttribute("m_id");
		rDto.setR_m_id(m_id);
		rDto.setR_h_no(r_h_no);	
		
		if(hotelroomService.selectone(r_h_no, rDto.getR_checkin()) > 0) {
			hotelroomService.updateHotelRoom(r_h_no, rDto.getR_checkin(), rDto.getR_room());
		} else {
			HotelRoomDTO hrDto = new HotelRoomDTO(r_h_no, rDto.getR_checkin(), rDto.getR_room());	
			System.out.println(hrDto.toString());
			//hotelroomService.insertHotelRoom(hrDto);
		}
		
		if(hotelroomService.selectone(r_h_no, rDto.getR_checkout()) > 0) {
			hotelroomService.updateHotelRoom(r_h_no, rDto.getR_checkout(), rDto.getR_room());
		} else {
			HotelRoomDTO hrDto = new HotelRoomDTO(r_h_no, rDto.getR_checkout(), rDto.getR_room());	
			System.out.println(hrDto.toString());
			//hotelroomService.insertHotelRoom(hrDto);
		}
		
		reservationService.insertReservation(rDto);
	}
	
	public static ArrayList<String> dateInteval(String start, String end) throws ParseException {
		final String DATE_PATTERN = "dd/MM/yy";	
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate = sdf.parse(start);
		Date endDate = sdf.parse(end);
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate;
		while (currentDate.compareTo(endDate) < 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		for (String date : dates) {
			System.out.println(date);
		}

		return dates;
	}
}
