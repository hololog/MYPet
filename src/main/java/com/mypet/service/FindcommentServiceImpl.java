package com.mypet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.FindcommentDAO;
import com.mypet.domain.FindcommentDTO;

@Service
public class FindcommentServiceImpl implements FindcommentService{

	@Inject
	private FindcommentDAO findcommentDAO;
	
	@Override
	public List<FindcommentDTO> readComment(int find_board_num) throws Exception{
		return findcommentDAO.readComment(find_board_num);
	}
	
	
}
