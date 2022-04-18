package com.mypet.service;


import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

public interface FindboardService {

	//Board start	
	public FindboardDTO getfindBoard(int num);
	
//	public FindboardDTO bringfindBoard(int num);
	
	public int getfindBoardCount();
	
	public int getfindMissBoardCount();

	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO);
	
	public List<FileDTO> getfindFileList(PageDTO pageDTO);
	
	public List<FindboardDTO> getfindMissBoardList(PageDTO pageDTO);
	
	public void insert_findboard(FindboardDTO findboardDTO);
	
	public List<String> getProvinceList();

	public List<String> getCityList(String province);

	public List<String> getTownList(AddressDTO addressDTO);

	public void insert_findboard_file(FileDTO fileDTO);

	public List<FindboardDTO> getfindBoardListMain();

	public BookmarkDTO getBookmark(String findboardNum);

	public List<FindboardDTO> getfindBoardListMain(String email);

	public List<FindboardDTO> getFindSearchList(PageDTO pageDTO);

	public int getFindBoardCount();
	
	public void updatefindBoard (FindboardDTO findboardDTO);
	
	public void update_findboard_file(FileDTO fileDTO);
}
