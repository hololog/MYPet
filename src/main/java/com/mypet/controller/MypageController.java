package com.mypet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		public String update(HttpSession session) throws Exception {
			String nickname = (String)session.getAttribute("nickname");
			mypageService.getMember(nickname);
			return "mypage/update";
		}
		
		@RequestMapping(value = "/mypage/updatePro", method = RequestMethod.POST)
		public String updatePro(MemberDTO memberDTO, HttpSession session) throws Exception {
			System.out.println(memberDTO.getNickname());
			System.out.println(memberDTO.getEmail());
			
			MemberDTO updateCheckDTO = mypageService.updateCheck(memberDTO);
			
			if(updateCheckDTO == null) {
				session.setAttribute("nickname", memberDTO.getNickname());
				mypageService.updateMember(memberDTO);
				return "redirect:/mypage/myinfo";
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
				return "redirect:/main";
			} else {
				return "member/msg";
			}
		}
		
		@RequestMapping(value = "/mypage/amendpwd", method = RequestMethod.GET)
		public String amendpwd() {
			System.out.println("MypageController amendpwd() ");
			return "mypage/amendpwd";
		}
		
//		@RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
//		@ResponseBody
//		public int pwCheck(MemberDTO memberDTO) throws Exception{
//			String memberPw = memberService.pwCheck(memberDTO.getEmail());
//			if( memberDTO == null || !BCrypt.checkpw(memberDTO.getPassword(), memberDTO.getPassword())) {
//				return 0;
//			}
//			return 1;
//		}
//		
//		@RequestMapping(value="/pwUpdate" , method=RequestMethod.POST)
//		public String pwUpdate(String memberId,String memberPw1,RedirectAttributes rttr,HttpSession session)throws Exception{
//			String hashedPw = BCrypt.hashpw(memberPw1, BCrypt.gensalt());
//			memberService.pwUpdate(memberId, hashedPw);
//			session.invalidate();
//			rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
//			
//			return "redirect:/member/loginView";
//		}
		
//		@RequestMapping(value = "/modify/image", method = RequestMethod.POST)
//		public String userImgModify(String userId,
//									MultipartFile file,
//									HttpSession session,
//									RedirectAttributes redirectAttributes) throws Exception {
//			if (file == null) {
//				redirectAttributes.addFlashAttribute("msg", "FAIL");
//				return "redirect:/user/profile";
//			}
//			String uploadFile = UploadFileUtils.uploadFile(uimagePath, file.getOriginalFilename(), file.getBytes());
//			String front = uploadFile.substring(0, 12);
//			String end = uploadFile.substring(14);
//			String userImg = front + end;
//			MemberDTO.modifyUimage(userId, userImg);
//			Object userObj = session.getAttribute("login");
//			User userVO = (UserVO) userObj;
//			userVO.setUserImg(userImg);
//			session.setAttribute("login", userVO);
//			redirectAttributes.addFlashAttribute("msg", "SUCCESS");
//			return "redirect:/user/profile"; }
		
		@RequestMapping(value = "/mypage/bookmark", method = RequestMethod.GET)
		public String bookmark(HttpServletRequest request, Model model, HttpSession session) throws Exception {
			
			System.out.println("MypageController bookmark() ");
			
			// email, pageDTO 담아줄 객체 
			String email = (String)session.getAttribute("email");
			
			//pageDTO 값 정의
			int pageSize = 2;
			
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
