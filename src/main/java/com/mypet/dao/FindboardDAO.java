package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

public interface FindboardDAO {

	
	// board start
	public FindboardDTO getfindBoard(int num);
	
	public void insert_findboard(FindboardDTO findboardDTO);
	
	public Integer getMaxNum();
	
//	public FindboardDTO bringfindBoard(int num);
	
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO);
	
	public int getfindBoardCount();
	
}

