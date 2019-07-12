package com.example.ezentour.service.user;

import java.util.Date;
import java.util.List;

import com.example.ezentour.model.user.dto.CartDTO;

public interface CartService {
	public void insertCartList(int s_no,int h_no,String h_m_id,Date checkInDate, Date checkOutDate);
	public List<CartDTO> viewCartList();
}
