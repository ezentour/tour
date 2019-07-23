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

@Repository
public class HomeSearchDAOImpl implements HomeSearchDAO {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HomeSearchDTO> list(String h_address, String date, int select_room, String h_type) {

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_address", h_address);
		map.put("hr_date", date);
		map.put("select_room", select_room);
		map.put("h_type", h_type);
	
		LOG.info("*******************homesearch : " + map.toString());
		
		return sqlSession.selectList("hotel.hotel_searchList", map);
		
		
	}

}
