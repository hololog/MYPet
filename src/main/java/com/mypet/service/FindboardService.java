package com.mypet.service;


import java.util.List;


import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

public interface FindboardService {

	//Board start	
	public FindboardDTO getfindBoard(int num);
	
//	public FindboardDTO bringfindBoard(int num);
	
	public int getfindBoardCount();

	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO);
	
	public void insert_findboard(FindboardDTO findboardDTO);
	
	public List<String> getProvinceList();
	
//	public List<String> getcityname(String province);
}
