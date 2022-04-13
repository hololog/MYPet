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
	public void updateBookmark(BookmarkDTO bookmarkDTO) {
		bookmarkDAO.updateBookmark(bookmarkDTO);
	}

}
