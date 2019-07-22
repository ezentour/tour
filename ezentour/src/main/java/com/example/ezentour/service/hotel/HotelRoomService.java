package com.example.ezentour.service.hotel;

import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

public interface HotelRoomService {
	public void insertHotelRoom(HotelRoomDTO hrDto);
	public int selectone(int hr_h_no, String hr_date);
	public void updateHotelRoom(int hr_h_no, String hr_date, int hr_room);
	public String RoomCheck(int hr_h_no, String hr_date, int r_room);
	public void updateCancel(int hr_h_no, String hr_date, int hr_room);
}
