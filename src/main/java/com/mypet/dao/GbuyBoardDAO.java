package com.mypet.dao;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;


public interface GbuyBoardDAO {

	public void writeBoard1(GbuyBoardDTO boardDTO);

	public Integer getMaxNum();
	
	public int getBoardCount();
	
	public void updateReadcount(int num);
	
	public void deleteBoard(int num);

	public List<GbuyBoardDTO> getBoardList(PageDTO pageDTO);

	public GbuyBoardDTO getBoard(int num);

	public void updateBoard(GbuyBoardDTO boardDTO);


}
