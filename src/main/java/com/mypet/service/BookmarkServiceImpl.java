package com.mypet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.dao.BookmarkDAO;
import com.mypet.domain.BookmarkDTO;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	
	@Autowired
	private BookmarkDAO bookmarkDAO;

	@Override
	public void addBookmarkCount(int findboardNum) {
		bookmarkDAO.addBookmarkCount(findboardNum);
	}

	@Override
	public void addBookmark(BookmarkDTO bookmarkDTO) {
		bookmarkDAO.addBookmark(bookmarkDTO);
	}

	@Override
	public void removeBookmarkCount(int findboardNum) {
		bookmarkDAO.removeBookmarkCount(findboardNum);
		
	}

	@Override
	public void removeBookmark(BookmarkDTO bookmarkDTO) {
		bookmarkDAO.removeBookmark(bookmarkDTO);
		
	}

	@Override
	public int getBookmarkNum(int findboardNum) {
		return bookmarkDAO.getBookmarkNum(findboardNum);
	}
	
	//free
	
	@Override
	public void FaddBookmarkCount(int free_board_num) {
		bookmarkDAO.FaddBookmarkCount(free_board_num);
	}

	@Override
	public void FaddBookmark(BookmarkDTO bookmarkDTO) {
		bookmarkDAO.FaddBookmark(bookmarkDTO);
	}

	@Override
	public void FremoveBookmarkCount(int free_board_num) {
		bookmarkDAO.FremoveBookmarkCount(free_board_num);
		
	}

	@Override
	public void FremoveBookmark(BookmarkDTO bookmarkDTO) {
		bookmarkDAO.FremoveBookmark(bookmarkDTO);
		
	}

	@Override
	public int FgetBookmarkNum(int free_board_num) {
		return bookmarkDAO.FgetBookmarkNum(free_board_num);
	}
	
	//review
	
		@Override
		public void RaddBookmarkCount(int tip_board_num) {
			bookmarkDAO.RaddBookmarkCount(tip_board_num);
		}

		@Override
		public void RaddBookmark(BookmarkDTO bookmarkDTO) {
			bookmarkDAO.RaddBookmark(bookmarkDTO);
		}

		@Override
		public void RremoveBookmarkCount(int tip_board_num) {
			bookmarkDAO.RremoveBookmarkCount(tip_board_num);
			
		}

		@Override
		public void RremoveBookmark(BookmarkDTO bookmarkDTO) {
			bookmarkDAO.RremoveBookmark(bookmarkDTO);
			
		}

		@Override
		public int RgetBookmarkNum(int tip_board_num) {
			return bookmarkDAO.RgetBookmarkNum(tip_board_num);
		}
		
		//notice
		
			@Override
			public void NaddBookmarkCount(int notice_num) {
				bookmarkDAO.NaddBookmarkCount(notice_num);
			}

			@Override
			public void NaddBookmark(BookmarkDTO bookmarkDTO) {
				bookmarkDAO.NaddBookmark(bookmarkDTO);
			}

			@Override
			public void NremoveBookmarkCount(int notice_num) {
				bookmarkDAO.NremoveBookmarkCount(notice_num);
				
			}

			@Override
			public void NremoveBookmark(BookmarkDTO bookmarkDTO) {
				bookmarkDAO.NremoveBookmark(bookmarkDTO);
				
			}

			@Override
			public int NgetBookmarkNum(int notice_num) {
				return bookmarkDAO.NgetBookmarkNum(notice_num);
			}
	

}
