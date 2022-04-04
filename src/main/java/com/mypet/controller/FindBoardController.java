package com.mypet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.service.FindboardService;

@Controller
public class FindBoardController {

	@Inject
	public  FindboardService findboardService;
	
	// 경진
	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
	public String content_find(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("find_board_num"));
		
		FindboardDTO findboardDTO=findboardService.getfindBoard(num);
		
		model.addAttribute("findboardDTO", findboardDTO);
		
		return "findboard/content";
	}
	
	//은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}
	//은혜
	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
	public String write_find(FindboardDTO findboardDTO) {
		findboardService.insert_findboard(findboardDTO);
		System.out.println("insert_findboard 메서드 실행");
		return "redirect:/findboard/write";
	}
}
