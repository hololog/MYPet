package com.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
//	@RequestMapping(value = "/loginmodal", method = RequestMethod.GET)
//	public String test() {
//		return "member/loginmodal";
//	}
	

}
