package com.mypet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.domain.BookmarkDTO;
import com.mypet.service.BoardService;
import com.mypet.service.BookmarkService;
import com.mypet.service.FindboardService;

@Controller
public class BookmarkController {
	
	@Autowired
	public BookmarkService bookmarkService;
	
	@Autowired
	public FindboardService findboardService;
	
	@Autowired
	public BoardService boardService;
	
	//빈 북마크 클릭
	@ResponseBody
	@RequestMapping(value = "findboard/addBookmark")
	public int addBookmark(@RequestParam int findboardNum, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();
		//게시물 번호 저장
		bookmarkDTO.setFindboardNum(findboardNum);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//실종공고테이블 북마크 개수 +1,
		bookmarkService.addBookmarkCount(findboardNum);
		//북마크 테이블 추가
		bookmarkService.addBookmark(bookmarkDTO);
		
		return bookmarkService.getBookmarkNum(findboardNum);
	}

	//꽉찬 북마크 클릭
	@ResponseBody
	@RequestMapping(value = "findboard/removeBookmark")
	public int removeBookmark(@RequestParam int findboardNum, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();

		bookmarkDTO.setFindboardNum(findboardNum);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//실종공고테이블 북마크 개수 -1
		bookmarkService.removeBookmarkCount(findboardNum);
		//북마크 테이블에서 제거
		bookmarkService.removeBookmark(bookmarkDTO);
		
		return bookmarkService.getBookmarkNum(findboardNum);
	}
	
	//세히
	@ResponseBody
	@RequestMapping(value = "freeboard/addBookmark")
	public int FaddBookmark(@RequestParam int free_board_num, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();
		//게시물 번호 저장
		bookmarkDTO.setFree_board_num(free_board_num);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//실종공고테이블 북마크 개수 +1,
		bookmarkService.FaddBookmarkCount(free_board_num);
		//북마크 테이블 추가
		bookmarkService.FaddBookmark(bookmarkDTO);
		
		return bookmarkService.FgetBookmarkNum(free_board_num);
	}

	//꽉찬 북마크 클릭
	@ResponseBody
	@RequestMapping(value = "freeboard/removeBookmark")
	public int FremoveBookmark(@RequestParam int free_board_num, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();

		bookmarkDTO.setFree_board_num(free_board_num);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//실종공고테이블 북마크 개수 -1
		bookmarkService.FremoveBookmarkCount(free_board_num);
		//북마크 테이블에서 제거
		bookmarkService.FremoveBookmark(bookmarkDTO);
		
		return bookmarkService.FgetBookmarkNum(free_board_num);
	}
	
//	@ResponseBody
//	@RequestMapping(value="/wordSearchShow", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
//	public String wordSearchShow(HttpServletRequest request) {
//				
//		String searchType = request.getParameter("searchType");
//		String searchWord = request.getParameter("searchWord");
//		
//		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("searchType", searchType);
//		paraMap.put("searchWord", searchWord);
//		
//		List<String> wordList = findboardService.wordSearchSHow(paraMap);
//		
//		JSONArray jsonArr = new JSONArray(); 
//			if(wordList != null) {
//				for(String word : wordList) {
//					JSONObject jsonObj = new JSONObject();
//					jsonObj.put("word", word);			
//					jsonArr.put(jsonObj);
//				}
//			}
//		return jsonArr.toString();
//	}
} 
