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

//write start	
	@Override
	public void write_freeBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		if(boardDAO.getfreeMaxNum()!=null) {
	        int num=boardDAO.getfreeMaxNum()+1;
	        boardDTO.setFree_board_num(num+"");
	      }else {
	        boardDTO.setFree_board_num(1+"");
	      }
		boardDAO.write_freeBoard(boardDTO);
	}
	
	@Override
	public void write_noticeBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		if(boardDAO.getfreeMaxNum()!=null) {
	        int num=boardDAO.getfreeMaxNum()+1;
	        boardDTO.setFree_board_num(num+"");
	      }else {
	        boardDTO.setFree_board_num(1+"");
	      }
		boardDAO.write_noticeBoard(boardDTO);
	}
	
	@Override
	public void write_reviewBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		if(boardDAO.getfreeMaxNum()!=null) {
	        int num=boardDAO.getfreeMaxNum()+1;
	        boardDTO.setFree_board_num(num+"");
	      }else {
	        boardDTO.setFree_board_num(1+"");
	      }
		boardDAO.write_reviewBoard(boardDTO);
	}
//write end
	
//List start	
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
	public List<BoardDTO> getnoticeBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getnoticeBoardList(pageDTO);
	}
	@Override
	public List<BoardDTO> getreviewBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getreviewBoardList(pageDTO);
	}
//List end
	
//count start	
	@Override
	public int getfreeBoardCount() {
		return boardDAO.getfreeBoardCount();
	}
	@Override
	public int getnoticeBoardCount() {
		return boardDAO.getnoticeBoardCount();
	}
	@Override
	public int getreviewBoardCount() {
		return boardDAO.getreviewBoardCount();
	}
//count end
	
//board start	
	@Override
	public BoardDTO getfreeBoard(int num) {
		return boardDAO.getfreeBoard(num);
	}
	
	@Override
	public BoardDTO getnoticeBoard(int num) {
		return boardDAO.getnoticeBoard(num);
	}
	
	@Override
	public BoardDTO getreviewBoard(int num) {
		return boardDAO.getreviewBoard(num);
	}
//board end
	
//readcount start	
	@Override
	public void updatefreeReadcount(int num) {
		boardDAO.updatefreeReadcount(num);
	}
	
	@Override
	public void updatenoticeReadcount(int num) {
		boardDAO.updatenoticeReadcount(num);
	}
	
	@Override
	public void updatereviewReadcount(int num) {
		boardDAO.updatereviewReadcount(num);
	}
//readcount end
	
//update start	
	@Override
	public void updatefreeBoard(BoardDTO boardDTO) {
		boardDAO.updatefreeBoard(boardDTO);
	}
	@Override
	public void updatenoticeBoard(BoardDTO boardDTO) {
		boardDAO.updatenoticeBoard(boardDTO);
	}
	@Override
	public void updatereviewBoard(BoardDTO boardDTO) {
		boardDAO.updatereviewBoard(boardDTO);
	}
//update end
	
//delete start	
	@Override
	public void deletefreeBoard(int num) {
		boardDAO.deletefreeBoard(num);
	}
	@Override
	public void deletenoticeBoard(int num) {
		boardDAO.deletenoticeBoard(num);
	}
	@Override
	public void deletereviewBoard(int num) {
		boardDAO.deletefreeBoard(num);
	}
//delete end
	
	@Override
	public void insert_findboard(BoardDTO boardDTO) {
		boardDAO.insert_findboard(boardDTO);
	}

	
	
	

	

}
