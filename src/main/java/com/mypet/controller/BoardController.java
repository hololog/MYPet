package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.PageDTO;
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
	public String freeList(HttpServletRequest request, Model model) {
		int pageSize=20;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getfreeBoardList(pageDTO);
		
		int count=boardService.getfreeBoardCount();
		
		int currentPage=Integer.parseInt(pageNum);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "freeboard/list_free";
	}
	//세히
	@RequestMapping(value = "/reviewboard/list_review", method = RequestMethod.GET)
	public String reviewList(HttpServletRequest request, Model model) {
		int pageSize=20;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getfreeBoardList(pageDTO);
		
		int count=boardService.getfreeBoardCount();
		
		int currentPage=Integer.parseInt(pageNum);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/notice/list_notice", method = RequestMethod.GET)
	public String noticeList(HttpServletRequest request, Model model) {
		int pageSize=20;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getfreeBoardList(pageDTO);
		
		int count=boardService.getfreeBoardCount();
		
		int currentPage=Integer.parseInt(pageNum);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
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
		
		boardService.write_freeBoard(boardDTO);
		
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
			
		boardService.write_freeBoard(boardDTO);
			
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
			
		boardService.write_freeBoard(boardDTO);
			
		return "redirect:/reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/reviewboard/content", method = RequestMethod.GET)
	public String reivewboardContent(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("num"));
		boardService.updatefreeReadcount(num);
		
		BoardDTO boardDTO=boardService.getfreeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/content";
	}
	//세히
	@RequestMapping(value = "/notice/content_notice", method = RequestMethod.GET)
	public String noticeContent(HttpServletRequest request, Model model) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		boardService.updatefreeReadcount(num);
		
		BoardDTO boardDTO=boardService.getfreeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/content";
	}
	//세히
	@RequestMapping(value = "/freeboard/content_free", method = RequestMethod.GET)
	public String freeContent(HttpServletRequest request, Model model) {
		
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		boardService.updatefreeReadcount(num);
		
		BoardDTO boardDTO=boardService.getfreeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "freeboard/content_free";
	}
	
	//은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}
	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
	public String write_find(BoardDTO boardDTO) {
		boardService.insert_findboard(boardDTO);
		return "findboard/write_find";
	}
}
