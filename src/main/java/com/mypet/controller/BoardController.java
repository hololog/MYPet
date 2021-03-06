package com.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;

import com.mypet.domain.MemberDTO;
import com.mypet.domain.PageDTO;
import com.mypet.domain.ReplyDTO;
import com.mypet.service.BoardService;
import com.mypet.service.FindboardService;
import com.mypet.service.MemberService;

@Controller
public class BoardController {
	
	@Inject
	public  BoardService boardService;
	
	
	@Inject
	public FindboardService findboardService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/findboard/list", method = RequestMethod.GET)
	public String findboard(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int pageSize = 5;

		String email = (String)session.getAttribute("email");
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);

		List<FindboardDTO> findboardList = findboardService.getfindBoardList(pageDTO);
//		List<FileDTO> fileList = findboardService.getfindFileList(pageDTO);
		List<FindboardDTO> findboardListMain = findboardService.getfindBoardListMain(email);
		

		int count = findboardService.getfindBoardCount();

		int currentPage = Integer.parseInt(pageNum);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("findboardList", findboardList);
//		model.addAttribute("fileList", fileList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("findboardListMain", findboardListMain);
		
		
		
		return "/findboard/list";
	}
	
	@RequestMapping(value = "/findboard/listM", method = RequestMethod.GET)
	public String findmissboard(HttpServletRequest request, Model model) throws Exception {
		int pageSize = 5;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);

		List<FindboardDTO> findmissboardList = findboardService.getfindMissBoardList(pageDTO);
//		List<FileDTO> fileList = findboardService.getfindFileList(pageDTO);
		
		int count = findboardService.getfindMissBoardCount();

		int currentPage = Integer.parseInt(pageNum);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("findmissboardList", findmissboardList);
//		model.addAttribute("fileList", fileList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "findboard/listM";
	}
	
	@RequestMapping(value = "/freeboard/freecommentsIn", method = RequestMethod.POST)
	public String writeFreePro(HttpServletRequest Request) throws Exception {
		
		String pnum = Request.getParameter("board_num");
		int Pnum = Integer.parseInt(Request.getParameter("board_num"));
		System.out.println(pnum + "//" + Pnum);
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setBoard_num(Integer.parseInt(Request.getParameter("board_num")));
		replyDTO.setComment(Request.getParameter("content"));
		replyDTO.setC_nik(Request.getParameter("nickname"));
		boardService.freecommentIn(replyDTO);
		
		return "redirect:content_free?free_board_num="+pnum;
	}
	//notice
	@RequestMapping(value = "/notice/noticecommentsIn", method = RequestMethod.POST)
	public String writeNoticePro(HttpServletRequest Request) throws Exception {
		
		String pnum = Request.getParameter("board_num");
		int Pnum = Integer.parseInt(Request.getParameter("board_num"));
		System.out.println(pnum + "//" + Pnum);
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setBoard_num(Integer.parseInt(Request.getParameter("board_num")));
		replyDTO.setComment(Request.getParameter("content"));
		replyDTO.setC_nik(Request.getParameter("nickname"));
		boardService.noticecommentIn(replyDTO);
		
		return "redirect:content_notice?notice_num="+pnum;
	}
	//review
	@RequestMapping(value = "/reviewboard/reviewcommentsIn", method = RequestMethod.POST)
	public String writeReviewPro(HttpServletRequest Request) throws Exception {
		
		String pnum = Request.getParameter("board_num");
		int Pnum = Integer.parseInt(Request.getParameter("board_num"));
		System.out.println(pnum + "//" + Pnum);
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setBoard_num(Integer.parseInt(Request.getParameter("board_num")));
		replyDTO.setComment(Request.getParameter("content"));
		replyDTO.setC_nik(Request.getParameter("nickname"));
		boardService.reviewcommentIn(replyDTO);
		
		return "redirect:content_review?tip_board_num="+pnum;
	}
//	public String find_photo(HttpServletRequest request, Model model) throws Exception {
//		int pageSize = 5;
//
//		String pageNum = request.getParameter("pageNum");
//		if (pageNum == null) {
//			pageNum = "1";
//		}
//
//		PageDTO pageDTO = new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//
//		List<FindboardDTO> findboardList = findboardService.getfindBoardList(pageDTO);
//
//		int count = findboardService.getfindBoardCount();
//
//		int currentPage = Integer.parseInt(pageNum);
//		int pageBlock = 10;
//		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
//		int endPage = startPage + pageBlock - 1;
//		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//		if (endPage > pageCount) {
//			endPage = pageCount;
//		}
//
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("findboardList", findboardList);
//		model.addAttribute("pageDTO", pageDTO);
//	}
	
	//??????
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
		List<BoardDTO> bestfree=boardService.bestfree(pageDTO);
		
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
		
		
		
		model.addAttribute("bestfree", bestfree);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "freeboard/list_free";
	}
	//??????
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
		List<BoardDTO> bestreview=boardService.bestreview(pageDTO);
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
		model.addAttribute("bestreview", bestreview);
		
		
		return "reviewboard/list_review";
	}
	//??????
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
		List<BoardDTO> bestnotice=boardService.bestnotice(pageDTO);
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
		model.addAttribute("bestnotice", bestnotice);
		return "notice/list_notice";
	}
	//??????
	@RequestMapping(value = "/notice/write_notice", method = RequestMethod.GET)
	public String noticeWrite() {
		return "notice/write_notice";
	}
	//??????
	@RequestMapping(value = "/notice/write_noticePro", method = RequestMethod.POST)
	public String writeNoticePro(BoardDTO boardDTO) {
		
		boardService.write_noticeBoard(boardDTO);
		
		return "redirect:/notice/list_notice";
	}
	//??????
	@RequestMapping(value = "/freeboard/write_free", method = RequestMethod.GET)
	public String freeWrite() {
		return "freeboard/write_free";
	}
	//??????
	@RequestMapping(value = "/freeboard/write_freePro", method = RequestMethod.POST)
	public String writeFreePro(BoardDTO boardDTO)throws Exception {
//		FileDTO fileDTO=new FileDTO();
		boardService.write_freeBoard(boardDTO);
//		boardService.insert_freeboard_file(fileDTO);
			
		return "redirect:/freeboard/list_free";
	}
	//??????
	@RequestMapping(value = "/reviewboard/write_review", method = RequestMethod.GET)
	public String reviewWrite() {
		return "reviewboard/write_review";
	}
	
	//??????
	@RequestMapping(value = "/reviewboard/write_reviewPro", method = RequestMethod.POST)
	public String writeReviewPro(BoardDTO boardDTO) {
			
		boardService.write_reviewBoard(boardDTO);
			
		return "redirect:/reviewboard/list_review";
	}
	//??????
	@RequestMapping(value = "/reviewboard/content_review", method = RequestMethod.GET)
	public String reivewboardContent(HttpServletRequest request, Model model,HttpSession session) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		boardService.updatereviewReadcount(num);
		String email = (String)session.getAttribute("email");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setEmail(email);
		boardDTO.setTip_board_num(num);
		//????????????????????? ??????=> ????????? 1?????? / ???????????? 0??????
		int book = boardService.getreviewLike(boardDTO);
		
		boardDTO = boardService.getreviewBoard(num);
		boardDTO.setBook(book);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/content_review";
	}
	
	//??????
	@RequestMapping(value = "/notice/content_notice", method = RequestMethod.GET)
	public String noticeContent(HttpServletRequest request, Model model,HttpSession session) {
		
		int num=Integer.parseInt(request.getParameter("notice_num"));
		String email = (String)session.getAttribute("email");
		
		boardService.updatenoticeReadcount(num);
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setEmail(email);
		boardDTO.setNotice_num(num);
		//????????????????????? ??????=> ????????? 1?????? / ???????????? 0??????
		int book = boardService.getnoticeLike(boardDTO);
		
		boardDTO = boardService.getnoticeBoard(num);
		boardDTO.setBook(book);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "notice/content_notice";
	}
	//??????
	@RequestMapping(value = "/freeboard/content_free", method = RequestMethod.GET)
	public String freeContent(HttpServletRequest request, Model model, HttpSession session) {
		
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		String email = (String)session.getAttribute("email");
		
		boardService.updatefreeReadcount(num);
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setEmail(email);
		boardDTO.setFree_board_num(num);
		//????????????????????? ??????=> ????????? 1?????? / ???????????? 0??????
		int book = boardService.getfreeLike(boardDTO);
		
		boardDTO = boardService.getfreeBoard(num);
		boardDTO.setBook(book);
		
		FileDTO fileDTO=new FileDTO();
		
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("fileDTO", fileDTO);
		
		return "freeboard/content_free";
	}
	//??????
	@RequestMapping(value = "/freeboard/update_free", method = RequestMethod.GET)
	public String update_free(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		
		BoardDTO boardDTO=boardService.getfreeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "freeboard/update_free";
	}
	//??????
	@RequestMapping(value = "/freeboard/updatePro_free", method = RequestMethod.POST)
	public String updatePro_free(BoardDTO boardDTO) {
		boardService.updatefreeBoard(boardDTO);
		
		return "redirect:/freeboard/list_free";
	}
	//??????
	@RequestMapping(value = "/freeboard/delete_free", method = RequestMethod.GET)
	public String free_delete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("free_board_num"));
		
		boardService.deletefreeBoard(num);
		
		
		return "redirect:/freeboard/list_free";
	}
	//??????
	@RequestMapping(value = "/reviewboard/update_review", method = RequestMethod.GET)
	public String update_review(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		
		BoardDTO boardDTO=boardService.getreviewBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "reviewboard/update_review";
	}
	//??????
	@RequestMapping(value = "/reviewboard/updatePro_review", method = RequestMethod.POST)
	public String updatePro_review(BoardDTO boardDTO) {
		boardService.updatereviewBoard(boardDTO);
		
		return "redirect:/reviewboard/list_review";
	}
	//??????
	@RequestMapping(value = "/reviewboard/delete_review", method = RequestMethod.GET)
	public String delete_review(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("tip_board_num"));
		
		boardService.deletereviewBoard(num);
		
		
		return "redirect:/reviewboard/list_review";
	}
	//??????
	@RequestMapping(value = "/notice/update_notice", method = RequestMethod.GET)
	public String update_notice(HttpServletRequest request, Model model) {
		int num=Integer.parseInt(request.getParameter("notice_num"));
		
		BoardDTO boardDTO=boardService.getnoticeBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "notice/update_notice";
	}
	//??????
	@RequestMapping(value = "/notice/updatePro_notice", method = RequestMethod.POST)
	public String updatePro_notice(BoardDTO boardDTO) {
		boardService.updatenoticeBoard(boardDTO);
		
		return "redirect:/notice/list_notice";
	}
	//??????
	@RequestMapping(value = "/notice/delete_notice", method = RequestMethod.GET)
	public String delete_notice(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("notice_num"));
		
		boardService.deletenoticeBoard(num);
		
		
		return "redirect:/notice/list_notice";
	}
	//??????
		@RequestMapping(value = "/freeboard/search_free", method = RequestMethod.GET)
		public String search_free(HttpServletRequest request, Model model) {
			
			String search=request.getParameter("search");
			String search2="%"+search+"%";
			
			int pageSize=20;
			
			String pageNum=request.getParameter("pageNum");
			
			if(pageNum==null) {
				pageNum="1";
			}
			
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setSearch(search2);
			
			List<BoardDTO> boardList=boardService.freeListsearch(pageDTO);
			
			int count=boardService.getfreeBoardCountSearch(pageDTO);
			
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
			
			return "freeboard/search_free";
		}
			
			
	//??????
		@RequestMapping(value = "/notice/search_notice", method = RequestMethod.GET)
		public String search_notice(HttpServletRequest request, Model model) {
			
			String search=request.getParameter("search");
			String search2="%"+search+"%";
			
			int pageSize=20;
			
			String pageNum=request.getParameter("pageNum");
			
			if(pageNum==null) {
				pageNum="1";
			}
			
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setSearch(search2);
			
			List<BoardDTO> boardList=boardService.noticeListsearch(pageDTO);
			
			int count=boardService.getnoticeBoardCountSearch(pageDTO);
			
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
			
			return "notice/search_notice";
		}	
	
		//??????
		@RequestMapping(value = "/reviewboard/search_review", method = RequestMethod.GET)
		public String search_review(HttpServletRequest request, Model model) {
			
			String search=request.getParameter("search");
			String search2="%"+search+"%";
			
			int pageSize=20;
			
			String pageNum=request.getParameter("pageNum");
			
			if(pageNum==null) {
				pageNum="1";
			}
			
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setSearch(search2);
			
			List<BoardDTO> boardList=boardService.reviewListsearch(pageDTO);
			
			int count=boardService.getreviewBoardCountSearch(pageDTO);
			
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
			
			return "reviewboard/search_review";
		}
		//??????
		@RequestMapping(value = "/freeboard/like_check", method = RequestMethod.POST)
		public String free_like(HttpServletRequest request,Model model) {
			int free_board_num=Integer.parseInt(request.getParameter("free_board_num").trim());
			System.out.println("aaaa");
			System.out.println(free_board_num);
			int user_id=Integer.parseInt(request.getParameter("user_id").trim());
		    BoardDTO boardDTO= new BoardDTO();
			boardDTO.setFree_board_num(free_board_num);
			boardDTO.setUser_id(user_id);
			
			model.addAttribute("boardDTO", boardDTO);
			
			boardService.LikeCheck(boardDTO);
			
			return "redirect:freeboard/like_check";
		}
		
//		@RequestMapping(value = "/freedboard/write_free_filePro")
//	    public String freeFilepro(MultipartHttpServletRequest mtfRequest) {
//		// ?????????????????? 
//			FileDTO fileDTO = new FileDTO();
//
//			List<MultipartFile> fileList = mtfRequest.getFiles("file");
//
//	        for (MultipartFile mf : fileList) {
//	            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
//	            long fileSize = mf.getSize(); // ?????? ?????????
//
//	            System.out.println("originFileName : " + originFileName);
//	            System.out.println("fileSize : " + fileSize);
//	            
//	            UUID uid = UUID.randomUUID();
//	            String safeFile = uid.toString() +"_"+ originFileName;
//
//	            fileDTO.setExt(originFileName.substring(originFileName.lastIndexOf(".")));
//	            fileDTO.setFilename(originFileName);
//	            fileDTO.setSave_filename(originFileName); // safefile??????
//	            fileDTO.setUpload(uploadPath);
//	            
//	            boardService.insert_freeboard_file(fileDTO);
//
//	            try {
//	                mf.transferTo(new File(safeFile));
//	            } catch (IllegalStateException e) {
//	                e.printStackTrace();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//        return "redirect:/freedboard/list_free";
//    }

		 
		 
		 
		 
		 
		 
		 
	}
		
		
		
		
		
		
		
		

