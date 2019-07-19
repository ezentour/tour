package com.example.ezentour.model.board.dao;

import java.util.List;


import com.example.ezentour.model.board.dto.BoardCommentDTO;

public interface BoardCommentDAO {
	public void commetInsert(String c_m_id,String comment, int c_b_no);
	public List<BoardCommentDTO> commentList();
}
