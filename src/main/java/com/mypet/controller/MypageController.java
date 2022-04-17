package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.MemberService;
import com.mypet.service.MypageService;

@Controller
public class MypageController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	public MypageService mypageService;

		
		@RequestMapping(value = "/mypage/myinfo", method = RequestMethod.GET)
		public String myinfo(HttpServletRequest request, Model model) throws Exception {
			String myinfo = request.getParameter("email");
			MemberDTO memberDTO = memberService.getMember(myinfo);
			model.addAttribute("memberDTO", memberDTO);
			return "mypage/myinfo";
		}
		
//		@RequestMapping(value = "/mypage/bookmark", method = RequestMethod.GET)
//		public String bookmark(HttpServletRequest request, Model model) throws Exception {
//			return "mypage/bookmark";
//		}
		
		@RequestMapping(value = "/mypage/mylist", method = RequestMethod.GET)
		public String mylist(HttpServletRequest request, Model model) throws Exception {
			String mylist = request.getParameter("email");
//			ArrayList<MypageDTO> myboardlist = mypageService.getMember();
			System.out.println("MypageController mylist() ");
			
			int pageSize=5;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			
			List<BoardDTO> getmyboardlist = mypageService.getmyBoardList(pageDTO);
			int count=mypageService.getmyBoardlistCount();
			
			int currentPage=Integer.parseInt(pageNum);
			int pageBlock=10;
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
			
			model.addAttribute("getmyboardlist", getmyboardlist);
			model.addAttribute("pageDTO", pageDTO);
			
			return "mypage/mylist";
		}
	
		@RequestMapping(value = "/mypage/leave", method = RequestMethod.GET)
		public String leave(HttpServletRequest request, Model model) throws Exception {
			
			
			return "mypage/leave";
		}
		
//		@RequestMapping(value = "/mypage/mylist", method = RequestMethod.GET)
//		public String mylist(HttpServletRequest request, Model model) {
//			String email = (String)request.getparameter("email");
//			ArrayList<BoardDTO> mylist = memberService.getMember(email);
//			return "mypage/mylist";
//		}
		
		@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
		public String update(HttpServletRequest request, Model model) throws Exception {
			String update = request.getParameter("email");
			MemberDTO memberDTO = memberService.getMember(update);
			model.addAttribute("memberDTO", memberDTO);
			return "mypage/update";
		}
		
}
