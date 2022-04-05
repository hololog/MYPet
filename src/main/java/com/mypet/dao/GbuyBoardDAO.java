package com.mypet.dao;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;


public interface GbuyBoardDAO {

	public void Gbuy_writeBoard(GbuyBoardDTO gbuyBoardDTO);

	public Integer getGbuy_MaxNum();
	
	public int getGbuy_BoardCount();
	
	public void updateGbuy_Readcount(int num);
	
	public void deleteGbuy_Board(int num);

	public List<GbuyBoardDTO> getGbuyBoardList(PageDTO pageDTO);

	public GbuyBoardDTO getGbuy_Board(int num);

	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO);


}
