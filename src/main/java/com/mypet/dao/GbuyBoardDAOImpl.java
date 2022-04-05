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
	
	private static final String namespace="com.mypet.mappers.GbuyboardMapper";

	@Override
	public void Gbuy_writeBoard(GbuyBoardDTO gbuyBoardDTO) {
		sqlSession.insert(namespace+".Gbuy_writeBoard", gbuyBoardDTO);
		
	}
	@Override
	public Integer getGbuy_MaxNum() {
		return sqlSession.selectOne(namespace+".getGbuy_MaxNum");
	}

	@Override
	public List<GbuyBoardDTO> getGbuyBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getGbuyBoardList", pageDTO);
	}

	@Override
	public int getGbuy_BoardCount() {
		return sqlSession.selectOne(namespace+".getGbuy_BoardCount");
	}

	@Override
	public GbuyBoardDTO getGbuy_Board(int num) {
		return sqlSession.selectOne(namespace+".getBoard", num);
	}

	@Override
	public void updateGbuy_Readcount(int num) {
		sqlSession.update(namespace+".updateGbuy_Readcount", num);
	}

	@Override
	public void updateGbuy_Board(GbuyBoardDTO boardDTO) {
		sqlSession.update(namespace+".updateGbuy_Board", boardDTO);
	}

	@Override
	public void deleteGbuy_Board(int num) {
		sqlSession.delete(namespace+".deleteGbuy_Board", num);
	}

}//
