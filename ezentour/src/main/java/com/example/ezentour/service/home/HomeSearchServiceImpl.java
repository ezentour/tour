package com.example.ezentour.service.home;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.home.dao.HomeSearchDAO;
import com.example.ezentour.model.home.dto.HomeSearchDTO;

@Service
public class HomeSearchServiceImpl implements HomeSearchService {

	@Inject
	HomeSearchDAO hDao;
	
	@Override
	public List<HomeSearchDTO> list(String h_address, String checkin, String checkout, int select_room, String h_type) {
		return hDao.list(h_address, checkin, checkout, select_room, h_type);
	}

}
