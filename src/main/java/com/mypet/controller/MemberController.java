package com.mypet.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
//	@RequestMapping(value = "/loginmodal", method = RequestMethod.GET)
//	public String test() {
//		return "member/loginmodal";
//	}
	

}
