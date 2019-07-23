package com.example.ezentour.model.home.dao;

import java.util.List;

import com.example.ezentour.model.home.dto.HomeSearchDTO;

public interface HomeSearchDAO {
	public List<HomeSearchDTO> list(String h_address, String date, int select_room, String h_type);
}
