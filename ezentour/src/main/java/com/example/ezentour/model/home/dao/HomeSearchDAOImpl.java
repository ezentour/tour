package com.example.ezentour.model.home.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.ezentour.controller.HotelController;
import com.example.ezentour.model.home.dto.HomeSearchDTO;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

@Repository
public class HomeSearchDAOImpl implements HomeSearchDAO {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HotelDTO> list(String h_address,String h_type) {

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_address", h_address);
		map.put("h_type", h_type);
	
		LOG.info("*******************homesearch : " + map.toString());
		
		return sqlSession.selectList("hotel.hotel_conditionSearch", map);
		
	}
	@Override
	public List<HotelRoomDTO> bookedRoomList(String date){
		return sqlSession.selectList("hotelroom.hotel_bookedRoom",date);
	}
}
