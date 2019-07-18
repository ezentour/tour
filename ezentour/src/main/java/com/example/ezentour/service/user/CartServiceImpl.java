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
	public List<CartDTO> viewCartList(String m_id,int curPage){
		int startPage = 0;
		int endPage = 0;
		
		startPage = 5*curPage-4;
		endPage = 5*curPage;
		
		return cartDao.viewCartList(m_id,startPage,endPage);
	}
	public void cartDelete(int s_no) {
		LOG.info("s_noCheck(CartService) :" +s_no);
		cartDao.cartDelete(s_no);
	}
	
	@Override
	public int cartListCount() {
		int listAmount = cartDao.cartListCount();
		int totalPage=1;
		if(listAmount%5==0) { // 한 페이지당 5개
			totalPage = listAmount/5;
		} else {
			totalPage = (listAmount/5)+1;
		}
		LOG.info("totalPage(CartServiceImpl) : " + totalPage); 
		return totalPage;
	}
}
