package com.mypet.service;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;

public interface BoardService {
	
	public void write_freeBoard(BoardDTO boardDTO);
	
	public List<BoardDTO> getfreeBoardList(PageDTO pageDTO);
	
	public int getfreeBoardCount();
	
	public BoardDTO getfreeBoard(int num);
	
	public void updatefreeReadcount(int num);
	
	public void updatefreeBoard(BoardDTO boardDTO);
	
	public void deletefreeBoard(int num);
	
	public void insert_findboard(BoardDTO boardDTO);
}
