package com.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;
import com.mypet.service.MypageService;

@Controller
public class MypageController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	public MypageService mypageService;
	
	@Inject
	public FindboardService findboardService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

		
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
			
			return "mypage/mylist";
		}
		
		@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
		public String update(HttpSession session, Model model) throws Exception {
			String email = (String)session.getAttribute("email");
			MemberDTO memberDTO = mypageService.getMember(email); 
			model.addAttribute("memberDTO",memberDTO);
			return "mypage/update";
		}
		
		@RequestMapping(value = "/mypage/updatePro", method = RequestMethod.POST)
		public String updatePro(MultipartHttpServletRequest multi, HttpSession session) throws Exception {
//			System.out.println(memberDTO.getNickname());
//			System.out.println(memberDTO.getEmail());
			
			MemberDTO memberDTO = new MemberDTO();
			MultipartFile file = multi.getFile("profile");
			MemberDTO updateCheckDTO = mypageService.updateCheck(memberDTO);
			
			if(updateCheckDTO == null) {
				
				memberDTO.setNickname(multi.getParameter("nickname"));
				memberDTO.setEmail(multi.getParameter("email"));
				
				
				//path 설정, 원본파일명 변수에 담기
				String path=uploadPath;
				String originFileName = file.getOriginalFilename(); // 원본 파일 명
				 
			        System.out.println("originFileName : " + originFileName);
			        
			        //원본파일명 -> 중복 불가능한 파일명 만들기(=실제 저장 파일명)
			        UUID uid = UUID.randomUUID();
			        String safeFile = uid.toString() +"_"+ originFileName;
			        
			        //실제저장파일명 memberDTO에 set 해주기
			        memberDTO.setProfileUpload(safeFile);
			        
			        //실제 파일 저장하기
			        try {
			            File uploadfile = new File(path,safeFile);
			            FileCopyUtils.copy(file.getBytes(), uploadfile);
			        } catch (IllegalStateException e) {
			            e.printStackTrace();
			        } catch (IOException e) {
			            e.printStackTrace();
			        }
				
				mypageService.updateMember(memberDTO);
				
				MemberDTO updatememberDTO = mypageService.getMember(memberDTO.getEmail());
				
				session.setAttribute("email", updatememberDTO.getEmail());
				session.setAttribute("nickname", updatememberDTO.getNickname());
				session.setAttribute("profileUpload", updatememberDTO.getProfileUpload());
				
				return "main/main";
			} else {
				return "mypage/mypagemsg";
			}
		}
		
		@RequestMapping(value = "/mypage/leave", method = RequestMethod.GET)
		public String leave() {
			System.out.println("MypageController leave() ");
			return "mypage/leave";
		}
		
		@RequestMapping(value = "/mypage/leavePro", method = RequestMethod.POST)
		public String leave(MemberDTO memberDTO, HttpSession session) {
			System.out.println("MypageController leavePro() ");
			System.out.println(memberDTO);
			System.out.println(memberDTO.getEmail());
			System.out.println(memberDTO.getPassword());
//			String leave = request.getParameter("email");
			MemberDTO updateCheckDTO = mypageService.updateCheck(memberDTO);
			
			if(updateCheckDTO != null) {
				mypageService.deleteMember(memberDTO);
				session.invalidate();
				return "mypage/leaveMsg";
			} else {
				return "member/msg";
			}
		}
		
		@RequestMapping(value = "/mypage/amendpwd", method = RequestMethod.GET)
		public String amendpwd(HttpSession session) throws Exception {
			String password = (String)session.getAttribute("password");
			System.out.println("들어옴");
			mypageService.getMember(password);
			return "mypage/amendpwd";
		}
		
		
		@RequestMapping(value = "/mypage/amendpwdPro", method = RequestMethod.POST)
		public String amendpwdPro(MemberDTO memberDTO, HttpSession session) throws Exception {
			System.out.println(memberDTO.getEmail());
			System.out.println(memberDTO.getPassword2());
			
			mypageService.pwUpdate(memberDTO);
			
			return "redirect:/main";
		}
		
		@RequestMapping(value = "/mypage/mymisslist", method = RequestMethod.GET)
		public String mymisslist(HttpServletRequest request, Model model) throws Exception {
			
			return "mypage/mymisslist";
		}
		
		@RequestMapping(value = "/mypage/bookmark", method = RequestMethod.GET)
		public String bookmark(HttpServletRequest request, Model model, HttpSession session) throws Exception {
			
			System.out.println("MypageController bookmark() ");
			
			// email, pageDTO 담아줄 객체 
			String email = (String)session.getAttribute("email");
			
			//pageDTO 값 정의
			int pageSize = 3;
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setEmail(email);
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);

			int count = mypageService.getBookmarkCount();

			int currentPage = Integer.parseInt(pageNum); // 현재페이지 int 로 변경
			int pageBlock = 5;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			if (endPage > pageCount) {
				endPage = pageCount;
			}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);

			List<FindboardDTO> findboardList = mypageService.getFindboardBookmarkList(pageDTO);
			List<FileDTO> fileList = mypageService.getfindFileList(pageDTO);
			
			model.addAttribute("findboardList", findboardList);
			model.addAttribute("fileList", fileList);
			model.addAttribute("pageDTO", pageDTO);
			
			
//			}
			return "mypage/bookmark";
		}
		
		
}
