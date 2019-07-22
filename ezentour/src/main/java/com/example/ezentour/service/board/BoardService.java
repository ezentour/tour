package com.example.ezentour.service.board;

import java.util.List;

import com.example.ezentour.model.board.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> boardList();
	public void insertBoard(BoardDTO bDto);
	public BoardDTO viewBoard(int b_no);
	public void deleteBoard(int b_no);
	public void updateBoard(BoardDTO bDto);
	public boolean checkId(String b_m_id);
}
