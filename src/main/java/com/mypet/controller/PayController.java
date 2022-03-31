package com.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PayController {
	
	@RequestMapping(value = "/pay/product_details", method = RequestMethod.GET)
	public String product_details() {
		return "pay/product_details";
	}
	
	@RequestMapping(value = "/pay/pay_processing", method = RequestMethod.GET)
	public String pay_processing() {
		return "pay/pay_processing";
	}
	
	@RequestMapping(value = "/pay/pay_completed", method = RequestMethod.GET)
	public String pay_completed() {
		return "pay/pay_completed";
	}
	
	
}

