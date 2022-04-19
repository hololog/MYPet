package com.mypet.service;

import java.sql.Timestamp;

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
		
		if(memberDAO.getUserMaxNum() != null) {
			memberDTO.setUser_id(memberDAO.getUserMaxNum()+1);
		} else {
			memberDTO.setUser_id(1);
		}
		
		memberDTO.setJoin_date(new Timestamp(System.currentTimeMillis()));
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public MemberDTO memberCheck(MemberDTO memberDTO) {
		return memberDAO.memberCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return memberDAO.getMember(email);
	}

	@Override
	public MemberDTO getMember2(String nickname) {
		return memberDAO.getMember(nickname);
	}
	
}
