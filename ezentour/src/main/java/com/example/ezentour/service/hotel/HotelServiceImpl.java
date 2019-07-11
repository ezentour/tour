package com.example.ezentour.service.hotel;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.hotel.dao.HotelDAO;
import com.example.ezentour.model.hotel.dto.HotelDTO;

@Service
public class HotelServiceImpl implements HotelService {
	@Inject
	HotelDAO hotelDao;
	
	@Override
	public HotelDTO viewHotel(int h_no) {
		return hotelDao.viewHotel(h_no);
	}

}
