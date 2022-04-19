package com.mypet.dao;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
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
	public MemberDTO getMember(String myinfo) {
		return sqlSession.selectOne(namespace + ".getMember", myinfo);
	}
	
	@Override
	public MemberDTO updateCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".updateCheck", memberDTO);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("DAO확인");
		System.out.println(memberDTO.getEmail());
		System.out.println(memberDTO.getNickname());
		System.out.println(memberDTO.getProfileUpload());
		sqlSession.update(namespace+".updateMember", memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		sqlSession.delete(namespace+".deleteMember", memberDTO);
	}

	@Override
	public List<MypageDTO> getmyBoardList(String email) {
		return sqlSession.selectList(namespace+".getmyBoardList", email);
	}
	
	@Override
	public List<MypageDTO> getmyfind_BoardList(String email) {
		return sqlSession.selectList(namespace+".getmyfind_BoardList", email);
	}
	
	@Override
	public MemberDTO pwCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".pwCheck", memberDTO);
	}

	@Override
	public void pwUpdate(MemberDTO memberDTO) {
		System.out.println("비번 DAO확인");
		sqlSession.update(namespace+".pwUpdate", memberDTO);
	}

	
//	@Override
//	public void updateUimage(String email, String userImg) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("email", email);
//		paramMap.put("userImg", userImg);
//		sqlSession.update(namespace + ".updateUimage", paramMap);
//	}
	
	@Override
	public List<FindboardDTO> getFindboardBookmarkList(PageDTO pageDTO) {
		System.out.println("MypageDAOImpl getFindboardBookmarkList()");
		return sqlSession.selectList(namespace+".getFindboardBookmarkList", pageDTO);
	}
	
	@Override
	public List<FileDTO> getfindFileList(PageDTO pageDTO){
		return sqlSession.selectList(namespace+".getfindFileList", pageDTO);
	}

	@Override
	public int getBookmarkCount() {
		return sqlSession.selectOne(namespace +".getBookmarkCount");
	}
	
	
	

}
