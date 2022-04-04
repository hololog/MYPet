package com.mypet.service;

import java.util.List;

import com.mypet.domain.FindcommentDTO;

public interface FindcommentService {

	public List<FindcommentDTO> readComment(int find_board_num) throws Exception;
}
