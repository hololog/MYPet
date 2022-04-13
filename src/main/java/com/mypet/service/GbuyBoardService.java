package com.mypet.service;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;

public interface GbuyBoardService {
	
	public void writeBoard(GbuyBoardDTO boardDTO);
	
	public List<GbuyBoardDTO> getBoardList1(PageDTO pageDTO);
	
	public int getBoardCount();
	
	public GbuyBoardDTO getBoard1(int gbuy_num);
	
	public void updateReadcount(int num);
	
	public void updateBoard1(GbuyBoardDTO boardDTO);
	
	public void deleteBoard(int num);

	public GbuyBoardDTO getBoard(int num);

	public void updateBoard(GbuyBoardDTO boardDTO);
	
}
