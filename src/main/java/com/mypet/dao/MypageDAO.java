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
	
	public List<MypageDTO> getmyBoardList(String mylist);
	
	public List<MypageDTO> getmyfind_BoardList(String mylist2);
	
	public MemberDTO pwCheck(MemberDTO memberDTO);
	
	public void pwUpdate(MemberDTO memberDTO);
	
//	public void updateUimage(String email, String uimage) throws Exception;
	
	public List<FindboardDTO> getFindboardBookmarkList(String email);

	public List<FileDTO> getfindFileList(String email);
}
