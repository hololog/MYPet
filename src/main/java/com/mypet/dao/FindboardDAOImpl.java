package com.mypet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

@Repository
public class FindboardDAOImpl implements FindboardDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.mypet.mappers.findboardMapper";
	
	@Override
	public FindboardDTO getfindBoard(int num) {
		return sqlSession.selectOne(namespace+".getfindBoard", num);
	}
	
//	@Override
//	public FindboardDTO bringfindBoard(int num) {
//		return sqlSession.selectOne(namespace+".bringfindBoard", num);
//	}
	
	@Override
	public void insert_findboard(FindboardDTO findboardDTO) {
		sqlSession.insert(namespace+".insert_findboard", findboardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	
	@Override
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getfindBoardList", pageDTO);
}
	public List<String> getProvinceList() {
		return sqlSession.selectList(namespace+".getProvinceList");
	}
	
//	@Override
//	public List<String> getcityname(String province) {
//		return sqlSession.selectList(namespace+".getcityname", province);
//	}
	
	
	@Override
	public int getfindBoardCount() {
		return sqlSession.selectOne(namespace+".getfindBoardCount");
	}
}
