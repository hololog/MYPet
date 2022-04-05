package com.mypet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		int pageSize=15;
		
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
		int pageSize=15;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList=boardService.getreviewBoardList(pageDTO);
		
		int count=boardService.getreviewBoardCount();
		
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
		
		List<BoardDTO> boardList=boardService.getnoticeBoardList(pageDTO);
		
		int count=boardService.getnoticeBoardCount();
		
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
		
		boardService.write_noticeBoard(boardDTO);
		
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
			
		boardService.write_reviewBoard(boardDTO);
			
		return "redirect:/reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/reviewboard/content_review", method = RequestMethod.GET)
	public String reivewboardContent(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		boardService.updatereviewReadcount(num);
		
		BoardDTO boardDTO=boardService.getreviewBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/content_review";
	}
	
	//세히
	@RequestMapping(value = "/notice/content_notice", method = RequestMethod.GET)
	public String noticeContent(HttpServletRequest request, Model model) {
		
		int num=Integer.parseInt(request.getParameter("notice_num"));
		boardService.updatenoticeReadcount(num);
		
		BoardDTO boardDTO=boardService.getnoticeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "notice/content_notice";
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
	//세히
	@RequestMapping(value = "/freeboard/update_free", method = RequestMethod.GET)
	public String update_free(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		
		BoardDTO boardDTO=boardService.getfreeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "freeboard/update_free";
	}
	//세히
	@RequestMapping(value = "/freeboard/updatePro_free", method = RequestMethod.POST)
	public String updatePro_free(BoardDTO boardDTO) {
		boardService.updatefreeBoard(boardDTO);
		
		return "redirect:/freeboard/list_free";
	}
	//세히
	@RequestMapping(value = "/freeboard/delete_free", method = RequestMethod.GET)
	public String free_delete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		
		boardService.deletefreeBoard(num);
		
		
		return "redirect:/freeboard/list_free";
	}
	//세히
	@RequestMapping(value = "/reviewboard/update_review", method = RequestMethod.GET)
	public String update_review(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		
		BoardDTO boardDTO=boardService.getreviewBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/update_review";
	}
	//세히
	@RequestMapping(value = "/reviewboard/updatePro_review", method = RequestMethod.POST)
	public String updatePro_review(BoardDTO boardDTO) {
		boardService.updatereviewBoard(boardDTO);
		
		return "redirect:/reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/reviewboard/delete_review", method = RequestMethod.GET)
	public String delete_review(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		
		boardService.deletereviewBoard(num);
		
		
		return "redirect:/reviewboard/list_review";
	}
	//세히
	@RequestMapping(value = "/notice/update_notice", method = RequestMethod.GET)
	public String update_notice(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("notice_num"));
		
		BoardDTO boardDTO=boardService.getnoticeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "notice/update_notice";
	}
	//세히
	@RequestMapping(value = "/notice/updatePro_notice", method = RequestMethod.POST)
	public String updatePro_notice(BoardDTO boardDTO) {
		boardService.updatenoticeBoard(boardDTO);
		
		return "redirect:/notice/list_notice";
	}
	//세히
	@RequestMapping(value = "/notice/delete_notice", method = RequestMethod.GET)
	public String delete_notice(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("notice_num"));
		
		boardService.deletenoticeBoard(num);
		
		
		return "redirect:/notice/list_notice";
	}
	//세히
		@RequestMapping(value = "/freeboard/searchList_free", method = RequestMethod.GET)
		public String searchList_free(HttpServletRequest request, Model model) {
			int pageSize=15;
			
			String pageNum=request.getParameter("pageNum");
			String search=request.getParameter("search");
			if(pageNum==null) {
				pageNum="1";
			}
			
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			
			List<BoardDTO> boardList=boardService.getfreeBoardList(pageDTO);
			
			int count=boardService.getreviewBoardCount();
			
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
			pageDTO.setSearch(search);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("pageDTO", pageDTO);
			
			
			return "freeboard/searchList_free";
		}
			
			
	//세히
	
//	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
//
//	public String getBoardList(HttpServletRequest request, Model model) throws Exception {
//
//	SearchDTO search = new SearchDTO();
//	
//	search.setSearchType(searchType);
//	
//	search.setKeyword(keyword);
//	
//	
//	
//	//전체 게시글 수
//	int pageSize=20;
//	
//	
//	
//	PageDTO pageDTO=new PageDTO();
//	pageDTO.setPageSize(pageSize);
//	pageDTO.setPageNum(pageNum);
//	int listCnt = boardService.getBoardListCnt(search);
//	
//			
//	
//	int currentPage=Integer.parseInt(pageNum);
//	int pageBlock=10;
//	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//	int endPage=startPage+pageBlock-1;
//	int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
//	if(endPage > pageCount){
//		endPage = pageCount;
//	}
//	
//	pageDTO.setCount(count);
//	pageDTO.setPageBlock(pageBlock);
//	pageDTO.setStartPage(startPage);
//	pageDTO.setEndPage(endPage);
//	pageDTO.setPageCount(pageCount);
//	
//	
//	
//	model.addAttribute("pagination", search);
//	
//	model.addAttribute("boardList", boardService.getBoardList(search));
//	
//	return "board/index";
//	
//	}




//	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
//	@ResponseBody
//	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
//		JsonObject jsonObject = new JsonObject();
//		
//        /*
//		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
//		 */
//		
//		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/";
//		
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		String a = jsonObject.toString();
//		return a;
//	}

	


}
