package com.example.ezentour;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.controller.member.UserController;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.service.hotel.HotelRoomService;
import com.example.ezentour.service.hotel.HotelService;

@Controller
public class HomeController {

	private static final Logger LOG = LoggerFactory.getLogger(HomeController.class);

	@Inject
	HotelService hotelService;
	@Inject
	HotelRoomService hotelroomService;
	@Inject
	UserController userController;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		LOG.info("home 시작");

		return "index";
	}
	
	// 홈 조건 검색!
	@RequestMapping(value = "search.do")
	public ModelAndView searchList(HttpServletRequest request, ModelAndView mav, HotelDTO hotelDto, HttpServletResponse response)
			throws ParseException {
		String h_address = request.getParameter("h_address");
		String checkin = request.getParameter("checkin-date");
		String checkout = request.getParameter("checkout-date");
		String h_type = request.getParameter("hotel-type");
		boolean insert = true;

		int select_room = Integer.parseInt(request.getParameter("room"));

		if (checkin.equals("") && checkout.equals("")) {
			List<HotelDTO> list = hotelService.dateListHotel(h_address, select_room, h_type);
			
			mav.setViewName("hotel/hotel_home");
			mav.addObject("hsList", list);
			
			return mav;
			
		} else {
			//조건 충족시 데이터 삽입할 리스트 생성
			ArrayList<HotelDTO> hlist = new ArrayList<HotelDTO>();
			
			// 전체 호텔 조회
			List<HotelDTO> list = hotelService.listHotel();
			//체크인 체크아웃 날짜 기간 
			ArrayList<String> dates = userController.dateInteval2(checkin, checkout);
			// 각 호텔 루프 돌면서
			for (HotelDTO hDto : list) {
				// 한개의 호텔이 지역과 유형이 먼저 충족한지 체크
				HotelDTO shDto = hotelService.selectHotel_room(hDto.getH_no(), h_address, h_type);
				// 충족한 데이터가 있으면
				if (shDto != null) {
					// 체크인 체크아웃 루프 돌기
					for (String date : dates) {
							// 예약 되어있는 방 테이블에 존재시
						if (hotelroomService.selectone(hDto.getH_no(), date) > 0) {
							String result = hotelroomService.RoomCheck(hDto.getH_no(), date, select_room);
							// 가능하면 리스트 삽입할수 있도록 true
							if (result.equals("true")) {
								insert = true;
							} else {
								insert = false;
							}
						} else { // 존재안할 시 전체 호텔 방 개수와 내가 선택한 방개수 비교
							if (hDto.getH_room() >= select_room) {
								insert = true;
							} else
								insert = false;
						}
					}
					// 조건 충족한 데이터는 빈 리스트에 추가
					if (insert) {
						hlist.add(shDto);
					}
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
					} catch (IOException e) {
						e.printStackTrace();
					}
					out.println("<script>alert('찾으시는 숙소가 없습니다.'); location.href='/ezentour/';</script>");
					out.flush();
				}
			}
			mav.setViewName("hotel/hotel_home");
			mav.addObject("hsList", hlist);
			
			return mav;
		}
	}
}
