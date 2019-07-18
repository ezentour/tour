package com.example.ezentour.service.home;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.home.dao.HomeSearchDAO;
import com.example.ezentour.model.home.dto.HomeSearchDTO;

@Service
public class HomeSearchServiceImpl implements HomeSearchService {

	@Inject
	HomeSearchDAO hsDao;
	
	@Override
	public List<HomeSearchDTO> select(String h_address) {
		return null;
	}

}
