package com.example.ezentour.service.board;

import java.util.List;

import com.example.ezentour.model.board.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> boardList();
	public void insertBoard(BoardDTO bDto);
	public BoardDTO viewBoard(String b_m_id);
	public void deleteBoard(String b_m_id);
	public void updateBoard(BoardDTO bDto);
	public boolean checkId(String b_m_id);
}
