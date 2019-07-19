package com.example.ezentour.model.price.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.price.dao.PriceDAO;
import com.example.ezentour.model.price.dto.PriceDTO;

@Service
public class PriceServiceImpl implements PriceService {
	
	@Inject
	PriceDAO pDao;

	@Override
	public void insert(int p_r_no, int p_room){
		pDao.insert(p_r_no, p_room);
	}

	@Override
	public List<PriceDTO> selectAll() {		
		return pDao.selectAll();
	}

	@Override
	public List<PriceDTO> select_detail(int p_r_no) {		
		return pDao.select_detail(p_r_no);
	}

	@Override
	public PriceDTO select_total(int p_r_no) {
		return pDao.select_total(p_r_no);
	}

}
