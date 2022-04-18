package com.mypet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.MypageDAO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

@Service
public class MypageServiceImple implements MypageService {

	@Inject
	private MypageDAO mypageDAO;
	
	@Override
	public void updateMember(MemberDTO memberDTO) {
		mypageDAO.updateMember(memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		mypageDAO.deleteMember(memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return mypageDAO.getMember(email);
	}
	
	@Override
	public MemberDTO updateCheck(MemberDTO memberDTO) {
		return mypageDAO.updateCheck(memberDTO);
	}

	@Override
	public MemberDTO pwCheck(MemberDTO memberDTO) {
		return mypageDAO.pwCheck(memberDTO);
	}

	@Override
	public void pwUpdate(MemberDTO memberDTO) {
		mypageDAO.pwUpdate(memberDTO);
	}
	
//	@Override
//	public void modifyUimage(String email, String uimage) throws Exception {
//		mypageDAO.updateUimage(email, uimage);
//	}

//	@Override
//	public List<BoardDTO> getmyboardlist(PageDTO pageDTO) {
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
//		return mypageDAO.getmyboardlist(pageDTO);
//	}

//	@Override
//	public int getmyBoardlistCount() {
//		return mypageDAO.getmyBoardlistCount();
//	}

//	@Override
//	public List<MypageDTO> getmyBoardList(boardDTO) {
//		System.out.println("MypageServiceImple");
//		int currentPage=Integer.parseInt(pageDTO.getPageNum());
//		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
//		int endRow=startRow+pageDTO.getPageSize()-1;
//		
//		pageDTO.setCurrentPage(currentPage);
//		pageDTO.setStartRow(startRow);
//		pageDTO.setEndRow(endRow);
//		
//		pageDTO.setStartRow(startRow-1);
//		return mypageDAO.getmyBoardList(boardDTO);

	@Override
	public List<FindboardDTO> getFindboardBookmarkList(PageDTO pageDTO) {
	System.out.println("MypageServiceImpl getFindboardBookmarkList(pageDTO)");
	
	int currentPage=Integer.parseInt(pageDTO.getPageNum());
	int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
	int endRow=startRow+pageDTO.getPageSize()-1;
	
	pageDTO.setCurrentPage(currentPage);
	pageDTO.setStartRow(startRow);
	pageDTO.setEndRow(endRow);
	
	pageDTO.setStartRow(startRow-1);
	
	
	return mypageDAO.getFindboardBookmarkList(pageDTO);
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
		
		return mypageDAO.getfindFileList(pageDTO);
	}

	@Override
	public int getBookmarkCount() {
		return mypageDAO.getBookmarkCount();
	}
	
	

}
