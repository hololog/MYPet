package com.mypet.service;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;

public interface GbuyBoardService {
	//main
	public void writeBoard(GbuyBoardDTO gbuyBoardDTO);
	//pay
	public void Pay_writeBoard(GbuyBoardDTO boardDTO);
	//main
	public List<GbuyBoardDTO> getBoardList(PageDTO pageDTO);
	//pay
	public List<GbuyBoardDTO> getPayList(PageDTO pageDTO);
	
	public int getBoardCount();
	
	public void updateReadcount(int gbuy_num);
	
	public void deleteGbuy_Board(int gbuy_num);

	public GbuyBoardDTO getBoard(int gbuy_num);

	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO);
	
	public void updateGbuy_Board2(GbuyBoardDTO gbuyBoardDTO);
	
}
