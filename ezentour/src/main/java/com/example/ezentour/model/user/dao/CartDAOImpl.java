package com.example.ezentour.model.user.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.user.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;
	Date date;
	CartDTO cartDto = new CartDTO(0,"","" ,"");
	
	@Override
	public void insertCartList(int h_no,String h_m_id,String checkInDate,String checkOutDate) {
		System.out.println("여기: "+ checkOutDate);
		cartDto.setS_h_no(h_no);
		cartDto.setS_m_id(h_m_id);
		cartDto.setS_checkin(checkInDate);
		cartDto.setC_checkout(checkOutDate);
		System.out.println("cartDtO(CartDAOImpl) :" + cartDto.toString());
		sqlSession.insert("user.cart_insert",cartDto);
	}
	@Override
	public List<CartDTO> viewCartList(String m_id){
		List<CartDTO> list= sqlSession.selectList("user.cart_innerJoinView",m_id);
		return list;
	}

}
