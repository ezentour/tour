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


@Controller
public class HomeController {
	
	private static final Logger LOG = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HomeSearchService homeSearchService;
	@Inject 
	HotelRoomService hotelroomService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		LOG.info("home 시작");

		return "index";
	}
	
	@RequestMapping(value = "search.do")
	public ModelAndView searchList(HttpServletRequest request, HomeSearchDTO hDto, ModelAndView mav) {
		String h_address = request.getParameter("region");
		String checkin = request.getParameter("checkin-date");
		String checkout = request.getParameter("checkout-date");
		int hr_room = Integer.parseInt(request.getParameter("room"));
		String h_type = request.getParameter("hotel-type");

		List<HomeSearchDTO> list = homeSearchService.list(h_address, checkin, checkout, hr_room, h_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("h_address", h_address);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("hr_room", hr_room);
		map.put("h_type", h_type);
		map.put("h_type", h_type);

		LOG.info("**********" + map);
		mav.setViewName("hotel/hotel_home");
		mav.addObject("list", list);
		
		return mav;
		
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
