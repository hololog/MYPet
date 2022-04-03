package com.mypet.service;


import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;

public interface FindboardService {

	//Board start	
	public FindboardDTO getfindBoard(int num);
	
	public void insert_findboard(FindboardDTO findboardDTO);
}
