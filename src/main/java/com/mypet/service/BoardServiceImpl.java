package com.mypet.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.BoardDAO;
import com.mypet.domain.BoardDTO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	@Override
	public void writeBoard(BoardDTO boardDTO) {
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		boardDAO.writeBoard(boardDTO);
	}
	
	

	

}
