package com.mypet.service;

import com.mypet.domain.MemberDTO;

public interface MemberService {
	
	public void insertMember(MemberDTO memberDTO);
	
	public MemberDTO memberCheck(MemberDTO memberDTO);
	
	public MemberDTO getMember(String email);
	
	public MemberDTO getMember2(String nickname);

}
