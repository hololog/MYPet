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
		
		return ;
	}
	
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
