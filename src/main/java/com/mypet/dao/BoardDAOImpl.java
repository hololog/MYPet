package com.mypet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.PageDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.boardMapper";

	@Override
	public void write_freeBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writefreeBoard", boardDTO);
		
	}
	@Override
	public Integer getfreeMaxNum() {
		return sqlSession.selectOne(namespace+".getfreeMaxNum");
	}

	@Override
	public List<BoardDTO> getfreeBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getfreeBoardList", pageDTO);
	}

	@Override
	public int getfreeBoardCount() {
		return sqlSession.selectOne(namespace+".getfreeBoardCount");
	}

	@Override
	public BoardDTO getfreeBoard(int num) {
		return sqlSession.selectOne(namespace+".getfreeBoard", num);
	}

	@Override
	public void updatefreeReadcount(int num) {
		sqlSession.update(namespace+".updatefreeReadcount", num);
	}

	@Override
	public void updatefreeBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updatefreeBoard", boardDTO);
	}

	@Override
	public void deletefreeBoard(int num) {
		sqlSession.delete(namespace+".deletefreeBoard", num);
	}

	@Override
	public void insert_findboard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".insert_findboard");
	}
	
	
	
}//
