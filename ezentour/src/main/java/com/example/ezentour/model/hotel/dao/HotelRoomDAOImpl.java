package com.example.ezentour.model.hotel.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.hotel.dto.HotelRoomDTO;
@Repository
public class HotelRoomDAOImpl implements HotelRoomDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertHotelRoom(HotelRoomDTO hrDto) {
		sqlSession.insert("hotelroom.hotelroom_insert", hrDto);
	}

	@Override
	public int selectone(int hr_h_no, String hr_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hr_h_no", hr_h_no);
		map.put("hr_date", hr_date);
		return sqlSession.selectOne("hotelroom.selectone", map);
	}

	@Override
	public void updateHotelRoom(int hr_h_no, String hr_date, int hr_room) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hr_h_no", hr_h_no);
		map.put("hr_date", hr_date);
		map.put("hr_room", hr_room);
		sqlSession.update("hotelroom.hotelroom_update", map);		
	}

	@Override
	public String RoomCheck(int hr_h_no, String hr_date, int r_room) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hr_h_no", hr_h_no);
		map.put("hr_date", hr_date);
		map.put("r_room", r_room);
		return sqlSession.selectOne("hotelroom.roomcheck", map);
	}
}
