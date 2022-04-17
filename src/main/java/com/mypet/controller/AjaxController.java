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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;
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
	private MypageDAO mypageDAO;
	
	@Autowired
	private MypageService mypageService;
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
	
	@RequestMapping(value = "/ajaxfindboard", method = RequestMethod.GET)
	public ResponseEntity<FindboardDTO> ajaxboard(HttpServletRequest request) throws Exception{
		int num1 = Integer.parseInt(request.getParameter("num"));
		FindboardDTO findboardDTO = findboardService.getfindBoard(num1);
		
		ResponseEntity<FindboardDTO> fin = new ResponseEntity<FindboardDTO>(findboardDTO, HttpStatus.OK);
		
		return fin;
	}
	

	//은혜
	@RequestMapping(value= "/findboard/provinceSelect", method = RequestMethod.GET)
	public ResponseEntity<List<String>> provinceSelect(){
		System.out.println("AjaxController provinceSelect()");//실행되는지 체크
		
		List<String> provinceList = new ArrayList<String>();
		provinceList = findboardService.getProvinceList();
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(provinceList, HttpStatus.OK);
		
		return entity;
	}

	//은혜
	@RequestMapping(value= "/findboard/citySelect", method = RequestMethod.GET)
	public ResponseEntity<List<String>> citySelect(HttpServletRequest request){
		String province = request.getParameter("province");//같이 보낸 요처 파마리터값 가져오기
		System.out.println("address1" + province);//province 값을 가져오는지 체크
		
		List<String> cityList = new ArrayList<String>();
		cityList = findboardService.getCityList(province);
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(cityList, HttpStatus.OK);
		
		return entity;
	}
	
	//은혜
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
	
	//은혜 - 드래그드롭 실제파일 업로드
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
	
	//다슬
//	@RequestMapping(value = "/member/memberCheck", method = RequestMethod.GET)
//	public ResponseEntity<String> memberCheck(HttpServletRequest request){
//		String result="";
//		String id=request.getParameter("id");
//		MemberDTO memberDTO=memberService.getMember(id);
//		if(memberDTO!=null) {
//			result="iddup";
//		}else {
//			result="idok";
//		}
//		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
//		
//		return entity;
//		
//		@RequestMapping(value = "/member/memberCheck", method = RequestMethod.GET)
//		public ResponseEntity<String> memberCheck(HttpServletRequest request){
//			String result="";
//			String email=request.getParameter("email");
//			MemberDTO memberDTO=memberService.getMemberEmail(email);
//			if(memberDTO!=null) {
//				result="emaildup";
//			}else {
//				result="emailok";
//			}
//			ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
//			
//			return entity;
//		}
//		
//		@RequestMapping(value = "/member/memberCheck", method = RequestMethod.GET)
//		public ResponseEntity<List<MemberDTO>> memberjson(HttpServletRequest request){
//			
//			List<MemberDTO> memberList=memberService.getMemberList();
//			
//	ResponseEntity<List<MemberDTO>> entity=new ResponseEntity<List<MemberDTO>>(memberList , HttpStatus.OK);
//			
//			return entity;
//		}
		
		
//	}
	
	// 준동
	@RequestMapping(value = "/mypage/mypagejson", method = RequestMethod.GET)
	public ResponseEntity<List<MypageDTO>> mypagejson(MypageDTO mypageDTO, HttpServletRequest request){
		String mylist = request.getParameter("email");
		
		List<MypageDTO> myboardList = mypageDAO.getmyBoardList(mylist);
		ResponseEntity<List<MypageDTO>> entity=new ResponseEntity<List<MypageDTO>>(myboardList , HttpStatus.OK);
		
		return entity;
	}
	
	// 준동
	@RequestMapping(value = "/mypage/mypagejson2", method = RequestMethod.GET)
	public ResponseEntity<List<MypageDTO>> mypagejson2(MypageDTO mypageDTO, HttpServletRequest request){
		String mylist2 = request.getParameter("email");
		
		List<MypageDTO> myfind_boardList = mypageDAO.getmyfind_BoardList(mylist2);
		ResponseEntity<List<MypageDTO>> entity=new ResponseEntity<List<MypageDTO>>(myfind_boardList , HttpStatus.OK);
		
		return entity;
	}	
	
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
