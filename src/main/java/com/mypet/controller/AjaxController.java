package com.mypet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mypet.domain.MemberDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;

@RestController
public class AjaxController {
	
	@Autowired
	private MemberService memberService;
	
	@Inject
	private FindboardService findboardService;
	
	@RequestMapping(value = "/member/memberCheck", method = RequestMethod.GET)
	public ResponseEntity<String> memberCheck(HttpServletRequest request){
		String result="";
		String email = request.getParameter("email");
		MemberDTO memberDTO = memberService.getMember(email);
		if(memberDTO != null) {
			result = "emailDup";
		} else {
			result = "emailOk";
		}
		
		ResponseEntity<String> entity = 
				new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	//은혜
	@RequestMapping(value= "/findboard/provinceSelect", method = RequestMethod.POST)
	public ResponseEntity<List<String>> provinceSelect(){
		List<String> provinceList = new ArrayList<String>();
		provinceList = findboardService.getProvinceList();
		
		ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(provinceList, HttpStatus.OK);
		
		return entity;
	}
	//은혜
//	@RequestMapping(value= "/findboard/citySelect", method = RequestMethod.POST)
//	public ResponseEntity<List<String>> citySelect(HttpServletRequest request,String param){
//		String province = request.getParameter(param);
//		List<String> citylist = new ArrayList<String>();
//		citylist = findboardService.getcityname(province);
//		
//		ResponseEntity<List<String>> entity = 
//				new ResponseEntity<List<String>>(citylist, HttpStatus.OK);
//		
//		return entity;
//	}
	
}
