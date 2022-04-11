package com.mypet.controller;

import java.util.List;
import java.util.UUID;
import java.beans.PropertyEditorSupport;
import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.FindcommentDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.FindboardService;
import com.mypet.service.FindcommentService;

@Controller
public class FindBoardController {

	@Inject
	public FindboardService findboardService;

	@Inject
	public FindcommentService findcommentService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

//	 경진
//	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
//	public String content_find(HttpServletRequest request, Model model) throws Exception {
//
//		List<FindcommentDTO> replyList = findcommentService.readComment(findboardDTO.getFind_board_num());
//		model.addAttribute("replyList", replyList);
//
//		return "findboard/content";
//	}

	// 은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}

	// 은혜
	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
	public String write_find(HttpServletRequest request, @RequestParam(value = "f-eh") MultipartFile file) throws Exception {
		//FindboardDTO 값 들고오기 
		FindboardDTO fbDTO = new FindboardDTO();
		
		fbDTO.setAddress(request.getParameter("address1") +" "+ 
						request.getParameter("address2") +" "+ 
						request.getParameter("address3")); 
		fbDTO.setDetail_address(request.getParameter("detail_address")); // address1~3 한번에 담기	
		
		fbDTO.setContent(request.getParameter("content"));
//		fbDTO.setMissing_date(request.getParameter());
		fbDTO.setNickname(request.getParameter("nickname"));
		
		fbDTO.setPet_age( request.getParameter("pet_age") + request.getParameter("pet_age2")); // pet_age + 개월/년 한번에 담기
		
		fbDTO.setPet_gender(request.getParameter("pet_gender"));
		fbDTO.setPet_name(request.getParameter("pet_name"));
		fbDTO.setPet_type(request.getParameter("pet_type"));
		fbDTO.setResult(request.getParameter("result"));
		fbDTO.setReward(Integer.parseInt(request.getParameter("reward")));
		fbDTO.setTitle(""); // 없애기
		
		//Findboard_file 값 
		FileDTO fileDTO = new FileDTO();
		
		UUID uid=UUID.randomUUID();  // 범용 고유 식별자
		String fileName=uid.toString()+"_"+file.getOriginalFilename(); // 실제 저장될 파일이름
		fileDTO.setFile_num(500); //임시
		fileDTO.setFind_board_num(500); // 임시
		fileDTO.setBoard_code('f');
		fileDTO.setFilename(file.getOriginalFilename()); // 원래 업로드 파일명
		fileDTO.setSave_filename(fileName); // 실제저장파일명
		fileDTO.setFile_upload_date(new Timestamp(System.currentTimeMillis()));
		fileDTO.setExt(file.getOriginalFilename().split(".")[1]); // 확장자만 저장
		
		
		File uploadfile = new File(uploadPath, fileName);
		FileCopyUtils.copy(file.getBytes(), uploadfile);
		
		findboardService.insert_findboard(fbDTO);
		findboardService.insert_findboard_file(fileDTO);
		System.out.println("insert_findboard 메서드 실행");

		return "redirect:/findboard/list";
	}

	// 은혜
//	@RequestMapping(value = "/findboard/fileupload", method = RequestMethod.POST)
//	public String fileupload(HttpServletRequest request, MultipartFile file) {
//		
//		BoardDTO boardDTO = new BoardDTO();
//		boardDTO.set
//		findboardService.fileupload(file);
//		
//		System.out.println("insert_findboard 메서드 실행");
//		return "redirect:/findboard/list";
//	}
	
//	@InitBinder
//	public void InitBinder(WebDataBinder binder) {
//		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-mm-dd");
//		
//	}
	
	// 경진
	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
	public String content_find(HttpServletRequest request, Model model) throws Exception {
		int num=Integer.parseInt(request.getParameter("find_board_num"));
		FindboardDTO findboardDTO=findboardService.getfindBoard(num);
		model.addAttribute("findboardDTO", findboardDTO);
		
		return "findboard/content";
	}
}
