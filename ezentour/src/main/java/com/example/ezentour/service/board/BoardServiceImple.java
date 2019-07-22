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
	public BoardDTO viewBoard(int b_no) {
		return bDao.viewBoard(b_no);
	}

	@Override
	public void deleteBoard(int b_no) {
		bDao.deleteBoard(b_no);
	}

	@Override
	public void updateBoard(BoardDTO bDto) {
		bDao.updateBoard(bDto);
	}

	@Override
	public boolean checkId(String b_m_id) {
		return bDao.checkId(b_m_id);
	}

}
