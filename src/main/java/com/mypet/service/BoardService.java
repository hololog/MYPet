package com.mypet.service;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.PageDTO;

public interface BoardService {

//write start	
	public void write_freeBoard(BoardDTO boardDTO);
	
	public void write_noticeBoard(BoardDTO boardDTO);
	
	public void write_reviewBoard(BoardDTO boardDTO);
//write end
	
	
	//List start	
		public List<BoardDTO> getfreeBoardList(PageDTO pageDTO);
		
		public List<BoardDTO> getnoticeBoardList(PageDTO pageDTO);
		
		public List<BoardDTO> getreviewBoardList(PageDTO pageDTO);
	//List end
		
	//Count start	
		public int getfreeBoardCount();
		
		public int getnoticeBoardCount();
		
		public int getreviewBoardCount();
	//Count end	
		
	//Board start	
		public BoardDTO getfreeBoard(int num);
		
		public BoardDTO getnoticeBoard(int num);
		
		public BoardDTO getreviewBoard(int num);
	//Board end	
		
	//ReadCount start	
		public void updatefreeReadcount(int num);
		
		public void updatenoticeReadcount(int num);
		
		public void updatereviewReadcount(int num);
	//ReadCount end	
		
	//Update start	
		public void updatefreeBoard(BoardDTO boardDTO);
		
		public void updatenoticeBoard(BoardDTO boardDTO);
		
		public void updatereviewBoard(BoardDTO boardDTO);
	//Update end	
		
	//Delete start	
		public void deletefreeBoard(int num);
		
		public void deletenoticeBoard(int num);
		
		public void deletereviewBoard(int num);
	//Delete end
		public int searchCount(String searchType, String keyword) throws Exception;
	

}
