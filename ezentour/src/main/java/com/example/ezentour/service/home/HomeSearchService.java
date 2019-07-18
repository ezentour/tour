package com.example.ezentour.service.home;

import java.util.List;

import com.example.ezentour.model.home.dto.HomeSearchDTO;

public interface HomeSearchService {
	public List<HomeSearchDTO> select(String h_address);
}
