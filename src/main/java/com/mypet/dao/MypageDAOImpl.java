package com.mypet.dao;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.inject.Inject;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mypet.mappers.MypageMapper";
	

	@Override
	public MypageDTO getMember(String email) {
		return sqlSession.selectOne(namespace + ".getMember", email); 
	}

	@Override
	public void updateMember(MypageDTO mypageDTO) {
		System.out.println("MyapgeDAOImpl updateMember()");
		sqlSession.update(namespace+".updateMember", mypageDTO);
	}

	@Override
	public void deleteMember(MypageDTO mypageDTO) {
		sqlSession.delete(namespace+".deleteMember", mypageDTO);
	}

	@Override
	public List<BoardDTO> getmyBoardList(PageDTO pageDTO) {
		System.out.println("DAO알람");
		return sqlSession.selectList(namespace+".getmyboardlist", pageDTO);
	}

	@Override
	public int getmyBoardlistCount() {
		return sqlSession.selectOne(namespace+".getmyBoardlistCount");
	}
	
}
