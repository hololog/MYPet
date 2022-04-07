package com.mypet.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.FindboardDAO;
import com.mypet.domain.FindboardDTO;

@Service
public class FindboardServiceImpl implements FindboardService {

	@Inject
	private FindboardDAO findboardDAO;
	
	@Override
	public FindboardDTO getfindBoard(int num) {
		return findboardDAO.getfindBoard(num);
	}
	
	@Override
	public void insert_findboard(FindboardDTO findboardDTO) {
		//find_board_num 구하기
//		if(findboardDAO.getMaxNum() != null) findboardDTO.setFind_board_num(findboardDAO.getMaxNum()+1);
		findboardDTO.setFind_board_num(1); // INT 변경시 수정예정 
		//readcount, insertdate 설정
		if(findboardDAO.getMaxNum() != null) findboardDTO.setFind_board_num(findboardDAO.getMaxNum()+1);
		else findboardDTO.setFind_board_num(1);
		//readcount, insertdate, boardnum 설정
		findboardDTO.setReadcount(0);
		findboardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		findboardDAO.insert_findboard(findboardDTO);
	}
	
	@Override
	public List<String> getProvinceList() {
		return findboardDAO.getProvinceList();
	}

//	@Override
//	public List<String> getcityname(String province) {
//		return findboardDAO.getcityname(province);
//	}
}
