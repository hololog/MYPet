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
	
	//review
	
		@Override
		public void RaddBookmarkCount(int tip_board_num) {
			sqlSession.update(namespace + ".RaddBookmarkCount", tip_board_num);
		}

		@Override
		public void RaddBookmark(BookmarkDTO bookmarkDTO) {
			sqlSession.insert(namespace + ".RaddBookmark", bookmarkDTO);
		}

		@Override
		public void RremoveBookmarkCount(int tip_board_num) {
			sqlSession.update(namespace + ".RremoveBookmarkCount", tip_board_num);
		}
			
		@Override
		public void RremoveBookmark(BookmarkDTO bookmarkDTO) {
			sqlSession.delete(namespace + ".RremoveBookmark", bookmarkDTO);
		}

		@Override
		public int RgetBookmarkNum(int tip_board_num) {
			return sqlSession.selectOne(namespace + ".RgetBookmarkNum", tip_board_num);
		}	
		
		//review
		
			@Override
			public void NaddBookmarkCount(int notice_num) {
				sqlSession.update(namespace + ".NaddBookmarkCount", notice_num);
			}

			@Override
			public void NaddBookmark(BookmarkDTO bookmarkDTO) {
				sqlSession.insert(namespace + ".NaddBookmark", bookmarkDTO);
			}

			@Override
			public void NremoveBookmarkCount(int notice_num) {
				sqlSession.update(namespace + ".NremoveBookmarkCount", notice_num);
			}
				
			@Override
			public void NremoveBookmark(BookmarkDTO bookmarkDTO) {
				sqlSession.delete(namespace + ".NremoveBookmark", bookmarkDTO);
			}

			@Override
			public int NgetBookmarkNum(int notice_num) {
				return sqlSession.selectOne(namespace + ".NgetBookmarkNum", notice_num);
			}		

}
