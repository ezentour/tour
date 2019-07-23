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
import com.example.ezentour.model.price.dto.PriceDTO;
import com.example.ezentour.model.price.service.PriceService;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.model.user.dto.ReservationDTO;
import com.example.ezentour.service.hotel.HotelReviewService;
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
	PriceService priceService;
	@Inject
	ReservationService reservationService;
	@Inject
	HotelReviewService hotelReviewService;
	
	@RequestMapping(value = "mypage/user/user_reservation")
	public ModelAndView userMain(HttpSession session, ModelAndView mav) {
		String r_m_id = (String) session.getAttribute("m_id");
		
		List<ReservationDTO> list = reservationService.selectReservation(r_m_id);
		
		mav.setViewName("user/mypage/user_reservation");
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value = "mypage/user/hotel_detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model) {
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		return "user/mypage/hotel_detail";
	}

	@RequestMapping(value = "mypage/user/mycart")
	public String myCart(Model model, HttpSession session, HttpServletRequest request) {
		String m_id = (String) session.getAttribute("m_id");
		int curPage = Integer.parseInt(request.getParameter("page"));
		LOG.info("curPage(UserControl) : " + curPage);
		int totalPage = cartService.cartListCount();
		LOG.info("m_id Check : " + m_id);

		if (m_id == null) {
			return "user/mypage/mycart";
		} else if (m_id != null && m_id.length() != 0) {
			MemberDTO memberDto = memberService.viewMember(m_id);
			LOG.info("memberDto(usercontroller)" + memberDto);

			if ((memberDto.getM_field()).equals("U")) {
				LOG.info("check(userController)");
				List<CartDTO> list = cartService.viewCartList(m_id, curPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("curPage", curPage);
				model.addAttribute("list", list);

				return "user/mypage/mycart";
			}
		}
		return "user/mypage/mycart";
	}

	@RequestMapping(value = "mypage/user/delete")
	public String delete(HttpServletRequest request, HttpSession session, Model model) {
		String[] checkBox = request.getParameterValues("check");
		LOG.info("checkBox.length" + checkBox.length);
		for (int i = 0; i <= checkBox.length - 1; i++) {
			int intCheckBox = Integer.parseInt(checkBox[i]);
			LOG.info("IntCheckBox(userController) : " + intCheckBox);
			cartService.cartDelete(intCheckBox);
		}
		return "redirect:../../mypage/user/mycart?page=1";
	}

	@RequestMapping(value = "mypage/user/reservation_check")
	public ModelAndView reservation_check(HttpServletRequest request, HttpSession session, ModelAndView mav,
			@RequestParam int h_no) throws ParseException {
		String m_id = (String) session.getAttribute("m_id");
		String checkInDate = request.getParameter("checkin"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkout");
		String room = request.getParameter("r_room");
		int r_room = Integer.parseInt(room);
		String result = "";
		String dateOk = "";
		
		
		HotelDTO hDto = hotelService.viewHotel(h_no);
		
		int r_price = (int) (hDto.getH_price() * calDateBetweenAandB(checkInDate, checkOutDate) * r_room);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("h_no", h_no);
		map.put("h_name", hDto.getH_name());
		map.put("h_price", hDto.getH_price());
		map.put("r_price", r_price);
		map.put("r_checkin", checkInDate);
		map.put("r_checkout", checkOutDate);
		map.put("r_room", r_room);

		ArrayList<String> dates = dateInteval(checkInDate, checkOutDate);

		for (String date : dates) {
			String check = hotelroomService.RoomCheck(h_no, date, r_room);

			if (check == null)
				check = "true";
			System.out.println("check " + check);

			if (check.equals("true")) {
				if (!result.equals("예약불가"))
					result = "예약가능";
			} else {
				result = "예약불가";
				dateOk += date + ", ";
			}
		}

		if (result.equals("예약불가")) {
			result += " (" + dateOk + " 방이 부족합니다.)";
		}

		map.put("result", result);

		ReservationDTO rDto2 = new ReservationDTO(m_id, h_no, checkInDate, checkOutDate);
		boolean reservation = reservationService.selectReservation(rDto2);
		map.put("check", reservation);
		
		mav.setViewName("/hotel/hotel_reservation");
		mav.addObject("reservation", map);

		return mav;

	}

	@RequestMapping(value = "mypage/user/reservation")
	public String reservation(@ModelAttribute ReservationDTO rDto, HttpSession session, @RequestParam int r_h_no, Model model)
			throws ParseException {
		String m_id = (String) session.getAttribute("m_id");
		rDto.setR_m_id(m_id);
		rDto.setR_h_no(r_h_no);

		String checkin = rDto.getR_checkin();
		String checkout = rDto.getR_checkout();

		ReservationDTO rDto2 = new ReservationDTO(m_id, r_h_no, checkin, checkout);
		boolean reservation = reservationService.selectReservation(rDto2);
		System.out.println("---------------------" + reservation);
		if (!reservation) {
			ArrayList<String> dates = dateInteval(checkin, checkout);

			for (String date : dates) {

				if (hotelroomService.selectone(r_h_no, date) > 0) {
					LOG.info("방 개수 추가");
					hotelroomService.updateHotelRoom(r_h_no, date, rDto.getR_room());
				} else {
					HotelRoomDTO hrDto = new HotelRoomDTO(r_h_no, date, rDto.getR_room());
					LOG.info("hotelroom db 삽입 - " + hrDto.toString());
					hotelroomService.insertHotelRoom(hrDto);
				}
			}

			reservationService.insertReservation(rDto);
			
			int r_no = reservationService.selectReservation_no();
			int p_room = (int) (reservationService.selectReservation_money(r_no) * calDateBetweenAandB(checkin, checkout));
			priceService.insert(r_no, p_room);
			
			LOG.info("reservation db 삽입 - " + rDto.toString());
			
			return "redirect:user_reservation";
		} else {				
			return "redirect:user_reservation";	
		}

	}
	
	@RequestMapping(value = "mypage/user/reservation_cancel")
	public String reservation_cancel_view(@RequestParam int r_no, Model model) throws ParseException {
		ReservationDTO rDto = reservationService.select_reservation_cancel(r_no);
		String result = cancel_condition(rDto.getR_checkin().substring(0,10));
		model.addAttribute("result", result);
		model.addAttribute("reservation", rDto);
		return "user/mypage/reservation_cancel";
	}
	
	@RequestMapping(value = "mypage/user/reservation_cancel.do")
	public String reservation_cancel(@ModelAttribute ReservationDTO rDto, @RequestParam String r_check) throws ParseException {
		reservationService.updateReservation(rDto.getR_no());
		int p_room = -rDto.getR_price();		
		int r_no = rDto.getR_no();
		ArrayList<String> dates = dateInteval(rDto.getR_checkin(), rDto.getR_checkout());
		if(r_check.equals("취소가능 : 50% 환불")) {
			p_room = p_room/2;
			priceService.insert(r_no, p_room);				
			for (String date : dates) {
				hotelroomService.updateCancel(rDto.getR_h_no(), date, rDto.getR_room());
			}
		} else if(r_check.equals("취소가능 : 100% 환불")) {
			priceService.insert(r_no, p_room);			
			for (String date : dates) {
				hotelroomService.updateCancel(rDto.getR_h_no(), date, rDto.getR_room());
			}
		} else {		
			for (String date : dates) {
				hotelroomService.updateCancel(rDto.getR_h_no(), date, rDto.getR_room());
			}
		}
			
		
		return "redirect:user_reservation";
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
	
	// 날짜 일수 계산
	public static long calDateBetweenAandB(String date1, String date2) {
		long calDateDays = 0;
		try { // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서
				// 컴파일을 할 수 없다.
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy");
			// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
			Date FirstDate = format.parse(date1);
			Date SecondDate = format.parse(date2);

			// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
			// 연산결과 -950400000. long type 으로 return 된다.
			long calDate = FirstDate.getTime() - SecondDate.getTime();

			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다.
			// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
			calDateDays = calDate / (24 * 60 * 60 * 1000);

			calDateDays = Math.abs(calDateDays);

			System.out.println("두 날짜의 날짜 차이: " + calDateDays);
		} catch (ParseException e) {
			// 예외 처리
		}
		return calDateDays;
	}
	
	//체크인 취소여부
	public static String cancel_condition(String checkin) throws ParseException {
		final String DATE_PATTERN = "yyyy-MM-dd";
		String result = "";
		
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		
		Date date = sdf.parse(checkin);		
		//System.out.println("체크인 : " + date);
		
		Date current = new Date(); //현재날짜
		String cur = sdf.format(current.getTime());
		current = sdf.parse(cur);
		//System.out.println("오늘 : " + cur);	
		
		Calendar c7 = Calendar.getInstance(); // 체크인 일주일전
		c7.setTime(date);
		c7.add(Calendar.DATE, -7);
		String date7 = sdf.format(c7.getTime());
		Date d7 = sdf.parse(date7);
		//System.out.println("일주일전 : " + date7);

		Calendar c1 = Calendar.getInstance(); // 체크인 하루전, 당일
		c1.setTime(date);
		c1.add(Calendar.DATE, -1);
		String date1 = sdf.format(c1.getTime());
		Date d1 = sdf.parse(date1);
		//System.out.println("하루전 : " + date1);

		if (current.compareTo(d7) <= 0) {
			//System.out.println("일주일전 100% 환불");
			result = "취소가능 : 100% 환불";
		} else if (current.compareTo(d7) > 0 && current.compareTo(d1) < 0) {
			//System.out.println("2~6일 50% 환불");
			result = "취소가능 : 50% 환불";
		} else if (current.compareTo(d1) == 0 || current.compareTo(date) == 0)  {
			//System.out.println("당일과 하루전");
			result = "취소가능 : 환불불가";
		} else 
			result = "취소불가";

		return result;
	}
	
	@RequestMapping(value="mypage/user/reserve.do")
	public String hotel_list_detail(HttpServletRequest request, @RequestParam int h_no, Model model,HttpSession session) {
		String checkInDate = request.getParameter("checkin"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkout");
		// 호텔 정보
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		// 호텔 리뷰 정보
		model.addAttribute("reviewList", hotelReviewService.listReview(h_no));
		model.addAttribute("checkin", checkInDate);
		model.addAttribute("checkout", checkOutDate);
		
		String m_id = (String) session.getAttribute("m_id");
		if(m_id != null) {
			model.addAttribute("field", memberService.viewMember(m_id).getM_field());
			return "hotel/hotel_detail";
		} 
		return "hotel/hotel_detail";
	}
	
	@RequestMapping(value = "mypage/user/cancel_detail")
	public ModelAndView grossprofit_detail(ModelAndView mav, @RequestParam int p_r_no) {
		List<PriceDTO> list = priceService.select_detail(p_r_no);
		mav.setViewName("user/mypage/cancel_detail");
		mav.addObject("list",list);
		mav.addObject("p_r_no", p_r_no);
		mav.addObject("total",priceService.select_total(p_r_no));
		return mav;
	}
}