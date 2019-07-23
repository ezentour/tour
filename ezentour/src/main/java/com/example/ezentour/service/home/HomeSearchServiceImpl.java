package com.example.ezentour.service.home;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ezentour.controller.member.UserController;
import com.example.ezentour.model.home.dao.HomeSearchDAO;
import com.example.ezentour.model.hotel.dao.HotelDAO;
import com.example.ezentour.model.hotel.dao.HotelRoomDAO;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

@Service
public class HomeSearchServiceImpl implements HomeSearchService {
	private static final Logger LOG = LoggerFactory.getLogger(HomeSearchServiceImpl.class);
	
	@Inject
	HomeSearchDAO hSearchDao;
	@Inject
	UserController userController;
	
	@Override
	public List<HotelDTO> list(String h_address,int hr_room, String h_type,String checkIn,String checkOut) {
		List<HotelDTO> hList = hSearchDao.list(h_address, h_type); // 주소, 타입 조건 hotel 리스트 출력
		return hList;
	}
	
	@Override
	public List<HotelRoomDTO> bookedRoomList(String date){
		List<HotelRoomDTO> hRoomList = hSearchDao.bookedRoomList(date);
		return hRoomList;
	}

}
