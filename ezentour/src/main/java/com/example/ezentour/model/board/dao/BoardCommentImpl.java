package com.example.ezentour.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.example.ezentour.model.board.dto.BoardCommentDTO;

public class BoardCommentImpl implements BoardCommentDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardCommentDTO> commetList() {
		
		return null;
	}

}
