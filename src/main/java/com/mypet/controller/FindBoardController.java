package com.mypet.controller;

import java.util.List;
import java.beans.PropertyEditorSupport;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.FindcommentDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.FindcommentService;

@Controller
public class FindBoardController {

	@Inject
	public FindboardService findboardService;

	@Inject
	public FindcommentService findcommentService;
	

//	 경진
//	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
//	public String content_find(HttpServletRequest request, Model model) throws Exception {
//
//		List<FindcommentDTO> replyList = findcommentService.readComment(findboardDTO.getFind_board_num());
//		model.addAttribute("replyList", replyList);
//
//		return "findboard/content";
//	}

	// 은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}

	// 은혜
	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
	public String write_find(FindboardDTO findboardDTO) {
		findboardService.insert_findboard(findboardDTO);
		System.out.println("insert_findboard 메서드 실행");
		return "redirect:/findboard/list";
	}

//	@InitBinder
//	public void InitBinder(WebDataBinder binder) {
//		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-mm-dd");
//		
//	}
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) throws Exception {
//	    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
//
//	        public void setAsText(String text) throws IllegalArgumentException {
//	            try {
//	                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
//	                System.out.println("initBinder 실행");
//	            } catch (ParseException e) {
//	                setValue(null);
//	            }
//	        }
//	    });
//	}
	
	// 경진
	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
	public String content_find(HttpServletRequest request, Model model) throws Exception {
		int num=Integer.parseInt(request.getParameter("find_board_num"));
		FindboardDTO findboardDTO=findboardService.getfindBoard(num);
		model.addAttribute("findboardDTO", findboardDTO);
		
		return "findboard/content";
	}
}
