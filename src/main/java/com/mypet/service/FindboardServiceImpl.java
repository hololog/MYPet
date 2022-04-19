package com.mypet.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.mypet.dao.FindboardDAO;
import com.mypet.domain.AddressDTO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.BookmarkDTO;
import com.mypet.domain.FileDTO;
//import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;

import lombok.Value;

@Service
public class FindboardServiceImpl implements FindboardService {

	@Inject
	private FindboardDAO findboardDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Override
	public FindboardDTO getfindBoard(int num) {
		return findboardDAO.getfindBoard(num);
	}
	
	
	
//	@Override
//	public FindboardDTO bringfindBoard(int num) {
//		return findboardDAO.bringfindBoard(num);
//	}
	
	@Override
	public int getfindBoardCount() {
		return findboardDAO.getfindBoardCount();
	}
	
	@Override
	public int getfindMissBoardCount() {
		return findboardDAO.getfindBoardCount();
	}
	
	@Override
	public List<FindboardDTO> getfindBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return findboardDAO.getfindBoardList(pageDTO);
		
	}
	
//	@Override
//	public List<FileDTO> getfindFileList(PageDTO pageDTO){
//		
//		int currentPage=Integer.parseInt(pageDTO.getPageNum());
//		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
//		int endRow=startRow+pageDTO.getPageSize()-1;
//		
//		pageDTO.setCurrentPage(currentPage);
//		pageDTO.setStartRow(startRow);
//		pageDTO.setEndRow(endRow);
//		
//		pageDTO.setStartRow(startRow-1);
//		
//		return findboardDAO.getfindFileList();
//	}
	
	@Override
	public List<FindboardDTO> getfindMissBoardList(PageDTO pageDTO) {
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return findboardDAO.getfindMissBoardList(pageDTO);
	}

	
	@Override
	public void insert_findboard(FindboardDTO findboardDTO) {
		
		if(findboardDAO.getMaxNum() != null) 
			findboardDTO.setFind_board_num(findboardDAO.getMaxNum()+1);
		else findboardDTO.setFind_board_num(1);
		//readcount, insertdate, boardnum 설정
		findboardDTO.setReadcount(0);
		findboardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		findboardDTO.setResult(0); // 미해결
		System.out.println("순서확인 service : getAdressCheck"+ findboardDTO.getAddress() + " " + findboardDTO.getDetail_address()); //체크 
		System.out.println("순서확인 service : missing_date check :" + findboardDTO.getMissing_date());
		System.out.println("순서확인 service : getAgeCheck"+ findboardDTO.getPet_age()); 
		
		findboardDAO.insert_findboard(findboardDTO);
		findboardDAO.update_board_num_forfile();
		findboardDAO.updatefilename();
		
	}
	
	@Override
	public void insert_findboard_file(FileDTO fileDTO) {
		
		if(findboardDAO.getFileMaxNum() != null) 
			fileDTO.setFile_num(findboardDAO.getFileMaxNum()+1);
		else fileDTO.setFile_num(1);  
		
		System.out.println("순서확인 service : insert_findboard_file(FileDTO fileDTO) ");
		
		fileDTO.setBoard_code('f');
        fileDTO.setFile_upload_date(new Timestamp(System.currentTimeMillis()));
        
        findboardDAO.insert_findboard_file(fileDTO);
	}
	
	@Override
	public void update_findboard_file(FileDTO fileDTO) {
		findboardDAO.update_findboard_file(fileDTO);
	}
	    
	@Override
	public List<String> getProvinceList() {
		return findboardDAO.getProvinceList();
	}
	//은혜
	@Override
	public List<String> getCityList(String province) {
		return findboardDAO.getCityList(province);
	}

	@Override
	public List<String> getTownList(AddressDTO addressDTO) {
		return findboardDAO.getTownList(addressDTO);
	}

	@Override
	public List<FindboardDTO> getfindBoardListMain() {
		return findboardDAO.getfindBoardListMain();
	}

	@Override
	public BookmarkDTO getBookmark(String findboardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FindboardDTO> getfindBoardListMain(String email) {
		return findboardDAO.getfindBoardListMain(email);
	}

	@Override
	public void updatefindBoard (FindboardDTO findboardDTO) {
		findboardDAO.updatefindBoard(findboardDTO);
	}

//	@Override
//	public List<String> wordSearchShow(Map<String, String> paraMap) {
//		return findboardDAO.wordSearchShow(paraMap);
//	}

	@Override
	public int getFindBoardSearchCount() {
		return findboardDAO.getFindBoardSearchCount();
	}
    
	@Override
	public List<FindboardDTO> getFindSearchList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
	    int endRow = startRow + pageDTO.getPageSize() - 1; 
	    
	    pageDTO.setStartRow(startRow - 1);
	    pageDTO.setEndRow(endRow);
	    
		return findboardDAO.getFindSearchList(pageDTO);
	}
	
	@Override
	public List<FileDTO> getSearchFileList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return findboardDAO.getSearchFileList(pageDTO);
	}
	
	@Override
	public void deletefind(int num) {
		findboardDAO.deletefind(num);
	}
}
