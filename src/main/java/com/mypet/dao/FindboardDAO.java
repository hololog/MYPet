package com.mypet.dao;

import java.util.List;

import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

public interface FindboardDAO {

	
	// board start
	public FindboardDTO getfindBoard(int num);
	
	public void insert_findboard(FindboardDTO findboardDTO);
	
	public Integer getMaxNum();
	

//	public FindboardDTO bringfindBoard(int num);
	
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO);
	
	public List<FindboardDTO> getfindMissBoardList(PageDTO pageDTO);
	
	public int getfindBoardCount();
	
	public int getfindMissBoardCount();

	public List<String> getProvinceList();

	public List<String> getCityList(String province);
	
	public List<String> getTownList(AddressDTO addressDTO);

	public void insert_findboard_file(FileDTO fileDTO);
}

