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
	
	//free
	@ResponseBody
	@RequestMapping(value = "freeboard/addBookmark")
	public int FaddBookmark(@RequestParam int free_board_num, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();
		//게시물 번호 저장
		bookmarkDTO.setFree_board_num(free_board_num);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//자유게시판테이블에 북마크 개수 +1,
		bookmarkService.FaddBookmarkCount(free_board_num);
		//free_like 테이블 추가
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
		
		//자유게시판테이블 북마크 개수 -1
		bookmarkService.FremoveBookmarkCount(free_board_num);
		//free_like 테이블에서 제거
		bookmarkService.FremoveBookmark(bookmarkDTO);
		
		return bookmarkService.FgetBookmarkNum(free_board_num);
	}
	
	//review
	
	@ResponseBody
	@RequestMapping(value = "reviewboard/addBookmark")
	public int RaddBookmark(@RequestParam int tip_board_num, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();
		//게시물 번호 저장
		bookmarkDTO.setTip_board_num(tip_board_num);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//자유게시판테이블에 북마크 개수 +1,
		bookmarkService.RaddBookmarkCount(tip_board_num);
		//free_like 테이블 추가
		bookmarkService.RaddBookmark(bookmarkDTO);
		
		return bookmarkService.RgetBookmarkNum(tip_board_num);
	}

	//꽉찬 북마크 클릭
	@ResponseBody
	@RequestMapping(value = "reviewboard/removeBookmark")
	public int RremoveBookmark(@RequestParam int tip_board_num, HttpSession session) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO();

		bookmarkDTO.setTip_board_num(tip_board_num);
		bookmarkDTO.setEmail((String)session.getAttribute("email"));
		
		//자유게시판테이블 북마크 개수 -1
		bookmarkService.RremoveBookmarkCount(tip_board_num);
		//free_like 테이블에서 제거
		bookmarkService.RremoveBookmark(bookmarkDTO);
		
		return bookmarkService.RgetBookmarkNum(tip_board_num);
	}
	
	//notice
	
		@ResponseBody
		@RequestMapping(value = "notice/addBookmark")
		public int NaddBookmark(@RequestParam int notice_num, HttpSession session) {
			BookmarkDTO bookmarkDTO = new BookmarkDTO();
			//게시물 번호 저장
			bookmarkDTO.setNotice_num(notice_num);
			bookmarkDTO.setEmail((String)session.getAttribute("email"));
			
			//자유게시판테이블에 북마크 개수 +1,
			bookmarkService.NaddBookmarkCount(notice_num);
			//free_like 테이블 추가
			bookmarkService.NaddBookmark(bookmarkDTO);
			
			return bookmarkService.NgetBookmarkNum(notice_num);
		}

		//꽉찬 북마크 클릭
		@ResponseBody
		@RequestMapping(value = "notice/removeBookmark")
		public int NremoveBookmark(@RequestParam int notice_num, HttpSession session) {
			BookmarkDTO bookmarkDTO = new BookmarkDTO();

			bookmarkDTO.setNotice_num(notice_num);
			bookmarkDTO.setEmail((String)session.getAttribute("email"));
			
			//자유게시판테이블 북마크 개수 -1
			bookmarkService.NremoveBookmarkCount(notice_num);
			//free_like 테이블에서 제거
			bookmarkService.NremoveBookmark(bookmarkDTO);
			
			return bookmarkService.NgetBookmarkNum(notice_num);
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
