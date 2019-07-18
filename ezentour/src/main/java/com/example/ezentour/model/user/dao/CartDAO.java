package com.example.ezentour.model.user.dao;

import java.util.List;

import com.example.ezentour.model.user.dto.CartDTO;

public interface CartDAO {
	public void insertCartList(int h_no,String h_m_id,String checkInDate,String checkOutDate);
	public List<CartDTO> viewCartList(String m_id,int startPage,int endPage);
	public void cartDelete(int s_no);
	public int cartListCount();
}

