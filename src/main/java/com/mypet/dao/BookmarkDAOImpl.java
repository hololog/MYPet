package com.mypet.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.BookmarkDTO;


@Repository
public class BookmarkDAOImpl implements BookmarkDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.bookmarkMapper";
	
	@Override
	public void addBookmarkCount(int findboardNum) {
		sqlSession.update(namespace + ".addBookmarkCount", findboardNum);
	}

	@Override
	public void addBookmark(BookmarkDTO bookmarkDTO) {
		sqlSession.insert(namespace + ".addBookmark", bookmarkDTO);
	}

	@Override
	public void removeBookmarkCount(int findboardNum) {
		sqlSession.update(namespace + ".removeBookmarkCount", findboardNum);
	}
		
	@Override
	public void removeBookmark(BookmarkDTO bookmarkDTO) {
		sqlSession.delete(namespace + ".removeBookmark", bookmarkDTO);
	}

	@Override
	public int getBookmarkNum(int findboardNum) {
		return sqlSession.selectOne(namespace + ".getBookmarkNum", findboardNum);
	}

}
