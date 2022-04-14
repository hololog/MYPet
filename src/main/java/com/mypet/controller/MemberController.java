package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	public FindboardService findboardService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		List<FindboardDTO> findboardListMain = findboardService.getfindBoardListMain(email);
		model.addAttribute("findboardListMain", findboardListMain);
		return "main/main";
	}
	
//	//로그인
//	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
//	public String login(MemberDTO memberDTO) {
//		return "redirect:/main";
//	}
	
	//로그인
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		
		MemberDTO memberCheckDTO = memberService.memberCheck(memberDTO);
		
		if (memberCheckDTO != null) {
			session.setAttribute("email", memberCheckDTO.getEmail());
			session.setAttribute("nickname", memberCheckDTO.getNickname());
//			return "redirect:/main";
			return "member/loginMsg";
			
		} else {
			
			return "member/msg";
		}
	}
	
	//회원가입
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.POST)
	public String joinPro(MemberDTO memberDTO) {
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





















