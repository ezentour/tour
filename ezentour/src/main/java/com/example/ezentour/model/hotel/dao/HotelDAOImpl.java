package com.example.ezentour.model.hotel.dao;

import java.util.List;

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
}
