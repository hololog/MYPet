package com.mypet.dao;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;


public interface GbuyBoardDAO {

	public Integer getGbuy_MaxNum();
	
	public List<GbuyBoardDTO> getGbuyBoardList(PageDTO pageDTO);

	public GbuyBoardDTO getGbuy_Board(int gbuy_num);

	public GbuyBoardDTO getGbuy_Board1(int gbuy_num);

	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO);

	public void deleteGbuy_Board(int gbuy_num);	

	public void updateGbuy_Readcount(int gbuy_num);

	public void Gbuy_writeBoard(GbuyBoardDTO gbuyBoardDTO);
	
	public int getGbuy_BoardCount();
}
