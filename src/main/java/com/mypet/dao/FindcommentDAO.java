package com.mypet.dao;

import java.util.List;

import com.mypet.domain.FindcommentDTO;

public interface FindcommentDAO {

	public List<FindcommentDTO> readComment(int num) throws Exception;
}
