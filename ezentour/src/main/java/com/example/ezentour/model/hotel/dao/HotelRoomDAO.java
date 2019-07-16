package com.example.ezentour.model.hotel.dao;

import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

public interface HotelRoomDAO {
	public void insertHotelRoom(HotelRoomDTO hrDto);
	public HotelRoomDTO selectone(int hr_h_no, String hr_date);
	public void updateHotelRoom(int hr_h_no, String hr_date, int hr_room);
}
