package com.example.ezentour.model.board.dao;

import java.util.List;

import com.example.ezentour.model.board.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> boardList(String search,int startPage, int endPage);
	public void insertBoard(BoardDTO bDto);
	public BoardDTO viewBoard(int b_no);
	public void deleteBoard(int b_no);
	public void updateBoard(BoardDTO bDto);
	public boolean checkId(String b_m_id);
	public int boardCount();
}
