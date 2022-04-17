package com.mypet.dao;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.mypet.mappers.MypageMapper";
	

	@Override
	public MemberDTO getMember(String email) {
		return sqlSession.selectOne(namespace + ".getMember", email);
	}
	
	@Override
	public MemberDTO updateCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".updateCheck", memberDTO);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("DAO확인");
		sqlSession.update(namespace+".updateMember", memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		sqlSession.delete(namespace+".deleteMember", memberDTO);
	}

	@Override
	public List<MypageDTO> getmyBoardList(String mylist) {
		return sqlSession.selectList(namespace+".getmyBoardList", mylist);
	}
	
	@Override
	public List<MypageDTO> getmyfind_BoardList(String mylist2) {
		return sqlSession.selectList(namespace+".getmyBoardList", mylist2);
	}
	
//	@Override
//	public void updateUimage(String email, String userImg) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("email", email);
//		paramMap.put("userImg", userImg);
//		sqlSession.update(namespace + ".updateUimage", paramMap);
//	}

}
