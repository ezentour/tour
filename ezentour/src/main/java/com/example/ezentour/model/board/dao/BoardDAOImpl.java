package com.example.ezentour.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.ezentour.controller.BoardController;
import com.example.ezentour.model.board.dto.BoardDTO;
import com.example.ezentour.model.user.dto.CartDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BoardDAOImpl.class);
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> boardList(String search,int startPage, int endPage ) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("search", search);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		LOG.info("BoardListCheck(boardDAOImpl)"+map.get("startPage"));
		
		List<BoardDTO> list= sqlSession.selectList("board.boardList",map);
		return list;
	}

	@Override
	public void insertBoard(BoardDTO bDto) {
		sqlSession.insert("board.insertBoard", bDto);
	}

	@Override
	public BoardDTO viewBoard(int b_no) {
		return sqlSession.selectOne("board.boardView", b_no);
	}

	@Override
	public void deleteBoard(int b_no) {
		sqlSession.delete("board.daleteBoard", b_no);
	}

	@Override
	public void updateBoard(BoardDTO bDto) {
		sqlSession.update("board.updateBoard", bDto);
	}

	@Override
	public boolean checkId(String b_m_id) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_m_id", b_m_id);
		int count = sqlSession.selectOne("board.checkId", map);
		if(count == 1) 
			result = true;
		return result;
	}

	public int boardCount() {
		int count = sqlSession.selectOne("board.count");
		LOG.info("boardCount(boardDAOImpl) : " + count);
		return count; 
	}
}
