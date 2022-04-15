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
	

}
