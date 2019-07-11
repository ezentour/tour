package com.example.ezentour.model.hotel.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.hotel.dto.HotelDTO;

@Repository
public class HotelDAOImpl implements HotelDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public HotelDTO viewHotel(int h_no) {
		return	sqlSession.selectOne("hotel.hotel_select",h_no);
	}

}
