package com.example.ezentour.model.price.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PriceDAOImpl implements PriceDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(int p_r_no, int p_room){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("p_r_no", p_r_no);
		map.put("p_room", p_room);
		sqlSession.insert("price.insert", map);
	}

}
