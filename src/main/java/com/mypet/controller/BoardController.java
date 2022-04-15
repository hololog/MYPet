package com.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import com.mypet.domain.FindcommentDTO;

import com.mypet.domain.MemberDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.BoardService;
import com.mypet.service.FindboardService;
import com.mypet.service.FindcommentService;
import com.mypet.service.MemberService;

@Controller
public class BoardController {
	
	@Inject
	public  BoardService boardService;
	
	
	@Inject
	public FindboardService findboardService;
	
	@Inject
	public FindcommentService findcommentService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/findboard/list", method = RequestMethod.GET)
	public String findboard(HttpServletRequest request, Model model) throws Exception {
		int pageSize = 5;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);

		List<FindboardDTO> findboardList = findboardService.getfindBoardList(pageDTO);
		List<FileDTO> fileList = findboardService.getfindFileList(pageDTO);

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
		model.addAttribute("fileList", fileList);
		model.addAttribute("pageDTO", pageDTO);
		
		FindboardDTO findboardDTO = findboardService.getfindBoard(1);
		List<FindcommentDTO> replyList = findcommentService.readComment(findboardDTO.getFind_board_num());
		model.addAttribute("replyList", replyList);
		
		
		
		return "findboard/list";
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
		model.addAttribute("pageDTO", pageDTO);
		
		FindboardDTO findboardDTO = findboardService.getfindBoard(1);
		List<FindcommentDTO> replyList = findcommentService.readComment(findboardDTO.getFind_board_num());
		model.addAttribute("replyList", replyList);
		
		return "findboard/listM";
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
	public String writeFreePro(BoardDTO boardDTO)throws Exception {
		boardService.write_freeBoard(boardDTO);
//		boardService.insert_freeboard_file(fileDTO);
			
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
		
//		FileDTO fileDTO=boardService.getfreefileNum(num);
		
//		fileDTO.setFilename(uploadPath);
		
		model.addAttribute("boardDTO", boardDTO);
//		model.addAttribute("fileDTO", fileDTO);
		
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
			
			
	//세히
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
	
		//세희
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
		//세히
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
		
		@RequestMapping(value = "/freedboard/write_free_filePro")
	    public String freeFilepro(MultipartHttpServletRequest mtfRequest) {
		// 파일들고오기 
			BoardDTO boardDTO = new BoardDTO();

			List<MultipartFile> fileList = mtfRequest.getFiles("file");

	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	            
	            UUID uid = UUID.randomUUID();
	            String safeFile = uid.toString() +"_"+ originFileName;

	            boardDTO.setExt(originFileName.substring(originFileName.lastIndexOf(".")));
	            boardDTO.setFilename(originFileName);
	            boardDTO.setSave_filename(originFileName); // safefile넣기
	            
	            String path = uploadPath; 
	            boardDTO.setUpload(path);
	            
	            boardService.insert_freeboard_file(boardDTO);

	            try {
	            	 File uploadfile = new File(path,safeFile);
	                 FileCopyUtils.copy(mf.getBytes(), uploadfile);
	                 
	             } catch (IllegalStateException e) {
	                 e.printStackTrace();
	             } catch (IOException e) {
	                 e.printStackTrace();
	             }
	         }

        return "redirect:/freedboard/list_free";
    }

		@RequestMapping(value="/freeboard/free_freefile", produces = "application/json; charset=utf8", method = RequestMethod.POST)
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			BoardDTO boardDTO = new BoardDTO();
	        /*
			 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
			 */
			
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String fileRoot = contextRoot+"resources/upload/";
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);	
			
			 boardService.insert_freeboard_file(boardDTO);
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", "/resources/upload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			return a;
		}
		 
		 
		 
		 
		 
		 
	}
		
		
		
		
		
		
		
		

