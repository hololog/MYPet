package com.mypet.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
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
	
	@Override
	public void insert_findboard(FindboardDTO findboardDTO) {
		sqlSession.insert(namespace+".insert_findboard", findboardDTO);
	}
	
	@Override
	public void insert_findboard_file(FileDTO fileDTO) {
		sqlSession.insert(namespace+".insert_findboard_file", fileDTO);
	}

	
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	
	@Override
	public Integer getFileMaxNum() {
		return sqlSession.selectOne(namespace+".getFileMaxNum");
	}
	
	
	@Override
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getfindBoardList", pageDTO);
}
	
	@Override
	public List<FileDTO> getfindFileList(PageDTO pageDTO){
		return sqlSession.selectList(namespace+".getfindFileList", pageDTO);
	}
	
	@Override
	public List<FindboardDTO> getfindMissBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getfindMissBoardList", pageDTO);
}

	@Override
	public int getfindBoardCount() {
		return sqlSession.selectOne(namespace+".getfindBoardCount");
	}
	
	@Override
	public int getfindMissBoardCount() {
		return sqlSession.selectOne(namespace+".getfindMissBoardCount");
	}
	
	//은혜 지역검색
	@Override
	public List<String> getProvinceList() {
		return sqlSession.selectList(namespace+".getProvinceList");
	}
	@Override
	public List<String> getCityList(String province) {
		return sqlSession.selectList(namespace + ".getCityList", province);
	}
	@Override
	public List<String> getTownList(AddressDTO addressDTO) {
		return sqlSession.selectList(namespace+ ".getTownList", addressDTO);
	}

	@Override
	public List<FindboardDTO> getfindBoardListMain() {
		return sqlSession.selectList(namespace + ".getfindBoardListMain");
	}

	@Override
	public List<FindboardDTO> getfindBoardListMain(String email) {
		return sqlSession.selectList(namespace + ".getfindBoardListMain", email);
	}	

	@Override
	public void update_board_num_forfile() {
		sqlSession.update(namespace +".update_boardNum_forfile");
	}

	@Override
	public void updatefilename() {
		sqlSession.update(namespace +".updatefilename");
	}
	
	@Override
	public void updatefindBoard(FindboardDTO findboardDTO) {
		sqlSession.update(namespace+".updatefindBoard", findboardDTO);
	}
	
	@Override
	public void update_findboard_file(FileDTO fileDTO) {
		sqlSession.update(namespace+".update_findboard_file", fileDTO);
	}
	
	


	
	
	
	
	
	


}
