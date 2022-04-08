package com.mypet.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.mypet.dao.GbuyBoardDAO;
import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;

@Repository


@Service
public class GbuyBoardServiceImpl implements GbuyBoardService {

	@Inject
	private GbuyBoardDAO boardDAO;
	
	@Override
	public List<GbuyBoardDTO> getBoardList(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		pageDTO.setStartRow(startRow-1);
		return boardDAO.getGbuyBoardList(pageDTO);
	}
	@Override
	public int getBoardCount() {
		return boardDAO.getGbuy_BoardCount();
	}
	@Override
	public GbuyBoardDTO getBoard(int gbuy_num) {
		return boardDAO.getGbuy_Board(gbuy_num);
	}
	@Override
	public void updateReadcount(int num) {
		boardDAO.updateGbuy_Readcount(num);
	}
	@Override
	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO) {
		boardDAO.updateGbuy_Board(gbuyBoardDTO);
	}
	
	@Override
	public void deleteGbuy_Board(int gbuy_num) {
		boardDAO.deleteGbuy_Board(gbuy_num);
	}
	
	@Override
	public void writeBoard(GbuyBoardDTO boardDTO) {
		// name,subject,content 폼에서 입력해서 옴
		//num,pass,readcount,date
		boardDTO.setGbuy_pass("1111");
		boardDTO.setGbuy_readcount(0);
		boardDTO.setGbuy_date(new Timestamp(System.currentTimeMillis()));
		
		// 글번호 :  디비에 저장된 최대번호 구해서 +1 
		if(boardDAO.getGbuy_MaxNum()!=null) {
			// 글이 있는 경우 
			boardDTO.setGbuy_num(boardDAO.getGbuy_MaxNum()+1);
		}else {
			// 글이 없는 경우 
			boardDTO.setGbuy_num(1);
		}
		boardDAO.Gbuy_writeBoard(boardDTO);
	}



}
