package com.mypet.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.MemberDAO;
import com.mypet.domain.MemberDTO;

@Service
<<<<<<< Updated upstream
public class MemberServiceImpl implements MemberService{
=======
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		memberDAO.insertMember(memberDTO);
		//등록일은 DB에서?
		
	}
>>>>>>> Stashed changes

}
