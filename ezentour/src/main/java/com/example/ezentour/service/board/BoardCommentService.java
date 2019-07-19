package com.example.ezentour.service.board;

import java.util.List;

import com.example.ezentour.model.board.dto.BoardCommentDTO;

public interface BoardCommentService {
	public void commetInsert(String c_m_id,String c_content, int c_b_no);
	public List<BoardCommentDTO> commentList();
	public String colorPick();
}
