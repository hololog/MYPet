package com.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.mypet.dao.BoardDAO;
import com.mypet.dao.FindboardDAO;
import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;
import com.mypet.domain.ReplyDTO;
import com.mypet.service.BoardService;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;
import com.mypet.service.MypageService;
import com.mypet.dao.MypageDAO;

@RestController
public class AjaxController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FindboardService findboardService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardDAO boardDAO;
	
    @Autowired
	private MypageDAO mypageDAO;
    
    @Autowired
    private FindboardDAO findboardDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	@RequestMapping(value = "/member/memberCheck", method = RequestMethod.GET)
	public ResponseEntity<String> memberCheck(HttpServletRequest request) {
		String result = "";
		String email = request.getParameter("email");
		MemberDTO memberDTO = memberService.getMember(email);
		if (memberDTO != null) {
			result = "emailDup";
		} else {
			result = "emailOk";
		}

		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);

		return entity;
	}	
	
	//??????
	@RequestMapping(value = "/freeboard/ajaxcomments", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> freecommentjson(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("free_board_num"));
		List<ReplyDTO> freecommentList = boardService.getfreecommentList(bnum); // 10
		
		ResponseEntity<List<ReplyDTO>> entity=new ResponseEntity<List<ReplyDTO>>(freecommentList , HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/freeboard/ajaxcommentsfCount", method = RequestMethod.POST)
	public ResponseEntity<String> freecommentCount(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("free_board_num"));
		String result = boardDAO.getfreecommentCount(bnum);
		System.out.println("????????????");
		ResponseEntity <String>entity=new ResponseEntity<String> (result , HttpStatus.OK);
		
		return entity;
	}
	
	
	//review
	@RequestMapping(value = "/reviewboard/ajaxcomments", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> reviewcommentjson(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("tip_board_num"));
		List<ReplyDTO> reviewcommentList = boardService.getreviewcommentList(bnum); // 10
		
		ResponseEntity<List<ReplyDTO>> entity=new ResponseEntity<List<ReplyDTO>>(reviewcommentList , HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewboard/ajaxcommentsfCount", method = RequestMethod.POST)
	public ResponseEntity<String> reviewcommentCount(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("tip_board_num"));
		String result = boardDAO.getreviewcommentCount(bnum);
		System.out.println("????????????");
		ResponseEntity <String>entity=new ResponseEntity<String> (result , HttpStatus.OK);
		
		return entity;
	}
	
	
	//notice
	@RequestMapping(value = "/notice/ajaxcomments", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> noticecommentjson(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("notice_num"));
		System.out.println(bnum);
		List<ReplyDTO> noticecommentList = boardService.getnoticecommentList(bnum); // 10
		
		ResponseEntity<List<ReplyDTO>> entity=new ResponseEntity<List<ReplyDTO>>(noticecommentList , HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/notice/ajaxcommentsfCount", method = RequestMethod.POST)
	public ResponseEntity<String> noticecommentCount(HttpServletRequest request){
		int bnum = Integer.parseInt(request.getParameter("notice_num"));
		String result = boardDAO.getnoticecommentCount(bnum);
		System.out.println("????????????");
		ResponseEntity <String>entity=new ResponseEntity<String> (result , HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/ajaxfindboard", method = RequestMethod.GET)
	public ResponseEntity<FindboardDTO> ajaxboard(HttpServletRequest request) throws Exception{
		int num1 = Integer.parseInt(request.getParameter("num"));
		FindboardDTO findboardDTO = findboardService.getfindBoard(num1);
		
		ResponseEntity<FindboardDTO> fin = new ResponseEntity<FindboardDTO>(findboardDTO, HttpStatus.OK);
		
		return fin;
	}
	
	@RequestMapping(value = "/ajaxmap", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> ajaxmap(HttpServletRequest request) throws Exception{
		int num = Integer.parseInt(request.getParameter("find_board_num"));
		System.out.println(num);
		String result = findboardDAO.getAddr(num);
		System.out.println(result);
		ResponseEntity <String>entity=new ResponseEntity<String> (result , HttpStatus.OK);
		
		return entity;
	}
	

	//??????
	@RequestMapping(value= "/findboard/provinceSelect", method = RequestMethod.GET)
	public ResponseEntity<List<String>> provinceSelect(){
		System.out.println("AjaxController provinceSelect()");//??????????????? ??????
		
		List<String> provinceList = new ArrayList<String>();
		provinceList = findboardService.getProvinceList();
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(provinceList, HttpStatus.OK);
		
		return entity;
	}

	//??????
	@RequestMapping(value= "/findboard/citySelect", method = RequestMethod.GET)
	public ResponseEntity<List<String>> citySelect(HttpServletRequest request){
		String province = request.getParameter("province");//?????? ?????? ?????? ??????????????? ????????????
		System.out.println("address1" + province);//province ?????? ??????????????? ??????
		
		List<String> cityList = new ArrayList<String>();
		cityList = findboardService.getCityList(province);
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(cityList, HttpStatus.OK);
		
		return entity;
	}
	
	//??????
	@RequestMapping(value= "/findboard/townSelect", method = RequestMethod.GET)
	public ResponseEntity<List<String>> townSelect(HttpServletRequest request){
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		System.out.println("address1,2 : "+ province +" " + city);

		AddressDTO addressDTO = new AddressDTO();
		List<String> townList = new ArrayList<String>();
		addressDTO.setAddress1(province);
		addressDTO.setAddress2(city);
		townList = findboardService.getTownList(addressDTO);
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(townList, HttpStatus.OK);
		
		return entity;
	}
	
	//?????? - ??????????????? ???????????? ?????????
//	@ResponseBody
//	@RequestMapping(value= "/findboard/fileupload", method = RequestMethod.POST)
//	   public Map<String, Object> uploadFiles(MultipartFile[] uploadFiles) throws IOException{
//	    
//        Map<String,Object> resultMap=new HashMap<String,Object>();
//
//        boolean fileUpload=findboardService.uploadFile(uploadFiles);
//        
//        if(fileUpload) {
//            resultMap.put("result", "success");
//        }else {
//            resultMap.put("result", "fail");
//        }
//        return resultMap;
//    }
	
	//??????
	@RequestMapping(value = "/member/userCheck2", method = RequestMethod.GET)
	public ResponseEntity<String> userCheck2(HttpServletRequest request) {
		System.out.println("AjaxController userCheck2() ");
		String result="";
		String nickname=request.getParameter("nickname");
		System.out.println(nickname);
		MemberDTO memberDTO =memberService.getMember2(nickname);
		if(memberDTO == null) {
			//????????? ?????? => ????????? ??????
			result="idok";
		}else {
			//????????? ?????? => ????????? ????????????
			result="iddup";
		}
		ResponseEntity<String> entity=new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
	// ????????? ??????
	@RequestMapping(value = "/member/userCheck", method = RequestMethod.GET)
	public ResponseEntity<String> userCheck(HttpServletRequest request) {
		System.out.println("AjaxController userCheck() ");
		String result="";
		String email=request.getParameter("email");
		MemberDTO memberDTO =memberService.getMember(email);
		if(memberDTO!=null) {
			//????????? ?????? => ????????? ??????
			result="iddup";
		}else {
			//????????? ?????? => ????????? ????????????
			result="idok2";
		}
		ResponseEntity<String> entity=new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}

	
	// ??????
	@RequestMapping(value = "/mypage/mypagejson", method = RequestMethod.GET)
	public ResponseEntity<List<MypageDTO>> mypagejson(MypageDTO mypageDTO, HttpServletRequest request){
		String email = request.getParameter("email");
		
		List<MypageDTO> myboardList = mypageDAO.getmyBoardList(email);
		ResponseEntity<List<MypageDTO>> entity=new ResponseEntity<List<MypageDTO>>(myboardList , HttpStatus.OK);
		
		return entity;
	}
	
	// ??????
	@RequestMapping(value = "/mypage/mypagejson2", method = RequestMethod.GET)
	public ResponseEntity<List<MypageDTO>> mypagejson2(MypageDTO mypageDTO, HttpServletRequest request){
		String email = request.getParameter("email");
		System.out.println(email);
		
		List<MypageDTO> myfind_boardList = mypageDAO.getmyfind_BoardList(email);
		ResponseEntity<List<MypageDTO>> entity=new ResponseEntity<List<MypageDTO>>(myfind_boardList , HttpStatus.OK);
		
		return entity;
	}
	
	// ??????
	@ResponseBody
	@RequestMapping(value="/mypage/mypagejson3" , method=RequestMethod.GET)
	public MemberDTO pwCheck(@RequestParam String cuPassword, HttpSession session){
		System.out.println("?????? ???????????? ?????? ajax");
		String email = (String)session.getAttribute("email");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setPassword(cuPassword);
		System.out.println(email + cuPassword);
		
		MemberDTO result = mypageDAO.pwCheck(memberDTO);
		return result;
	}
	
//	@RequestMapping(value="/pwUpdate" , method=RequestMethod.POST)
//	public String pwUpdate(String memberId,String memberPw1,RedirectAttributes rttr,HttpSession session)throws Exception{
//		String hashedPw = BCrypt.hashpw(memberPw1, BCrypt.gensalt());
//		memberService.pwUpdate(memberId, hashedPw);
//		session.invalidate();
//		rttr.addFlashAttribute("msg", "?????? ????????? ?????????????????????. ?????? ?????????????????????.");
//		
//		return "redirect:/member/loginView";
//	}
	
//	@RequestMapping(value = "/main/mainjson", method = RequestMethod.GET)
//	public ResponseEntity<List<FindboardDTO>> mainjson(HttpServletRequest request, @RequestParam("num") String findboardNum) {
//		
//		BookmarkDTO bookmarkDTO = findboardService.getBookmark(findboardNum);
////		model.addAttribute("findboardListMain", findboardListMain);
//		
//
//		
////		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
//		
//		
//		ResponseEntity<List<FindboardDTO>> entity = 
//				new ResponseEntity<List<FindboardDTO>>(findboardListMain,HttpStatus.OK);
//		
//		return entity;
//	}
}
