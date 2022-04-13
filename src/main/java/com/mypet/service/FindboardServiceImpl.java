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
	
	@Override
	public List<FileDTO> getfindFileList(PageDTO pageDTO){
		
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		
		return findboardDAO.getfindFileList(pageDTO);
	}
	
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
	public void updatefindboard(FindboardDTO findboardDTO) {
		findboardDAO.updatefindboard(findboardDTO);
	}
	
//	public void insert_findboard(FindboardDTO findboardDTO) {
		//find_board_num 구하기; 
		//readcount, insertdate 설정
	@Override
	public void insert_findboard(FindboardDTO findboardDTO, FileDTO fileDTO) {
		
		//findboardDTO
		if(findboardDAO.getMaxNum() != null) 
			findboardDTO.setFind_board_num(findboardDAO.getMaxNum()+1);
		else findboardDTO.setFind_board_num(1);
		//readcount, insertdate, boardnum 설정
		findboardDTO.setReadcount(0);
		findboardDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
		findboardDTO.setResult(0); // 미해결
		
		findboardDAO.insert_findboard(findboardDTO);
	
//	public void write_findfile(FileDTO fileDTO) {
//		
//		fileDTO.setReadcount(0);
//		fileDTO.setInsert_date(new Timestamp(System.currentTimeMillis()));
//		
//		if(findboardDAO.getfreeMaxNum()!=null) {
//			fileDTO.setFree_board_num(findboardDAO.getfreeMaxNum()+1);	      
//			 }else {
//				 fileDTO.setfind_board_num(1);
//	      }
//		fileDTO.write_filefile(fileDTO);
//	}
	

	}
		
	
		//드래그드롭 파일업로드
//    public boolean uploadFile(MultipartFile[] uploadFiles) throws IOException {
//	        
//	        Map<String,Object>fileMap=new HashMap<String,Object>();
//	        try {
//	        for(MultipartFile multipartFile : uploadFiles) {
//	                UUID uid = UUID.randomUUID(); // 랜덤문자 만들기
//	            	String fileName= uid +"_"+multipartFile.getOriginalFilename(); // 랜덤문자_파일이름
//	                File tmp=new File(uploadPath+fileName); // 파일복사 -> upload폴더 파일이름
//	                FileCopyUtils.copy(multipartFile.getBytes(), tmp);
//	                
//	             // map 에 dto 정보담기
//	                fileMap.put("file_num", 1);
//	                fileMap.put("file_name", fileName);  
//	                fileMap.put("upload", uploadPath);
//	                fileMap.put("save_filename", multipartFile.getOriginalFilename());
//	                fileMap.put("file_upload_date", new Timestamp(System.currentTimeMillis()));
//	                fileMap.put("ext", multipartFile.getOriginalFilename().split(".")[1]);
//	                System.out.println("fileMap 저장성공? :"+fileMap);
////	                multipartFile.transferTo(tmp);
//	                
//	            }
//	                findboardDAO.insert_findboard_file(fileMap);
//
//	        } catch(Exception e){
//            	e.printStackTrace();
//            	return false;
//            	}
//	        return true;
//	    }
    
	    
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
	public void insert_findboard_file(FileDTO fileDTO) {
		//fileDTO
		if(findboardDAO.getFileMaxNum() != null) 
			fileDTO.setFile_num(findboardDAO.getFileMaxNum()+1);
		else fileDTO.setFile_num(1);  
        
		fileDTO.setBoard_code('f');
        fileDTO.setFile_upload_date(new Timestamp(System.currentTimeMillis()));
        fileDTO.setFind_board_num(10000);  // 수정하기
        
        findboardDAO.insert_findboard_file(fileDTO);
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

}
