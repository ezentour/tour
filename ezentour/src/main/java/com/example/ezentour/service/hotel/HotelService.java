package com.example.ezentour.service.hotel;

import java.util.List;

import com.example.ezentour.model.hotel.dto.HotelDTO;

public interface HotelService {
	public HotelDTO viewHotel(int h_no);
	public void insertHotel(HotelDTO hDto);
	public List<HotelDTO> listHotel(String h_m_id); 
	public void updateHotel(HotelDTO hDto);
	public void deleteHotel(int h_no);
	public List<HotelDTO> listHotel(); 
}
