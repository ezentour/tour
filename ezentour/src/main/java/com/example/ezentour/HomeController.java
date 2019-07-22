package com.example.ezentour;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.home.dto.HomeSearchDTO;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.user.dto.ReservationDTO;
import com.example.ezentour.service.home.HomeSearchService;
import com.example.ezentour.service.hotel.HotelRoomService;
import com.example.ezentour.service.hotel.HotelService;


@Controller
public class HomeController {
	
	private static final Logger LOG = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HomeSearchService homeSearchService;
	@Inject
	HotelService hotelService;
	@Inject
	HotelRoomService hotelroomService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		LOG.info("home 시작");

		return "index";
	}
	
	@RequestMapping(value = "search.do")
	public ModelAndView searchList(HttpServletRequest request, HomeSearchDTO hDto, ModelAndView mav, HotelDTO hotelDto) throws ParseException {
		String h_address = request.getParameter("region");
		String checkin = request.getParameter("checkin-date");
		String checkout = request.getParameter("checkout-date");
		int room = Integer.parseInt(request.getParameter("room"));
		
		String h_type = request.getParameter("hotel-type");
		int select_room = Integer.parseInt(request.getParameter("room"));
		
		if(checkin.equals("") && checkout.equals("")) {
			List<HotelDTO> list = hotelService.dateListHotel(h_address, room, h_type);
			mav.setViewName("hotel/hotel_home");
			mav.addObject("list", list);
			
			return mav;
		} else {
			List<HomeSearchDTO> hsList = homeSearchService.list(h_address, checkin, checkout, select_room, h_type);
			
			LOG.info("*************hsList:" + hsList);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("h_address", h_address);
			map.put("checkin", checkin);
			map.put("checkout", checkout);
			map.put("select_room", select_room);
			map.put("h_type", h_type);
			
			int h_no = Integer.parseInt(request.getParameter("h_no"));
			select_room = Integer.parseInt(request.getParameter("r_room"));
			LOG.info("*************request:" + h_no + select_room);
			String result = "";
			String dateOk = "";
			
			ArrayList<String> dates = dateInteval(checkin, checkout);
			
			for (String date : dates) {
				String check = hotelroomService.RoomCheck(h_no, date, room);

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

			
			mav.setViewName("hotel/hotel_home");
			mav.addObject("list", map);

			return mav;
		}
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
