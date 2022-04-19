package com.mypet.dao;

import java.util.List;

import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.MemberDTO;
import com.mypet.domain.MypageDTO;
import com.mypet.domain.PageDTO;

public interface MypageDAO {
	
	public MemberDTO getMember(String email);
	
	public MemberDTO updateCheck(MemberDTO memberDTO);

	public void updateMember(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);
	
	public List<MypageDTO> getmyBoardList(String email);
	
	public List<MypageDTO> getmyfind_BoardList(String email);
	
	public MemberDTO pwCheck(MemberDTO memberDTO);
	
	public void pwUpdate(MemberDTO memberDTO);

//	public void updateUimage(String email, String uimage) throws Exception;
	
	public List<FindboardDTO> getFindboardBookmarkList(PageDTO pageDTO);

	public List<FileDTO> getfindFileList(PageDTO pageDTO);
	
	public int getBookmarkCount();
}
