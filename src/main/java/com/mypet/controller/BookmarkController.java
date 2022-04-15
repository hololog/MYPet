package com.mypet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.service.BookmarkService;
import com.mypet.service.FindboardService;

@Controller
public class BookmarkController {
	
	@Autowired
	public BookmarkService bookmarkService;
	
	@Autowired
	public FindboardService findboardService;
	
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
	
//	
//	private Map<String, Object> getTargetUserAndBoard() {
//        boolean findTarget = false;
//        long boardTotal = boardRepository.count();
//        int findSize = 30;
//
//        Map<String, Object> target = new HashMap<>();
//
//        List<UserEntity> userEntities = userRepository.findAll();
//
//        for (UserEntity user : userEntities) {
//            for (int index = 0; index <= boardTotal / findSize; index += findSize) {
//                Page<BoardEntity> boardEntityPage = boardRepository.findAll(PageRequest.of(index, findSize));
//                List<BoardEntity> boardEntities = boardEntityPage.getContent().stream().filter(entity -> entity.getWriter().equals(user) == false).collect(Collectors.toList());
//                for (BoardEntity board : boardEntities) {
//                    if (goodContentsHistoryRepository.findByUserAndBoard(user, board).isPresent() == false) {
//                        target.put("targetUser", user);
//                        target.put("targetBoard", board);
//                        findTarget = true;
//                        break;
//                    }
//                }
//                if (findTarget) { break; }
//            }
//            if (findTarget) { break; }
//        }
//        return target;
//    }
} 
