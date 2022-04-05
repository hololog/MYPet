package com.mypet.controller;

import java.util.List;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.FindboardDTO;
import com.mypet.domain.FindcommentDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.FindcommentService;

@Controller
public class FindBoardController {

	@Inject
	public  FindboardService findboardService;
	
	@Inject
	public FindcommentService findcommentService;
	
	// 경진
	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
	public String content_find(HttpServletRequest request, Model model) throws Exception {
		int num=Integer.parseInt(request.getParameter("find_board_num"));
		FindboardDTO findboardDTO=findboardService.getfindBoard(num);
		model.addAttribute("findboardDTO", findboardDTO);
		
		List<FindcommentDTO> replyList = findcommentService.readComment(findboardDTO.getFind_board_num());
		model.addAttribute("replyList", replyList);
		
		return "findboard/content";
	}
	
	//은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}
	//은혜
	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
	public String write_find(FindboardDTO findboardDTO, HttpServletRequest request) {
//		String missing_date3 = request.getParameter("missing_date2");
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		format.parse(missing_date3);
		findboardService.insert_findboard(findboardDTO);
		System.out.println("insert_findboard 메서드 실행");
		return "redirect:/findboard/list";
	}

}
