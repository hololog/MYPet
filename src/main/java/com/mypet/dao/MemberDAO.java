package com.mypet.dao;

import com.mypet.domain.MemberDTO;

public interface MemberDAO {
	
	public void insertMember(MemberDTO memberDTO);
	
	public MemberDTO memberCheck(MemberDTO memberDTO);
	
	public MemberDTO getMember(String email);
	
	public MemberDTO getMember2(String nickname);
	
	public Integer getUserMaxNum();
	
}
