package com.example.ezentour.model.user.dao;

import java.util.Date;
import java.util.List;

import com.example.ezentour.model.user.dto.CartDTO;

public interface CartDAO {
	public void insertCartList(int s_no,int h_no,String h_m_id,Date checkInDate,Date checkOutDate);
	public List<CartDTO> viewCartList();
}
