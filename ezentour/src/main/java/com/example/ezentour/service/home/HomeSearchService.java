package com.example.ezentour.service.home;

import java.text.ParseException;
import java.util.List;

import com.example.ezentour.model.home.dto.HomeSearchDTO;

public interface HomeSearchService {
	public List<HomeSearchDTO> list(String h_address, String checkin, String checkout, int select_room, String h_type) throws ParseException;
}
