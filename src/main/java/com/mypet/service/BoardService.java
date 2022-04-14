package com.mypet.service;

import java.util.List;

import org.springframework.ui.Model;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
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
		
	//search start	
		public List<BoardDTO> freeListsearch(PageDTO pageDTO);
		
		public int getfreeBoardCountSearch(PageDTO pageDTO);
		
		public List<BoardDTO> noticeListsearch(PageDTO pageDTO);
		
		public int getnoticeBoardCountSearch(PageDTO pageDTO);
		
		public List<BoardDTO> reviewListsearch(PageDTO pageDTO);
		
		public int getreviewBoardCountSearch(PageDTO pageDTO);
	//search end	
		
		//best start
		public List<BoardDTO> bestfree(PageDTO pageDTO);
		
		public List<BoardDTO> bestnotice(PageDTO pageDTO);
		
		public List<BoardDTO> bestreview(PageDTO pageDTO);
	//like start	
		public BoardDTO LikeCheck(BoardDTO boardDTO);
		
	//file start
		public void insert_freeboard_file(FileDTO fileDTO);
	//file end
		
		
}
