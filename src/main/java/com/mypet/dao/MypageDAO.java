package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

public interface MypageDAO {
	
	public MypageDTO getMember(String email);

	public void updateMember(MypageDTO mypageDTO);
	
	public void deleteMember(MypageDTO mypageDTO);
	
	public List<BoardDTO> getmyBoardList(PageDTO pageDTO);
	
	public int getmyBoardlistCount();

}
