package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

public interface MypageDAO {
	
	public MemberDTO getMember(String email);
	
	public MemberDTO updateCheck(MemberDTO memberDTO);

	public void updateMember(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);
	
	public List<MypageDTO> getmyBoardList(String mylist);
	
//	public int getmyBoardlistCount();
	
	public void updateUimage(String email, String uimage) throws Exception;

}
