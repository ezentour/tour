package com.example.ezentour.service.user;

import java.util.Date;
import java.util.List;

import com.example.ezentour.model.user.dto.CartDTO;

public interface CartService {
	public void insertCartList(int h_no,String h_m_id,String checkInDate, String checkOutDate);
	public List<CartDTO> viewCartList(String m_id);
	public void cartDelete(int s_no);
}
