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
	public void updateBookmark(BookmarkDTO bookmarkDTO) {
		sqlSession.update(namespace + ".updateBookmark", bookmarkDTO);
		sqlSession.insert(namespace + ".insertBookmark", bookmarkDTO); 
	}

}
