package com.example.ezentour.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ezentour.model.board.dao.BoardDAO;
import com.example.ezentour.model.board.dto.BoardDTO;

@Service
public class BoardServiceImple implements BoardService {

	@Inject
	BoardDAO bDao;
	
	@Override
	public List<BoardDTO> boardList() {
		return bDao.boardList();
	}

	@Override
	public void insertBoard(BoardDTO bDto) {
		bDao.insertBoard(bDto);
	}

	@Override
	public BoardDTO viewBoard(String b_no) {
		return bDao.viewBoard(b_no);
	}

	@Override
	public void deleteBoard(String b_m_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBoard(BoardDTO bDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean checkPw(String b_m_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
