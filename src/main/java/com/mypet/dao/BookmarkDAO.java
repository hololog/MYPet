package com.mypet.dao;

import com.mypet.domain.BookmarkDTO;

public interface BookmarkDAO {

	public void addBookmarkCount(int findboardNum);

	public void addBookmark(BookmarkDTO bookmarkDTO);

	public void removeBookmarkCount(int findboardNum);

	public void removeBookmark(BookmarkDTO bookmarkDTO);

	public int getBookmarkNum(int findboardNum);

	//free
		public void FaddBookmarkCount(int free_board_num);

		public void FaddBookmark(BookmarkDTO bookmarkDTO);

		public void FremoveBookmarkCount(int free_board_num);

		public void FremoveBookmark(BookmarkDTO bookmarkDTO);

		public int FgetBookmarkNum(int free_board_num);

		//notice
		public void RaddBookmarkCount(int tip_board_num);

		public void RaddBookmark(BookmarkDTO bookmarkDTO);

		public void RremoveBookmarkCount(int tip_board_num);

		public void RremoveBookmark(BookmarkDTO bookmarkDTO);

		public int RgetBookmarkNum(int tip_board_num);		
		
		
		//notice
		public void NaddBookmarkCount(int notice_num);

		public void NaddBookmark(BookmarkDTO bookmarkDTO);

		public void NremoveBookmarkCount(int notice_num);

		public void NremoveBookmark(BookmarkDTO bookmarkDTO);

		public int NgetBookmarkNum(int notice_num);				
}
