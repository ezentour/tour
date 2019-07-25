package com.example.ezentour.service.hotel;

import java.text.ParseException;
import java.util.List;

import com.example.ezentour.model.hotel.dto.HotelDTO;

public interface HotelService {
	public HotelDTO viewHotel(int h_no);
	public void insertHotel(HotelDTO hDto);
	public List<HotelDTO> listHotel(String h_m_id); 
	public void updateHotel(HotelDTO hDto);
	public void deleteHotel(int h_no);
	public List<HotelDTO> listHotel(); 
	public List<HotelDTO> Hotel_approve(String approve);
	public void updateHotel_approve(int h_no);
	public int selectHotel_room(int h_no);
	public List<HotelDTO> dateListHotel(String h_address, int h_room, String h_type); 
	public HotelDTO selectHotel_room(int h_no, String h_address, String h_type);
	public HotelDTO selectHotel_roomPrice(int h_no,String h_type) ;
	public List<HotelDTO> priceSearchList(int minPrice, int maxPrice,int select_room,String checkIn,String checkOut,String hotelType) throws ParseException;
	public List<HotelDTO> priceSearch(int minPrice, int maxPrice);
}
