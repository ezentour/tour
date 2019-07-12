package com.example.ezentour.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ezentour.model.board.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> boardList() {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	public void insertBoard(BoardDTO bDto) {
		sqlSession.insert("board.insertBoard", bDto);
	}

	@Override
	public BoardDTO viewBoard(String b_no) {
		return sqlSession.selectOne("board.boardView", b_no);
	}

	@Override
	public void deleteBoard(String b_m_id) {

	}

	@Override
	public void updateBoard(BoardDTO bDto) {

	}

	@Override
	public boolean checkPw(String b_m_id) {
		return false;
	}

}
