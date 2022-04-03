package com.mypet.service;

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
}
