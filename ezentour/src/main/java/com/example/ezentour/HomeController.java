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
	public ModelAndView searchList(HttpServletRequest request,ModelAndView mav) throws ParseException {
		String h_address = request.getParameter("h_address"); // option name 값에 의한 value 값 가져오기
		String checkin = request.getParameter("checkin-date");
		String checkout = request.getParameter("checkout-date");
		String h_type = request.getParameter("hotel-type");
		int selected_room = Integer.parseInt(request.getParameter("room"));
		LOG.info("aasdlkfjal);sdkjf;alskdfjal;sdkjfal;skjdf;l"+h_address+", "+checkin+", "+checkout+", "+h_type+", "+selected_room);
		if(checkin.equals("") && checkout.equals("")) {
			List<HotelDTO> list = hotelService.dateListHotel(h_address, selected_room, h_type);
			mav.setViewName("hotel/hotel_home");
			mav.addObject("hsList", list);
			
			return mav;
		} else {
			
			mav.setViewName("hotel/hotel_home");
			mav.addObject("hsList", homeSearchService.list(h_address, checkin, checkout, selected_room, h_type));

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
