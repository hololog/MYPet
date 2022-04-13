package com.mypet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mypet.dao.MypageDAO;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

@Service
public class MypageServiceImple implements MypageService {

	@Inject
	private MypageDAO mypageDAO;
	
	@Override
	public void updateMember(MypageDTO mypageDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		mypageDAO.updateMember(mypageDTO);
	}

	@Override
	public void deleteMember(MypageDTO mypageDTO) {
		mypageDAO.deleteMember(mypageDTO);
	}

	@Override
	public MypageDTO getMember(String email) {
		return mypageDAO.getMember(email);
	}

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

	@Override
	public int getmyBoardlistCount() {
		return mypageDAO.getmyBoardlistCount();
	}

	@Override
	public List<BoardDTO> getmyBoardList(PageDTO pageDTO) {
		System.out.println("MypageServiceImple");
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		pageDTO.setStartRow(startRow-1);
		return mypageDAO.getmyBoardList(pageDTO);
	}


}