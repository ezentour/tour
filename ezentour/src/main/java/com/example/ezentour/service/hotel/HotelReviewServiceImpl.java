package com.example.ezentour.service.hotel;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.hotel.dao.HotelReviewDAO;
import com.example.ezentour.model.hotel.dto.HotelReviewDTO;

@Service
public class HotelReviewServiceImpl implements HotelReviewService {
	@Inject
	HotelReviewDAO hotelReviewDao;

	@Override
	public List<HotelReviewDTO> listReview(int h_no) {
		return hotelReviewDao.listReview(h_no);
	}
	
	@Override
	public void insertReview(HotelReviewDTO hreDto) {
		hotelReviewDao.insertReview(hreDto);
	}
}