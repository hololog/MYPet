package com.mypet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.FindcommentDTO;

@Repository
public class FindcommentDAOImpl implements FindcommentDAO {

	@Inject
		SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.findboardMapper";
	
	@Override
	public List<FindcommentDTO> readComment(int num) throws Exception{
		return sqlSession.selectList(namespace+".readComment", num);
	}
}
