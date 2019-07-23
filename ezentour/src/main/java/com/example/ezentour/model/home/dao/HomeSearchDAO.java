package com.example.ezentour.model.home.dao;

import java.util.List;

import com.example.ezentour.model.home.dto.HomeSearchDTO;
import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.hotel.dto.HotelRoomDTO;

public interface HomeSearchDAO {
	public List<HotelDTO> list(String h_address, String h_type);
	public List<HotelRoomDTO> bookedRoomList(String date);
}
