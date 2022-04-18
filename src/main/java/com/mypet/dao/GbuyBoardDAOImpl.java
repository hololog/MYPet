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
	public GbuyBoardDTO getGbuy_Board(int gbuy_num) {
		return sqlSession.selectOne(namespace+".getGbuy_Board", gbuy_num);
	}

	@Override
	public void updateGbuy_Readcount(int num) {
		sqlSession.update(namespace+".updateGbuy_Readcount", num);
	}

	@Override
	public void updateGbuy_Board(GbuyBoardDTO gbuyBoardDTO) {
		sqlSession.update(namespace+".updateGbuy_Board", gbuyBoardDTO);
	}

	@Override
	public void deleteGbuy_Board(int gbuy_num) {
		sqlSession.delete(namespace+".deleteGbuy_Board", gbuy_num);
	}

//-------------------------결제------------------
	@Override
	public Integer getPay_MaxNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getPay_MaxNum");
	}
	@Override
	public List<GbuyBoardDTO> getPayBoardList(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getPayBoardList", pageDTO);
	}
	@Override
	public GbuyBoardDTO getPay_Board(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getPay_Board", num);
	}
	@Override
	public void Pay_writeBoard(GbuyBoardDTO gbuyBoardDTO) {
		System.out.println("getOrder_no = " + gbuyBoardDTO.getOrder_no());
		System.out.println("getUser_id = " + gbuyBoardDTO.getUser_id());
		System.out.println("getOrder_date = " + gbuyBoardDTO.getOrder_date());
		System.out.println("getProduct_no = " + gbuyBoardDTO.getProduct_no());
		System.out.println("getOrder_qty = " + gbuyBoardDTO.getOrder_qty());
		System.out.println("getAmount = " + gbuyBoardDTO.getAmount());
		System.out.println("getZipcode = " + gbuyBoardDTO.getZipcode());
		System.out.println("getAddress = " + gbuyBoardDTO.getAddress());
		System.out.println("getDetail_address = " + gbuyBoardDTO.getDetail_address());
		System.out.println("getStatus = " + gbuyBoardDTO.getStatus());
		System.out.println("getDelivery_no = " + gbuyBoardDTO.getDelivery_no());
		System.out.println("getPhone_no = " + gbuyBoardDTO.getPhone_no());
		System.out.println("getProduct_name = " + gbuyBoardDTO.getProduct_name());
		sqlSession.insert(namespace+".Pay_writeBoard", gbuyBoardDTO);
		// TODO Auto-generated method stub
	}
	@Override
	public void updateGbuy_Board2(GbuyBoardDTO gbuyBoardDTO) {
		sqlSession.update(namespace+".updateGbuy_Board2", gbuyBoardDTO);
		
	}
}//
