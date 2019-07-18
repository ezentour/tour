package com.example.ezentour.model.home.dao;

import java.util.List;

import com.example.ezentour.model.home.dto.HomeSearchDTO;

public interface HomeSearchDAO {
	public List<HomeSearchDTO> select(String h_address);
}
