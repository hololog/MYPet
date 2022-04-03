package com.mypet.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.FindboardDTO;

@Repository
public class FindboardDAOImpl implements FindboardDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.findboardMapper";
	
	@Override
	public FindboardDTO getfindBoard(int num) {
		return sqlSession.selectOne(namespace+".getfindBoard", num);
	}
}
