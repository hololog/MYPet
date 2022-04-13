package com.mypet.controller;

import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

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
	
	// 은혜 - 다중파일업로드
	@RequestMapping(value = "/findboard/write_findPro")
    public String requestupload2(MultipartHttpServletRequest mtfRequest) {
		//FindboardDTO 값 들고오기 
		FindboardDTO fbDTO = new FindboardDTO();
		
		fbDTO.setAddress(mtfRequest.getParameter("address1") +" "+ 
						mtfRequest.getParameter("address2") +" "+ 
						mtfRequest.getParameter("address3")); 
		fbDTO.setDetail_address(mtfRequest.getParameter("detail_address")); // address1~3 한번에 담기
		System.out.println("getAdressCheck"+ fbDTO.getAddress() + " " + fbDTO.getDetail_address()); //체크 
		
		fbDTO.setContent(mtfRequest.getParameter("content"));
//		fbDTO.setMissing_date(request.getParameter());
		fbDTO.setNickname(mtfRequest.getParameter("nickname"));
		fbDTO.setMissing_date(new Timestamp(System.currentTimeMillis())); // 추후수정
		fbDTO.setPet_age(mtfRequest.getParameter("pet_age") + mtfRequest.getParameter("pet_age2")); // pet_age + 개월/년 한번에 담기
		System.out.println("getAgeCheck"+ fbDTO.getPet_age()); //체크
		
		fbDTO.setPet_gender(mtfRequest.getParameter("pet_gender"));
		fbDTO.setPet_name(mtfRequest.getParameter("pet_name"));
		fbDTO.setPet_type(mtfRequest.getParameter("pet_type"));
		fbDTO.setReward(Integer.parseInt(mtfRequest.getParameter("reward")));
		fbDTO.setTitle(""); // 없애기
		
		
		// 파일들고오기 
		FileDTO fileDTO = new FileDTO();

		List<MultipartFile> fileList = mtfRequest.getFiles("file");

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);
            
            UUID uid = UUID.randomUUID();
            String safeFile = uid.toString() +"_"+ originFileName;

            fileDTO.setExt(originFileName.substring(originFileName.lastIndexOf(".")));
            fileDTO.setFilename(originFileName);
            fileDTO.setSave_filename(originFileName); // safefile넣기
            fileDTO.setUpload(uploadPath);
            
            findboardService.insert_findboard(fbDTO, fileDTO);

            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "redirect:/findboard/list";
    }


	// 은혜
//	@RequestMapping(value = "/findboard/write_findPro", method = RequestMethod.POST)
//	public String write_find(MultipartHttpServletRequest request, MultipartFile file) throws Exception {
//		//FindboardDTO 값 들고오기 
//		FindboardDTO fbDTO = new FindboardDTO();
//		
//		fbDTO.setAddress(request.getParameter("address1") +" "+ 
//						request.getParameter("address2") +" "+ 
//						request.getParameter("address3")); 
//		fbDTO.setDetail_address(request.getParameter("detail_address")); // address1~3 한번에 담기
//		System.out.println(fbDTO.getAddress()); //체크 
//		
//		fbDTO.setContent(request.getParameter("content"));
////		fbDTO.setMissing_date(request.getParameter());
//		fbDTO.setNickname(request.getParameter("nickname"));
//		
//		fbDTO.setPet_age( request.getParameter("pet_age") + request.getParameter("pet_age2")); // pet_age + 개월/년 한번에 담기
//		System.out.println(fbDTO.getPet_age()); //체크
//		
//		fbDTO.setPet_gender(request.getParameter("pet_gender"));
//		fbDTO.setPet_name(request.getParameter("pet_name"));
//		fbDTO.setPet_type(request.getParameter("pet_type"));
//		fbDTO.setResult(request.getParameter("result"));
//		fbDTO.setReward(Integer.parseInt(request.getParameter("reward")));
//		fbDTO.setTitle(""); // 없애기
//		
//		//Findboard_file 값 
//		FileDTO fileDTO = new FileDTO();
//		
//		UUID uid=UUID.randomUUID();  // 범용 고유 식별자
//		
//		file = request.getFile(uploadPath)
//		String fileName=uid.toString()+"_"+file.getOriginalFilename(); // 실제 저장될 파일이름
//		String fileFullPath = uploadPath+"/"+fileName; // 파일 전체 경로 
//
//		fileDTO.setFile_num(500); //임시
//		fileDTO.setFind_board_num(500); // 임시
//		fileDTO.setBoard_code('f');
//		fileDTO.setFilename(file.getOriginalFilename()); // 원래 업로드 파일명
//		fileDTO.setSave_filename(fileName); // 실제저장파일명
//		fileDTO.setFile_upload_date(new Timestamp(System.currentTimeMillis()));
//		fileDTO.setExt(file.getOriginalFilename().split(".")[1]); // 확장자만 저장
//		
//		
//		File uploadfile = new File(uploadPath, fileName);
//		FileCopyUtils.copy(file.getBytes(), uploadfile);
//		
//		findboardService.insert_findboard(fbDTO);
//		findboardService.insert_findboard_file(fileDTO);
//		System.out.println("insert_findboard 메서드 실행");
//
//		return "redirect:/findboard/list";
//	}

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
