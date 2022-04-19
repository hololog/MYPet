package com.mypet.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.JsonArray;
import com.mypet.domain.BoardDTO;
import com.mypet.domain.FileDTO;
import com.mypet.domain.FindboardDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.FindboardService;

@Controller
public class FindBoardController {

	@Inject
	public FindboardService findboardService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/findboard/update_findPro", method = RequestMethod.POST)
	public String update_findBoardPro(HttpServletRequest mtfRequest ,FindboardDTO findboardDTO) throws Exception {
		
		int chkres = Integer.parseInt(mtfRequest.getParameter("reschk"));
		System.out.println(chkres);
		if(chkres == 1) findboardDTO.setResult(1);
		findboardDTO.setAddress(mtfRequest.getParameter("address1") +" "+ 
				mtfRequest.getParameter("address2") +" "+ 
				mtfRequest.getParameter("address3")); 
		findboardDTO.setDetail_address(mtfRequest.getParameter("detail_address")); // address1~3 한번에 담기
		
		findboardDTO.setPet_age(mtfRequest.getParameter("pet_age") + mtfRequest.getParameter("pet_age2"));
		findboardService.updatefindBoard(findboardDTO);
		
		return "redirect:/findboard/list";
	}
	
	@RequestMapping(value = "/findboard/update_find_filePro")
    public String updatefindfile(MultipartHttpServletRequest mtfRequest) {

	FileDTO fileDTO = new FileDTO();

	List<MultipartFile> fileList = mtfRequest.getFiles("file");
	System.out.println("fileList : " + fileList);
	
	String path = uploadPath; 
	for (MultipartFile mf : fileList) {
		
        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);
        
        UUID uid = UUID.randomUUID();
        String safeFile = uid.toString() +"_"+ originFileName;

        fileDTO.setExt(originFileName.substring(originFileName.lastIndexOf(".")));
        fileDTO.setFilename(originFileName);
        fileDTO.setSave_filename(safeFile); // safefile넣기
        
        fileDTO.setUpload(path +"/"+ safeFile);
        
        try {
//            mf.transferTo(new File(safeFile));
            File uploadfile = new File(path,safeFile);
            FileCopyUtils.copy(mf.getBytes(), uploadfile);
            
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        findboardService.update_findboard_file(fileDTO);
    }

    return "redirect:/findboard/list";
}
	
	@RequestMapping(value = "/findboard/delete", method = RequestMethod.GET)
	public String delete_findBoard(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("find_board_num"));
		findboardService.deletefind(num);
		System.out.println(num);
		return "findboard/list";
	}

	// 은혜
	@RequestMapping(value = "/findboard/write", method = RequestMethod.GET)
	public String write_findBoard() {
		return "findboard/write_find";
	}
	
	// 은혜
	@RequestMapping(value = "/findboard/write_findPro")
    public String requestupload2(HttpServletRequest mtfRequest) {
		System.out.println("순서 확인 : /findboard/write_findPro");
		//FindboardDTO 값 들고오기 
		FindboardDTO fbDTO = new FindboardDTO();
		fbDTO.setEmail(mtfRequest.getParameter("email"));
		fbDTO.setAddress(mtfRequest.getParameter("address1") +" "+ 
						mtfRequest.getParameter("address2") +" "+ 
						mtfRequest.getParameter("address3")); 
		fbDTO.setDetail_address(mtfRequest.getParameter("detail_address")); // address1~3 한번에 담기

		
		fbDTO.setContent(mtfRequest.getParameter("content"));
		fbDTO.setNickname(mtfRequest.getParameter("nickname"));
		System.out.println(mtfRequest.getParameter("missing_date"));
		
		fbDTO.setMissing_date(mtfRequest.getParameter("missing_date"));
		System.out.println("missing_date 입력됨");
		fbDTO.setPet_age(mtfRequest.getParameter("pet_age") + mtfRequest.getParameter("pet_age2")); // pet_age + 개월/년 한번에 담기

		
		fbDTO.setPet_gender(mtfRequest.getParameter("pet_gender"));
		fbDTO.setPet_name(mtfRequest.getParameter("pet_name"));
		fbDTO.setPet_type(mtfRequest.getParameter("pet_type"));
		fbDTO.setReward(Integer.parseInt(mtfRequest.getParameter("reward")));
		fbDTO.setContact(mtfRequest.getParameter("contact"));
		
		findboardService.insert_findboard(fbDTO);
		
	       return "redirect:/findboard/list";
		}
		
		 //은혜 - 다중파일업로드 -ajax
		@RequestMapping(value = "/findboard/write_find_filePro")
	    public String requestupload2(MultipartHttpServletRequest mtfRequest) {
			System.out.println("순서 확인 : /findboard/write_find_filePro");
		// 파일들고오기 
		FileDTO fileDTO = new FileDTO();

		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		System.out.println("fileList : " + fileList);
		
		String path = uploadPath; 
		for (MultipartFile mf : fileList) {
			
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);
            
            UUID uid = UUID.randomUUID();
            String safeFile = uid.toString() +"_"+ originFileName;

            fileDTO.setExt(originFileName.substring(originFileName.lastIndexOf(".")));
            fileDTO.setFilename(originFileName);
            fileDTO.setSave_filename(safeFile); // safefile넣기
            
            fileDTO.setUpload(path +"/"+ safeFile);
            
            try {
//                mf.transferTo(new File(safeFile));
                File uploadfile = new File(path,safeFile);
                FileCopyUtils.copy(mf.getBytes(), uploadfile);
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            findboardService.insert_findboard_file(fileDTO);
        }

        return "redirect:/findboard/list";
    }

	
//	@InitBinder
//	public void InitBinder(WebDataBinder binder) {
//		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-mm-dd");
//		
//	}
	
	
	// 경진
//	@RequestMapping(value = "/find/content", method = RequestMethod.GET)
//	public String content_find(HttpServletRequest request, Model model) throws Exception {
//		int num=Integer.parseInt(request.getParameter("find_board_num"));
//		FindboardDTO findboardDTO=findboardService.getfindBoard(num);
//		model.addAttribute("findboardDTO", findboardDTO);
//		
//		return "findboard/content";
//	}
//	
//	@RequestMapping(value = "findboard/updatePro", method = RequestMethod.POST)
//	public String updatePro_find(FindboardDTO findboardDTO) {
//		findboardService.updatefindBoard(findboardDTO);
//		
//		return "redirect:/findboard/list";
//	}
	//성기
	@RequestMapping(value = "findboard/search")
	public String searchList(HttpServletRequest req, Model model) throws Exception {
		//요청값
		String search = req.getParameter("mainSearch");
		String pageNum = req.getParameter("pageNum");
		String search2 = "%"+search+"%";
		if(pageNum == null) pageNum = "1";
		
		//페이징 변수 정의
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5;
		int pageBlock = 5;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage + pageBlock-1;
		int count = findboardService.getFindBoardSearchCount();
		int pageCount = count / pageSize +  (count % pageSize == 0 ? 0:1);
		
		if(endPage > pageCount)	endPage = pageCount;

		//DTO 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setSearch(search2);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setCount(count);
		pageDTO.setPageCount(pageCount);
		
		List<FindboardDTO> findboardSearch = findboardService.getFindSearchList(pageDTO);
		
		List<FileDTO> searchFileList = findboardService.getSearchFileList(pageDTO);

		
		model.addAttribute("findboardList", findboardSearch);
		model.addAttribute("fileList", searchFileList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "findboard/searchList";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value="/json/address", method=RequestMethod.GET)
//	public String jsonAddress(HttpServletRequest request) {
//				
//		String searchWord = request.getParameter("searchWord");
//		
//		Map<String, String> paraMap = new HashMap<>();
//		paraMap.put("searchWord", searchWord);
//		
//		List<String> wordList = findboardService.wordSearchShow(paraMap);
//		
//		JSONArray jsonArr = new JSONArray(); 
//		
//		if(wordList != null) {
//			for(String word : wordList) {
//				JSONObject jsonObj = new JSONObject();
//				jsonObj.put("word", word);			
//				jsonArr.add(jsonObj);
//			}
//		}
//		return jsonArr.toString();
//	}

}
