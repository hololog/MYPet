package com.mypet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	
}
