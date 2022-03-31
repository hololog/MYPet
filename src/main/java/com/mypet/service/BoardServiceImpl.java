package com.mypet.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.BoardDAO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.PageDTO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	@Override
	public void write_freeBoard(BoardDTO boardDTO) {
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		boardDAO.write_freeBoard(boardDTO);
	}
	
	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}

	@Override
	public BoardDTO getBoard(int num) {
		return boardDAO.getBoard(num);
	}

	@Override
	public void updateReadcount(int num) {
		boardDAO.updateReadcount(num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		boardDAO.deleteBoard(num);
	}

	

}
