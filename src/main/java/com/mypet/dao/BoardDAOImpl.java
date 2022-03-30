package com.mypet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.BoardDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.boardMapper";

	@Override
	public void writeBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".writeBoard", boardDTO);
		
	}
	
	
}//
