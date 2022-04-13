package com.mypet.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

public interface FindboardDAO {

	
	// board start
	public FindboardDTO getfindBoard(int num);
	
	public void insert_findboard(FindboardDTO findboardDTO);

	public void insert_findboard_files(FileDTO fileDTO);
	
	public Integer getMaxNum();
	
	public Integer getFileMaxNum();
	
//	public FindboardDTO bringfindBoard(int num);
	
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO);
	
	public List<FindboardDTO> getfindMissBoardList(PageDTO pageDTO);
	
	public int getfindBoardCount();
	
	public int getfindMissBoardCount();

	public List<String> getProvinceList();

	public List<String> getCityList(String province);
	
	public List<String> getTownList(AddressDTO addressDTO);

	public void insert_findboard_file(FileDTO fileDTO);

	public List<FindboardDTO> getfindBoardListMain();
}

