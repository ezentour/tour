package com.example.ezentour.model.price.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.price.dao.PriceDAO;

@Service
public class PriceServiceImpl implements PriceService {
	
	@Inject
	PriceDAO pDao;

	@Override
	public void insert(int p_r_no, int p_room){
		pDao.insert(p_r_no, p_room);
	}

}
