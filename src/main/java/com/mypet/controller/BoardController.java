package com.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	@RequestMapping(value = "/findboard/list", method = RequestMethod.GET)
	public String findBoard() {
		return "findboard/list";
	}
	//세히
	@RequestMapping(value = "/freeboard/free_jau", method = RequestMethod.GET)
	public String freeBoard() {
		return "freeboard/free_jau";
	}
	//세히
	@RequestMapping(value = "/freeboard/free_tip", method = RequestMethod.GET)
	public String freeTipBoard() {
		return "freeboard/free_tip";
	}
	//세히
		@RequestMapping(value = "/gongji/gongji", method = RequestMethod.GET)
		public String gongjiBoard() {
			return "gongji/gongji";
		}
}
