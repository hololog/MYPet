package com.mypet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.GbuyBoardService;

@Controller
public class GbuyController {
	@Inject
	public  GbuyBoardService boardService;
	//가상주소 GB/GbuyMain
	@RequestMapping(value = "/GB/GbuyWrite", method = RequestMethod.GET)
	public String GbuyWtrite() {
		System.out.println("BoardController write() ");
		return "GB/GbuyWrite";
	}
	@RequestMapping(value = "/GB/GbuyWritePro", method = RequestMethod.POST)
	public String writePro(GbuyBoardDTO gbuyBoardDTO) {
		System.out.println("GbuyWritePro");
		boardService.writeBoard(gbuyBoardDTO);
		// /WEB-INF/views/center/write.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "redirect:/GB/GbuyMain";
	}
	@RequestMapping(value = "/GB/GbuyMain", method = RequestMethod.GET)
	public String GMain(HttpServletRequest request, Model model) {
		System.out.println("BoardController list(1) ");
		// 한화면에 보여줄 글개수 설정
		int pageSize=1;
		// pageNum 파라미터값 가져오기 => 없으면 1페이지 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		List<GbuyBoardDTO> GbuyboardList=boardService.getBoardList(pageDTO);
		//전체 글개수 구하기 => 디비에서 가져오기
		//int  리턴할형  getBoardCount() 메서드 정의
		//select count(*) from board
		// int count=bDAO.getBoardCount();
		int count=boardService.getBoardCount();

		int currentPage=Integer.parseInt(pageNum);
		int pageBlock=5;
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

		// 디비에서 가져온 글을 model 담아서 notice.jsp 전달
		model.addAttribute("GbuyboardList", GbuyboardList);
		model.addAttribute("pageDTO", pageDTO);

		// /WEB-INF/views/center/notice.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
		return "GB/GbuyMain";
	}
	// 가상주소 GB/상세페이지?num=1
		@RequestMapping(value = "/pay/product_details", method = RequestMethod.GET)
		public String product_details(HttpServletRequest request, Model model) {
			System.out.println("BoardController product_details() ");
			System.out.println("BoardController product_details(3) ");
			int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
			System.out.println("BoardController product_details(2) ");
			// num에 대한 글 가져오기
			GbuyBoardDTO boardDTO=boardService.getBoard1(gbuy_num);
			// 디비에서 가져온 글을 model 담아서 content.jsp 전달
			model.addAttribute("boardDTO", boardDTO);
			// /WEB-INF/views/center/content.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
			return "pay/product_details";
		}
		// 가상주소 GB/GbuyUpdate?num=1
		@RequestMapping(value = "/GB/GbuyUpdate", method = RequestMethod.GET)
		public String Gbuyupdate(HttpServletRequest request, Model model) {
			System.out.println("BoardController update() ");
			int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
			// num에 대한 글 가져오기
			System.out.println(gbuy_num);
			GbuyBoardDTO boardDTO=boardService.getBoard(gbuy_num);
			// 디비에서 가져온 글을 model 담아서 update.jsp 전달
			model.addAttribute("boardDTO", boardDTO);

			// /WEB-INF/views/center/update.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
			return "GB/GbuyUpdate";
		}

//		가상주소 http://localhost:8080/FunWeb/board/updatePro
		@RequestMapping(value = "/GB/GbuyUpdatePro", method = RequestMethod.GET)
		public String updatePro(GbuyBoardDTO BoardDTO) {
			System.out.println("BoardController updatePro() ");
			System.out.println(BoardDTO.getGbuy_num());
			//디비작업
			// 객체생성
//			BoardService boardService=new BoardServiceImpl();
			//메서드 호출
			boardService.updateGbuy_Board(BoardDTO);
			System.out.println("BoardController updatePro(2) ");
			// 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
			// 	response.sendRedirect("/board/list");
			return "redirect:/GB/GbuyMain";
		}
		// 가상주소 /GB/GbuyDelete?num=1
		// /board/delete  get방식
		// deleteBoard(boardDTO);
		// redirect:/board/list
		@RequestMapping(value = "/GB/GbuyDelete", method = RequestMethod.GET)
		public String GbuyDlete(HttpServletRequest request) {
			System.out.println("BoardController delete() ");
			int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
			// num에 대한 글 삭제
			boardService.deleteGbuy_Board(gbuy_num);
			// 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
			// 	response.sendRedirect("/board/list");

			return "redirect:/GB/GbuyMain";
		}



}
