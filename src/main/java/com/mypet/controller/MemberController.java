package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.BoardService;
import com.mypet.service.FindboardService;
import com.mypet.service.GbuyBoardService;
import com.mypet.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	public FindboardService findboardService;
	
	@Inject
	public GbuyBoardService GbuyboardService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpSession session, HttpServletRequest request, Model model) {
		String email = (String)session.getAttribute("email");
		int pageSize=1;
		
        String pageNum=request.getParameter("pageNum");
        if(pageNum==null) {
           pageNum="1";
        }
        PageDTO pageDTO=new PageDTO();
        pageDTO.setPageSize(pageSize);
        pageDTO.setPageNum(pageNum);
        
        //전체 글개수 구하기 => 디비에서 가져오기
        //int  리턴할형  getBoardCount()     메서드 정의
        //select count(*) from board
        // int count=bDAO.getBoardCount();
        int count=GbuyboardService.getBoardCount();
        int currentPage=Integer.parseInt(pageNum);
        int pageBlock=5;
        int startPage=(currentPage-1)/pageBlock*pageBlock+1;
        int endPage=startPage+pageBlock-1;
        int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
        if(endPage > pageCount){
           endPage = pageCount;
        }
        pageDTO.setCount(count);
        pageDTO.setPageBlock(pageBlock);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setPageCount(pageCount);
        
        // 디비에서 가져온 글을 model 담아서 notice.jsp 전달
       
        List<GbuyBoardDTO> GbuyboardList=GbuyboardService.getBoardList(pageDTO);
		List<FindboardDTO> findboardListMain = findboardService.getfindBoardListMain(email);
		model.addAttribute("findboardListMain", findboardListMain);
		model.addAttribute("GbuyboardList", GbuyboardList);
	    model.addAttribute("pageDTO", pageDTO);
		
		
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
	public String join(MemberDTO memberDTO) {
		memberService.insertMember(memberDTO);
//		return "redirect:/main";
		return "member/welcomeMsg";
	}
	
	
	
	//로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
}
