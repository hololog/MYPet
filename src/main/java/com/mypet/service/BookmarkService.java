package com.mypet.service;

import com.mypet.domain.BookmarkDTO;

public interface BookmarkService {

	public void addBookmarkCount(int findboardNum);

	public void addBookmark(BookmarkDTO bookmarkDTO);

	public void removeBookmarkCount(int findboardNum);

	public void removeBookmark(BookmarkDTO bookmarkDTO);

	public int getBookmarkNum(int findboardNum);

}
