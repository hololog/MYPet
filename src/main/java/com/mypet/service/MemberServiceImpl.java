package com.mypet.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.MemberDAO;
import com.mypet.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		memberDAO.insertMember(memberDTO);
		//등록일은 DB에서?
		
	}

	@Override
	public MemberDTO memberCheck(MemberDTO memberDTO) {
		return memberDAO.memberCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return memberDAO.getMember(email);
	}

}
