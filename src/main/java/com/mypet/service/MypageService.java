package com.mypet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

public interface MypageService {

	public void updateMember(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);

	public MemberDTO getMember(String email);
	
	public MemberDTO updateCheck(MemberDTO memberDTO);

//	public List<MypageDTO> getmyBoardList(BoradDTO boardDTO);
	
//	public void modifyUimage(String email, String uimage) throws Exception;

}
