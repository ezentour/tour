package com.example.ezentour.service.user;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.user.dao.CartDAO;
import com.example.ezentour.model.user.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDao;
	
	@Override
	public void insertCartList(int s_no,int h_no,String h_m_id,String checkInDate,String checkOutDate) {
		cartDao.insertCartList(s_no, h_no, h_m_id,checkInDate, checkOutDate);
	}
	
	@Override
	public List<CartDTO> viewCartList(){
		return cartDao.viewCartList();
	}

}
