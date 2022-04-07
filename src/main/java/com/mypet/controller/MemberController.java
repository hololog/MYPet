package com.mypet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

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
	
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(MemberDTO memberDTO) {
		
		return "member/login";
	}
	
	//로그인
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		
		MemberDTO memberCheckDTO = memberService.memberCheck(memberDTO);

		if (memberCheckDTO != null) {
			session.setAttribute("email", memberCheckDTO.getEmail());
			session.setAttribute("nickname", memberCheckDTO.getNickname());
			return "redirect:/main";
		} else {
			return "member/msg";
		}
	}
	
	//회원가입
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String insertMemberPro(MemberDTO memberDTO) {
		
		memberService.insertMember(memberDTO);
		return "redirect:/main";
	}
	
	//로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
}
