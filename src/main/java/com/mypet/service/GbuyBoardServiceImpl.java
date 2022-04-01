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
	public List<GbuyBoardDTO> getBoardList1(PageDTO pageDTO) {
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
	public GbuyBoardDTO getBoard(int num) {
		return boardDAO.getBoard(num);
	}
	@Override
	public void updateReadcount(int num) {
		boardDAO.updateReadcount(num);
	}
	@Override
	public void updateBoard(GbuyBoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}
	@Override
	public void deleteBoard(int num) {
		boardDAO.deleteBoard(num);
	}
	@Override
	public void writeBoard(GbuyBoardDTO boardDTO) {
		// name,subject,content 폼에서 입력해서 옴
		//num,pass,readcount,date
		boardDTO.setPass("1111");
		boardDTO.setRedcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// 글번호 :  디비에 저장된 최대번호 구해서 +1 
		if(boardDAO.getMaxNum()!=null) {
			// 글이 있는 경우 
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}else {
			// 글이 없는 경우 
			boardDTO.setNum(1);
		}
		
		
		boardDAO.writeBoard1(boardDTO);
		
	}
	@Override
	public GbuyBoardDTO getBoard1(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateBoard1(GbuyBoardDTO boardDTO) {
		// TODO Auto-generated method stub
		
	}
}
