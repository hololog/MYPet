package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;

public interface FindboardDAO {

	
	// board start
	public FindboardDTO getfindBoard(int num);
	
	public void insert_findboard(FindboardDTO findboardDTO);
	
	public Integer getMaxNum();
	
	public List<String> getProvinceList();
	
//	public List<String> getcityname(String province);
	
}

