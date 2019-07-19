package com.example.ezentour.service.hotel;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.hotel.dao.HotelRoomDAO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

@Service
public class HotelRoomServiceImpl implements HotelRoomService {
	@Inject
	HotelRoomDAO hrDao;
	
	@Override
	public void insertHotelRoom(HotelRoomDTO hrDto) {
		hrDao.insertHotelRoom(hrDto);
	}

	@Override
	public int selectone(int hr_h_no, String hr_date) {
		return hrDao.selectone(hr_h_no, hr_date);
	}

	@Override
	public void updateHotelRoom(int hr_h_no, String hr_date, int hr_room) {
		hrDao.updateHotelRoom(hr_h_no, hr_date, hr_room);
	}

	@Override
	public String RoomCheck(int hr_h_no, String hr_date, int r_room) {
		return hrDao.RoomCheck(hr_h_no, hr_date, r_room);
	}

}
