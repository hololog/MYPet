package com.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PayController {
	
	@RequestMapping(value = "/pay/pay_complete", method = RequestMethod.GET)
	public String main() {
		return "pay/pay_complete";
	}
	
}
