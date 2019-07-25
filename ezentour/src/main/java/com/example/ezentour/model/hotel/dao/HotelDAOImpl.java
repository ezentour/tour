package com.example.ezentour.model.hotel.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.ezentour.controller.HotelController;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.user.dto.CartDTO;

@Repository
public class HotelDAOImpl implements HotelDAO {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	SqlSession sqlSession;
	
	@Override
	public HotelDTO viewHotel(int h_no) {
		return	sqlSession.selectOne("hotel.hotel_select",h_no);
	}

	@Override
	public void insertHotel(HotelDTO hDto) {
		sqlSession.insert("hotel.hotel_insert", hDto);		
	}


	@Override
	public void updateHotel(HotelDTO hDto) {
		sqlSession.update("hotel.hotel_update", hDto);
		
	}

	@Override
	public void deleteHotel(int h_no) {
		sqlSession.delete("hotel.hotel_delete", h_no);
	}

	@Override
	public List<HotelDTO> listHotel() {
		return sqlSession.selectList("hotel.hotel_list");
	}
	@Override
	public List<HotelDTO> listHotel(String h_m_id) {
		return sqlSession.selectList("hotel.hotel_select_mid", h_m_id);
	}

	@Override
	public List<HotelDTO> Hotel_approve(String approve) {
		if(approve.equals("N"))
			return sqlSession.selectList("hotel.hotel_approve_n", approve);
		else
			return sqlSession.selectList("hotel.hotel_approve_y", approve);
	}

	@Override
	public void updateHotel_approve(int h_no) {
		sqlSession.update("hotel.hotel_approve_update", h_no);
	}

	@Override
	public HotelDTO selectHotel_room(int h_no) {		
		return sqlSession.selectOne("hotel.hotel_room_select", h_no);
	}
	
	@Override
	public List<HotelDTO> dateListHotel(String h_address, int h_room, String h_type) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_address", h_address);
		map.put("h_room", h_room);
		map.put("h_type", h_type);
		
		LOG.info("*********************map : " + map.toString());
		
		List<HotelDTO> list= sqlSession.selectList("hotel.datex", map);
		
		return list;
	}

	@Override
	public HotelDTO selectHotel_room(int h_no, String h_address, String h_type) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_address", h_address);
		map.put("h_no", h_no);
		map.put("h_type", h_type);
		
		return sqlSession.selectOne("hotel.hoteldto_select", map );
	}; 
	@Override
	public HotelDTO selectHotel_roomPrice(int h_no,String h_type) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_no", h_no);
		map.put("h_type", h_type);
		
		return sqlSession.selectOne("hotel.hoteldto_selectPrice", map );
	};
	
	@Override
	public List<HotelDTO> priceSearchList(int minPrice, int maxPrice){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		
		return sqlSession.selectList("hotel.hotel_priceSearch", map);
	}
}
