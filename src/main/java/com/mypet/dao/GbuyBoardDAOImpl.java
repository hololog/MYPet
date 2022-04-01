package com.mypet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;


@Repository
public class GbuyBoardDAOImpl implements GbuyBoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.boardMapper";

	@Override
	public void writeBoard1(GbuyBoardDTO boardDTO) {
		sqlSession.insert(namespace+".writeBoard", boardDTO);
		
	}
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<GbuyBoardDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(namespace+".getBoardCount");
	}

	@Override
	public GbuyBoardDTO getBoard(int num) {
		return sqlSession.selectOne(namespace+".getBoard", num);
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace+".updateReadcount", num);
	}

	@Override
	public void updateBoard(GbuyBoardDTO boardDTO) {
		sqlSession.update(namespace+".updateBoard", boardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		sqlSession.delete(namespace+".deleteBoard", num);
	}

}//
