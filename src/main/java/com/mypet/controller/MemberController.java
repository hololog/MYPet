package com.mypet.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.MemberDTO;
import com.mypet.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
//	@RequestMapping(value = "/loginmodal", method = RequestMethod.GET)
//	public String test() {
//		return "member/loginmodal";
//	}
	
//	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
//	public String loginPro(MemberDTO memberDTO, HttpSession session) {
//		MemberDTO userCheckDTO = memberService.userCheck(memberDTO);
//		
//		return "redirect:/main/main";
//	}

	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String insertMemberPro(MemberDTO memberDTO) {
		
		memberService.insertMember(memberDTO);
		return "redirect:/main/main";
	}

}
