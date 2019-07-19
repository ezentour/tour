package com.example.ezentour.model.price.service;

import java.util.List;

import com.example.ezentour.model.price.dto.PriceDTO;

public interface PriceService {
	public void insert(int p_r_no, int p_room);
	public List<PriceDTO> selectAll();
	public List<PriceDTO> select_detail(int p_r_no);
	public PriceDTO select_total(int p_r_no);
}
