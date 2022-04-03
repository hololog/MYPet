package com.mypet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mypet.domain.MemberDTO;
import com.mypet.service.MemberService;

@RestController
public class AjaxController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/member/memberCheck2", method = RequestMethod.GET)
	public ResponseEntity<String> memberCheck2(HttpServletRequest request){
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
}
