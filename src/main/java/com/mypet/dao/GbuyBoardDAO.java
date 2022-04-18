package com.mypet.dao;

import java.util.List;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;


public interface GbuyBoardDAO {
	//상품
	public Integer getGbuy_MaxNum();
	//결제
	public Integer getPay_MaxNum(); 
	//상품
	public List<GbuyBoardDTO> getGbuyBoardList(PageDTO pageDTO);
	//결제
	public List<GbuyBoardDTO> getPayBoardList(PageDTO pageDTO);
	//상품
	public GbuyBoardDTO getGbuy_Board(int gbuy_num);
	//결제
	public GbuyBoardDTO getPay_Board(int gbuy_num);
	//상품
	public void Gbuy_writeBoard(GbuyBoardDTO gbuyBoardDTO);
	//결제
	public void Pay_writeBoard(GbuyBoardDTO gbuyBoardDTO);
	
	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO);
	
	public void updateGbuy_Board2(GbuyBoardDTO gbuyBoardDTO);

	public void deleteGbuy_Board(int gbuy_num);	

	public void updateGbuy_Readcount(int gbuy_num);

	public int getGbuy_BoardCount();
}
