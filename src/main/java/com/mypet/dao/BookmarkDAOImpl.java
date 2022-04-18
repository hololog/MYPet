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
	
	//free
	
	@Override
	public void FaddBookmarkCount(int free_board_num) {
		sqlSession.update(namespace + ".FaddBookmarkCount", free_board_num);
	}

	@Override
	public void FaddBookmark(BookmarkDTO bookmarkDTO) {
		sqlSession.insert(namespace + ".FaddBookmark", bookmarkDTO);
	}

	@Override
	public void FremoveBookmarkCount(int free_board_num) {
		sqlSession.update(namespace + ".FremoveBookmarkCount", free_board_num);
	}
		
	@Override
	public void FremoveBookmark(BookmarkDTO bookmarkDTO) {
		sqlSession.delete(namespace + ".FremoveBookmark", bookmarkDTO);
	}

	@Override
	public int FgetBookmarkNum(int free_board_num) {
		return sqlSession.selectOne(namespace + ".FgetBookmarkNum", free_board_num);
	}

}
