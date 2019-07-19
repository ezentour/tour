package com.example.ezentour.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ezentour.model.board.dao.BoardDAO;
import com.example.ezentour.model.board.dto.BoardDTO;

@Service
public class BoardServiceImple implements BoardService {
	private static final Logger LOG = LoggerFactory.getLogger(BoardServiceImple.class);
	@Inject
	BoardDAO bDao;
	
	@Override
	public List<BoardDTO> boardSearch(String search){
		return bDao.boardSearch(search);
	}
	@Override
	public List<BoardDTO> boardList(int curPage) {
		int startPage = 0;
		int endPage = 0;
		
		startPage = 5*curPage-4;
		endPage = 5*curPage;
		
		return bDao.boardList(startPage,endPage);
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
	@Override
	public int boardCount() {
		int listAmount = bDao.boardCount();
		int totalPage=1;
		if(listAmount%5==0) { // 한 페이지당 5개
			totalPage = listAmount/5;
		} else {
			totalPage = (listAmount/5)+1;
		}
		LOG.info("totalPage(CartServiceImpl) : " + totalPage); 
		return totalPage;
	}
}
