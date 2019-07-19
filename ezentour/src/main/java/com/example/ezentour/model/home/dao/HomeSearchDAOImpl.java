package com.example.ezentour.model.home.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.home.dto.HomeSearchDTO;

@Repository
public class HomeSearchDAOImpl implements HomeSearchDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HomeSearchDTO> select(String h_address) {
		// TODO Auto-generated method stub
		return null;
	}

}
