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
		
//	// 카카오 로그인
//	System.out.println("카카오로그인");
//	System.out.println(request.getParameter("kakaoemail"));
//	System.out.println(request.getParameter("kakaoname"));
//	
//
//	// kakaoemail을 kakaoid에 저장
//	String kakaoid = request.getParameter("kakaoemail");
//
//	UserTO userTo = new UserTO();
//
//	// kakaoid를 to의 id로 세팅
//	userTo.setId(kakaoid);
//
//	// 카카오계정으로 로그인한 적이 있는지 없는지 
//	int result_lookup = userDao.loginLookup(userTo);
//
//	if (result_lookup == 0) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
//	    System.out.println("카카오 회원 정보 설정");
//
//	    request.setAttribute("kakaoid",request.getParameter("kakaoemail"));
//	    request.setAttribute("kakaoname",request.getParameter("kakaoname"));
//	    request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));
//
//	    // 회원가입창으로 이동
//	    return "user/kakaoLogin_editForm";
//
//	} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
//	    // id, nick, profile을 가져와서
//	    userTo = userDao.loginOkNick(userTo);
//	    // id를 세션에 저장
//	    session.setAttribute("kakaoid", userTo.getId());
//	    // nick을 세션에 저장
//	    session.setAttribute("nick", userTo.getNick());
//	    // 프로필 사진 (profile)을 세션에 저장
//	    session.setAttribute("profile", userTo.getProfile());
//
//	    request.setAttribute("flag", 0);
//
//	    System.out.println("kakaoid : " + userTo.getId());
//	    System.out.println("nick : " + userTo.getNick());
//	    System.out.println("profile : " + userTo.getProfile());
//	}	
	
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





















