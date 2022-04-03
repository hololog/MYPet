package com.mypet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.MemberDTO;
import com.mypet.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
	//로그인 precess
//	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
//	public String loginPro(MemberDTO memberDTO, HttpSession session) {
//		MemberDTO memberCheckDTO = memberService.memberCheck(memberDTO);
//		
//		if (memberCheckDTO != null) {
//			session.setAttribute("email", memberDTO.getEmail());
//		} else {
//			return
//		}
//		
//		return "redirect:/main/main";
//	}
	
	//회원가입 precess
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String insertMemberPro(MemberDTO memberDTO) {
		
		memberService.insertMember(memberDTO);
		return "redirect:/main";
	}

}
