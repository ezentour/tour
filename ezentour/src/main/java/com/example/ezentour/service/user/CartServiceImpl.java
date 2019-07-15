package com.example.ezentour.service.user;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ezentour.controller.HotelController;
import com.example.ezentour.model.user.dao.CartDAO;
import com.example.ezentour.model.user.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	CartDAO cartDao;
	
	@Override
	public void insertCartList(int h_no,String h_m_id,String checkInDate,String checkOutDate) {
		cartDao.insertCartList(h_no, h_m_id,checkInDate, checkOutDate);
	}
	
	@Override
	public List<CartDTO> viewCartList(String m_id){
		return cartDao.viewCartList(m_id);
	}
	public void cartDelete(int s_no) {
		LOG.info("s_noCheck(CartService) :" +s_no);
		cartDao.cartDelete(s_no);
	}
}
