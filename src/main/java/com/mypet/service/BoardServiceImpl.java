package com.mypet.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.mypet.dao.BoardDAO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.PageDTO;
import com.mypet.domain.ReplyDTO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

//write start	
	@Override
	public void write_freeBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		if(boardDAO.getfreeMaxNum()!=null) {
			 boardDTO.setFree_board_num(boardDAO.getfreeMaxNum()+1);	      
			 }else {
	        boardDTO.setFree_board_num(1);
	      }
		boardDAO.write_freeBoard(boardDTO);
	}
	
	@Override
	public void write_noticeBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		if(boardDAO.getnoticeMaxNum()!=null) {
	        boardDTO.setNotice_num(boardDAO.getnoticeMaxNum()+1);
	      }else {
	        boardDTO.setNotice_num(1);
	      }
		boardDAO.write_noticeBoard(boardDTO);
	}
	
	@Override
	public void write_reviewBoard(BoardDTO boardDTO) {
		
		boardDTO.setReadcount(0);
		boardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		
		if(boardDAO.getreviewMaxNum()!=null) {
	        boardDTO.setTip_board_num(boardDAO.getreviewMaxNum()+1);
	      }else {
	        boardDTO.setTip_board_num(1);
	      }
		boardDAO.write_reviewBoard(boardDTO);
	}
//write end
	
//List start	
	@Override
	public List<BoardDTO> getfreeBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getfreeBoardList(pageDTO);
	}
	@Override
	public List<BoardDTO> getnoticeBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getnoticeBoardList(pageDTO);
	}
	@Override
	public List<BoardDTO> getreviewBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getreviewBoardList(pageDTO);
	}
//List end
	
//count start	
	@Override
	public int getfreeBoardCount() {
		return boardDAO.getfreeBoardCount();
	}
	@Override
	public int getnoticeBoardCount() {
		return boardDAO.getnoticeBoardCount();
	}
	@Override
	public int getreviewBoardCount() {
		return boardDAO.getreviewBoardCount();
	}
//count end
	
//board start	
	@Override
	public BoardDTO getfreeBoard(int num) {
		return boardDAO.getfreeBoard(num);
	}
	
	@Override
	public BoardDTO getnoticeBoard(int num) {
		return boardDAO.getnoticeBoard(num);
	}
	
	@Override
	public BoardDTO getreviewBoard(int num) {
		return boardDAO.getreviewBoard(num);
	}
//board end
	
//readcount start	
	@Override
	public void updatefreeReadcount(int num) {
		boardDAO.updatefreeReadcount(num);
	}
	
	@Override
	public void updatenoticeReadcount(int num) {
		boardDAO.updatenoticeReadcount(num);
	}
	
	@Override
	public void updatereviewReadcount(int num) {
		boardDAO.updatereviewReadcount(num);
	}
//readcount end
	
//update start	
	@Override
	public void updatefreeBoard(BoardDTO boardDTO) {
		boardDAO.updatefreeBoard(boardDTO);
	}
	@Override
	public void updatenoticeBoard(BoardDTO boardDTO) {
		boardDAO.updatenoticeBoard(boardDTO);
	}
	@Override
	public void updatereviewBoard(BoardDTO boardDTO) {
		boardDAO.updatereviewBoard(boardDTO);
	}
//update end
	
//delete start	
	@Override
	public void deletefreeBoard(int num) {
		boardDAO.deletefreeBoard(num);
	}
	@Override
	public void deletenoticeBoard(int num) {
		boardDAO.deletenoticeBoard(num);
	}
	@Override
	public void deletereviewBoard(int num) {
		boardDAO.deletereviewBoard(num);
	}
//delete end
	
//search start	
	@Override
	public List<BoardDTO> freeListsearch(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		
		return boardDAO.freeListsearch(pageDTO);
	}

	@Override
	public int getfreeBoardCountSearch(PageDTO pageDTO) {
		return boardDAO.getfreeBoardCountSearch(pageDTO);
	}
	
	@Override
	public List<BoardDTO> noticeListsearch(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		
		return boardDAO.noticeListsearch(pageDTO);
	}

	@Override
	public int getnoticeBoardCountSearch(PageDTO pageDTO) {
		return boardDAO.getnoticeBoardCountSearch(pageDTO);
	}
	
	@Override
	public List<BoardDTO> reviewListsearch(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		
		return boardDAO.reviewListsearch(pageDTO);
	}

	@Override
	public int getreviewBoardCountSearch(PageDTO pageDTO) {
		return boardDAO.getreviewBoardCountSearch(pageDTO);
	}
	
	@Override
	public List<BoardDTO> bestfree(PageDTO pageDTO) {
		
		return boardDAO.bestfree(pageDTO);
	}
	@Override
	public List<BoardDTO> bestnotice(PageDTO pageDTO) {
		
		return boardDAO.bestnotice(pageDTO);
	}
	@Override
	public List<BoardDTO> bestreview(PageDTO pageDTO) {
		
		return boardDAO.bestreview(pageDTO);
	}

	@Override
	public BoardDTO LikeCheck(BoardDTO boardDTO) {
		return boardDAO.LikeCheck(boardDTO);
	}
//like
	@Override
	public int getfreeLike(BoardDTO boardDTO) {
		return boardDAO.getfreeLike(boardDTO);
	}
	
	@Override
	public int getnoticeLike(BoardDTO boardDTO) {
		return boardDAO.getnoticeLike(boardDTO);
	}
	
	@Override
	public int getreviewLike(BoardDTO boardDTO) {
		return boardDAO.getreviewLike(boardDTO);
	}
	

	@Override
	public List<ReplyDTO> getfreecommentList(int bnum){
		return boardDAO.getfreecommentList(bnum);
	}
	
	@Override
	 public void freecommentIn(ReplyDTO replyDTO) {
		
		if(boardDAO.getfcommentMaxNum() != null) 
			replyDTO.setComment_num(boardDAO.getfcommentMaxNum()+1);
		else replyDTO.setComment_num(1);
		//readcount, insertdate, boardnum ??????
		replyDTO.setBoard_code("??????");
		replyDTO.setC_date(new Timestamp(System.currentTimeMillis()));
		
		boardDAO.freecommentIn(replyDTO);
	}
	//review
	@Override
	public List<ReplyDTO> getreviewcommentList(int bnum){
		return boardDAO.getreviewcommentList(bnum);
	}
	
	@Override
	 public void reviewcommentIn(ReplyDTO replyDTO) {
		
		if(boardDAO.getRcommentMaxNum() != null) 
			replyDTO.setComment_num(boardDAO.getRcommentMaxNum()+1);
		else replyDTO.setComment_num(1);
		//readcount, insertdate, boardnum ??????
		replyDTO.setBoard_code("??????");
		replyDTO.setC_date(new Timestamp(System.currentTimeMillis()));
		
		boardDAO.reviewcommentIn(replyDTO);
	}
	//notice
	@Override
	public List<ReplyDTO> getnoticecommentList(int bnum){
		return boardDAO.getnoticecommentList(bnum);
	}
	
	@Override
	 public void noticecommentIn(ReplyDTO replyDTO) {
		
		if(boardDAO.getNcommentMaxNum() != null) 
			replyDTO.setComment_num(boardDAO.getNcommentMaxNum()+1);
		else replyDTO.setComment_num(1);
		//readcount, insertdate, boardnum ??????
		replyDTO.setBoard_code("??????");
		replyDTO.setC_date(new Timestamp(System.currentTimeMillis()));
		
		boardDAO.noticecommentIn(replyDTO);
	}

	
	
//	@Override
//	public void insert_freeboard_file(FileDTO fileDTO) {
//		//fileDTO
//		if(boardDAO.getFileMaxNum() != null) 
//			fileDTO.setFile_num(boardDAO.getFileMaxNum()+1);
//		else fileDTO.setFile_num(1);  
//        
//		fileDTO.setBoard_code('r');
//        fileDTO.setFile_upload_date(new Timestamp(System.currentTimeMillis()));
//        fileDTO.setFind_board_num(10000);  // ????????????
//        
//        boardDAO.insert_freeboard_file(fileDTO);
//	}


	

}
