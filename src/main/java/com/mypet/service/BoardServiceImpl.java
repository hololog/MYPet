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
	public List<BoardDTO> getfreeBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getfreeBoardList(pageDTO);
	}

	@Override
	public int getfreeBoardCount() {
		return boardDAO.getfreeBoardCount();
	}

	@Override
	public BoardDTO getfreeBoard(int num) {
		return boardDAO.getfreeBoard(num);
	}

	@Override
	public void updatefreeReadcount(int num) {
		boardDAO.updatefreeReadcount(num);
	}

	@Override
	public void updatefreeBoard(BoardDTO boardDTO) {
		boardDAO.updatefreeBoard(boardDTO);
	}

	@Override
	public void deletefreeBoard(int num) {
		boardDAO.deletefreeBoard(num);
	}

	@Override
	public void insert_findboard(BoardDTO boardDTO) {
		boardDAO.insert_findboard(boardDTO);
	}

	
	
	

	

}
