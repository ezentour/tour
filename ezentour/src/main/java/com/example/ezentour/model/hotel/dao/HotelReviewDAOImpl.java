package com.example.ezentour.model.hotel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.hotel.dto.HotelReviewDTO;

@Repository
public class HotelReviewDAOImpl implements HotelReviewDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HotelReviewDTO> listReview(int h_no) {
		return sqlSession.selectList("review.review_list", h_no);
	}
	
	@Override
	public void insertReview(HotelReviewDTO hreDto) {
		sqlSession.insert("review.review_insert", hreDto);
	}
	
}