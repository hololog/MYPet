package com.mypet.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BoardDTO;
import com.mypet.service.BoardService;

@Controller
public class BoardController {
	
	@Inject
	public  BoardService boardService;
	
	@RequestMapping(value = "/findboard/list", method = RequestMethod.GET)
	public String findBoard() {
		return "findboard/list";
	}
	//세히
	@RequestMapping(value = "/freeboard/list_free", method = RequestMethod.GET)
	public String freeList() {
		return "freeboard/list_free";
	}
	//세히
	@RequestMapping(value = "/reviewboard/list_review", method = RequestMethod.GET)
	public String reviewList() {
		return "reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/notice/list_notice", method = RequestMethod.GET)
	public String noticeList() {
		return "notice/list_notice";
	}
	//세히
	@RequestMapping(value = "/notice/write_notice", method = RequestMethod.GET)
	public String noticeWrite() {
		return "notice/write_notice";
	}
	//세히
	@RequestMapping(value = "/notice/write_noticePro", method = RequestMethod.POST)
	public String writeNoticePro(BoardDTO boardDTO) {
		
		boardService.writeBoard(boardDTO);
		
		return "redirect:/notice/list_notice";
	}
	//세히
	@RequestMapping(value = "/freeboard/write_free", method = RequestMethod.GET)
	public String freeWrite() {
		return "freeboard/write_free";
	}
	//세히
	@RequestMapping(value = "/freeboard/write_freePro", method = RequestMethod.POST)
	public String writeFreePro(BoardDTO boardDTO) {
			
		boardService.writeBoard(boardDTO);
			
		return "redirect:/freeboard/list_free";
	}
	//세히
	@RequestMapping(value = "/reviewboard/write_review", method = RequestMethod.GET)
	public String reviewWrite() {
		return "reviewboard/write_review";
	}
	//세히
	@RequestMapping(value = "/reviewboard/write_reviewPro", method = RequestMethod.POST)
	public String writeReviewPro(BoardDTO boardDTO) {
			
		boardService.writeBoard(boardDTO);
			
		return "redirect:/reviewboard/list_review";
	}
		
}
