package com.example.ezentour.model.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ezentour.model.board.dto.BoardCommentDTO;

@Repository
public class BoardCommentImpl implements BoardCommentDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BoardCommentDAO.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void commetInsert(String c_m_id,String c_content, int c_b_no) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("c_m_id",c_m_id);
		map.put("c_content",c_content);
		map.put("c_b_no",c_b_no);
		sqlSession.insert("board.comment_insert",map);
	}
	
	@Override 
	public List<BoardCommentDTO> commentList(){
		return sqlSession.selectList("board.comment_view");
	}

}
