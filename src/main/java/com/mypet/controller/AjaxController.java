package com.mypet.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

import com.mypet.domain.AddressDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;

@RestController
public class AjaxController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FindboardService findboardService;
	
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
	@ResponseBody
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
	
	//은혜 - 실제파일 업로드
//	@RequestMapping(value= "/findboard/fileupload", method = RequestMethod.POST)
//	public ResponseEntity<List<MultipartFile>> fileupload(@RequestParam("fileList") MultipartFile file) throws Exception{
//		UUID uid = UUID.randomUUID(); // 범용 고유 식별자
//		String fileName = uid.toString()+"_"+file.getOriginalFilename(); // 실제파일 저장이름 
//		
//		File uploadfile = new File(uploadPath, fileName); // 파일복사 upload폴더에 fileName 
//		FileCopyUtils.copy(file.getBytes(), uploadfile);
//		
//		Map<String,MultipartFile> fileNameList = new HashMap<String, MultipartFile>();
//		
//		ResponseEntity<Map<String,MultipartFile>> entity = 
//				new ResponseEntity<List<MultipartFile>>(fileNameList, HttpStatus.OK);
//		
//		return entity;
//	}	
	
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
}
