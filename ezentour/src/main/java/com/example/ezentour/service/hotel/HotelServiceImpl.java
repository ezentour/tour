package com.example.ezentour.service.hotel;

import java.util.List;

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

	@Override
	public void insertHotel(HotelDTO hDto) {
		hotelDao.insertHotel(hDto);
		
	}

	@Override
	public List<HotelDTO> listHotel(String h_m_id) {		
		return hotelDao.listHotel(h_m_id);
	}

	@Override
	public void updateHotel(HotelDTO hDto) {
		hotelDao.updateHotel(hDto);
	}

	@Override
	public void deleteHotel(int h_no) {
		hotelDao.deleteHotel(h_no);
	}

	@Override
	public List<HotelDTO> listHotel() {
		return hotelDao.listHotel();
	}

	@Override
	public List<HotelDTO> Hotel_approve(String approve) {
		// TODO Auto-generated method stub
		return hotelDao.Hotel_approve(approve);
	}

	@Override
	public void updateHotel_approve(int h_no) {
		hotelDao.updateHotel_approve(h_no);
		
	}

}
