package com.example.ezentour.service.hotel;

import java.util.List;

import com.example.ezentour.model.hotel.dto.HotelReviewDTO;

public interface HotelReviewService {
	public List<HotelReviewDTO> listReview(int h_no);
	
}