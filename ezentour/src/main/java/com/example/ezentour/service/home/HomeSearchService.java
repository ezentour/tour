package com.example.ezentour.service.home;

import java.util.List;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

public interface HomeSearchService {
	public List<HotelDTO> list(String h_address,int hr_room, String h_type,String checkIn,String checkOut);
	public List<HotelRoomDTO> bookedRoomList(String date);
}
