package com.example.ezentour.model.hotel.dao;

import java.util.List;

import com.example.ezentour.model.hotel.dto.HotelReviewDTO;

public interface HotelReviewDAO {
	public List<HotelReviewDTO> listReview(int h_no); 
	public void insertReview(HotelReviewDTO hreDto);
}
