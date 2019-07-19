package com.example.ezentour.model.price.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.price.dto.PriceDTO;

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

	@Override
	public List<PriceDTO> selectAll() {
		return sqlSession.selectList("price.selectAll");
	}

	@Override
	public List<PriceDTO> select_detail(int p_r_no) {
		return sqlSession.selectList("price.select_detail", p_r_no);
	}

	@Override
	public PriceDTO select_total(int p_r_no) {
		return sqlSession.selectOne("price.select_total", p_r_no);
	}

}
