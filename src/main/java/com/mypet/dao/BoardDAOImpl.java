package com.mypet.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.PageDTO;
import com.mypet.domain.ReplyDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.freeboardMapper";
//write start
	@Override
	public void write_freeBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writefreeBoard", boardDTO);
		
	}
	
	@Override
	public void write_noticeBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writenoticeBoard", boardDTO);
		
	}
	
	@Override
	public void write_reviewBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writereviewBoard", boardDTO);
		
	}
//write end
	
//MaxNum start	
	@Override
	public Integer getfreeMaxNum() {
		return sqlSession.selectOne(namespace+".getfreeMaxNum");
	}
	@Override
	public Integer getnoticeMaxNum() {
		return sqlSession.selectOne(namespace+".getnoticeMaxNum");
	}
	@Override
	public Integer getreviewMaxNum() {
		return sqlSession.selectOne(namespace+".getreviewMaxNum");
	}
//MaxNum end	

//List start
	@Override
	public List<BoardDTO> getfreeBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getfreeBoardList", pageDTO);
	}
	@Override
	public List<BoardDTO> getnoticeBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getnoticeBoardList", pageDTO);
	}
	@Override
	public List<BoardDTO> getreviewBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getreviewBoardList", pageDTO);
	}
//List end

//BoardCount start	
	@Override
	public int getfreeBoardCount() {
		return sqlSession.selectOne(namespace+".getfreeBoardCount");
	}
	
	@Override
	public int getnoticeBoardCount() {
		return sqlSession.selectOne(namespace+".getnoticeBoardCount");
	}
	
	@Override
	public int getreviewBoardCount() {
		return sqlSession.selectOne(namespace+".getreviewBoardCount");
	}
//BoardCount end
	
//board start	
	@Override
	public BoardDTO getfreeBoard(int num) {
		return sqlSession.selectOne(namespace+".getfreeBoard", num);
	}
	
	@Override
	public BoardDTO getnoticeBoard(int num) {
		return sqlSession.selectOne(namespace+".getnoticeBoard", num);
	}
	
	@Override
	public BoardDTO getreviewBoard(int num) {
		return sqlSession.selectOne(namespace+".getreviewBoard", num);
	}
//board end
	
//readcount start	
	@Override
	public void updatefreeReadcount(int num) {
		sqlSession.update(namespace+".updatefreeReadcount", num);
	}
	
	@Override
	public void updatenoticeReadcount(int num) {
		sqlSession.update(namespace+".updatenoticeReadcount", num);
	}
	
	@Override
	public void updatereviewReadcount(int num) {
		sqlSession.update(namespace+".updatereviewReadcount", num);
	}
//readcount end
	
//update start	
	@Override
	public void updatefreeBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updatefreeBoard", boardDTO);
	}
	
	@Override
	public void updatenoticeBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updatenoticeBoard", boardDTO);
	}
	
	@Override
	public void updatereviewBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updatereviewBoard", boardDTO);
	}
//update end
	
//delete start	
	@Override
	public void deletefreeBoard(int num) {
		sqlSession.delete(namespace+".deletefreeBoard", num);
	}
	
	@Override
	public void deletenoticeBoard(int num) {
		sqlSession.delete(namespace+".deletenoticeBoard", num);
	}
	
	@Override
	public void deletereviewBoard(int num) {
		sqlSession.delete(namespace+".deletereviewBoard", num);
	}
//delete end

	@Override
	public List<BoardDTO> freeListsearch(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+".freeListsearch", pageDTO);
	}

	@Override
	public int getfreeBoardCountSearch(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getfreeBoardCountSearch", pageDTO);
	}
	@Override
	public List<BoardDTO> noticeListsearch(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+".noticeListsearch", pageDTO);
	}

	@Override
	public int getnoticeBoardCountSearch(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getnoticeBoardCountSearch", pageDTO);
	}
	@Override
	public List<BoardDTO> reviewListsearch(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+".reviewListsearch", pageDTO);
	}

	@Override
	public int getreviewBoardCountSearch(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getreviewBoardCountSearch", pageDTO);
	}

	
	

    

	@Override
	public List<BoardDTO> bestfree(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".bestfree", pageDTO);
	}

	@Override
	public List<BoardDTO> bestnotice(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".bestnotice", pageDTO);
	}
	
	@Override
	public List<BoardDTO> bestreview(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".bestreview", pageDTO);
	}

	@Override
	public BoardDTO LikeCheck(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace+".freeLikeCheck", boardDTO);
		
		
	}

//	@Override
//	public void insert_freeboard_file(FileDTO fileDTO) {
//		sqlSession.insert(namespace+".insert_freeboard_file", fileDTO);
//	}
	@Override
	public Integer getFileMaxNum() {
		return sqlSession.selectOne(namespace+".getFileMaxNum");
	}
//like
	@Override
	public int getfreeLike(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".getfreeLike", boardDTO);
	}
	
	@Override
	public int getnoticeLike(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".getnoticeLike", boardDTO);
	}
	
	@Override
	public int getreviewLike(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".getreviewLike", boardDTO);
	}
	
	@Override
	public List<ReplyDTO> getfreecommentList(int bnum){
		return sqlSession.selectList(namespace+".getfreecommentList", bnum);
	}
	
	@Override
	public void freecommentIn(ReplyDTO replyDTO) {
		sqlSession.insert(namespace+".freecommentIn", replyDTO);
	}
	
	@Override
	public Integer getfcommentMaxNum() {
		return sqlSession.selectOne(namespace+".getfcommentMaxNum");
	}
	
	@Override
	public String getfreecommentCount(int bnum) {
		return sqlSession.selectOne(namespace+".getfreecommentCount", bnum);
	}
	
	
	
	

	


	
	
	


	
	
	
	
}//
