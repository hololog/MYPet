package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.PageDTO;


public interface BoardDAO {

	public void write_freeBoard(BoardDTO boardDTO);

	public Integer getMaxNum();
	
	public List<BoardDTO> getBoardList(PageDTO pageDTO);
	
	public int getBoardCount();
	
	public BoardDTO getBoard(int num);
	
	public void updateReadcount(int num);
	
	public void updateBoard(BoardDTO boardDTO);
	
	public void deleteBoard(int num);
	
	public void insert_findboard(BoardDTO boardDTO);
	
}
