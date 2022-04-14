package com.mypet.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{


	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mypet.mappers.memberMapper";
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}
	

	@Override
	public MemberDTO memberCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".memberCheck", memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return sqlSession.selectOne(namespace + ".getMember", email); 
	}

	@Override
	public Integer getUserMaxNum() {
		return sqlSession.selectOne(namespace + ".getUserMaxNum");
	}
}
