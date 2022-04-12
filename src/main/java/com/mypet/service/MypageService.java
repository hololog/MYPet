package com.mypet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

public interface MypageService {

	public void updateMember(MypageDTO mypageDTO);
	
	public void deleteMember(MypageDTO mypageDTO);

	public MypageDTO getMember(String email);
	
//	public List<MypageDTO> getmyboardlist(PageDTO pageDTO);

	public int getmyBoardlistCount();

	public List<BoardDTO> getmyBoardList(PageDTO pageDTO);
}
