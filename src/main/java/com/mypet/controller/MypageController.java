package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mypet.domain.MemberDTO;
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
		
//		@RequestMapping(value = "/mypage/amendpwdPro", method = RequestMethod.POST)
//		public void amendpwdPro(HttpServletRequest req, HttpSession session) throws Exception {
//			String pass = req.getParameter("password");
//			System.out.println(pass);
			
//			MemberDTO pwUpdateCheckDTO = mypageService.pwCheck(memberDTO);
//			
//			if(pwUpdateCheckDTO != null) {
//				session.setAttribute("password", memberDTO.getPassword());
//				mypageService.pwUpdate(memberDTO);
//				return "redirect:/main"	;
//			} else {
//				return "member/msg";
//			}
//		}
		
		@RequestMapping(value = "/mypage/amendpwdPro", method = RequestMethod.POST)
		public String amendpwdPro(MemberDTO memberDTO, HttpSession session) throws Exception {
			System.out.println(memberDTO.getEmail());
			System.out.println(memberDTO.getPassword2());
			
			mypageService.pwUpdate(memberDTO);
			
			return "/main/main";
		}
		
		@RequestMapping(value = "/mypage/mymisslist", method = RequestMethod.GET)
		public String mymisslist(HttpServletRequest request, Model model) throws Exception {
			
			return "mypage/mymisslist";
		}
		
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
		
}
