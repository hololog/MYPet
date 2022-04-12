package com.mypet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.service.BookmarkService;
import com.mypet.service.FindboardService;

@Controller
public class BookmarkController {
	
	@Autowired
	public BookmarkService bookmarkService;
	
	@RequestMapping(value = "/findboard/bookmark")
	public BookmarkDTO bookmark(@RequestParam int findboardNum, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();
		
		bookmarkDTO.setFindboardNum(findboardNum);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		BookmarkService.updateBookmark(bookmarkDTO);
		
		BoardDTO boardDTO = 
		return ;
	}
} 
