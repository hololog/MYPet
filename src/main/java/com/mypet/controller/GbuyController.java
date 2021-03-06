package com.mypet.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.mypet.domain.GbuyBoardDTO;
import com.mypet.domain.PageDTO;
import com.mypet.service.GbuyBoardService;

@Controller
public class GbuyController {
   @Inject
   public  GbuyBoardService boardService;
   
   //파일경로 xml 받아옴
   @Resource(name = "uploadPath")
   private String uploadPath;

   //글작성
   @RequestMapping(value = "/GB/GbuyWrite", method = RequestMethod.GET)
   public String GbuyWtrite() {
      System.out.println("BoardController write() ");
      return "GB/GbuyWrite";
   }
   
   //글작성 디비등록
   @RequestMapping(value = "/GB/GbuyWritePro", method = RequestMethod.POST)
   public String writePro(HttpServletRequest request, MultipartFile Gbuy_file,MultipartFile Gbuy_file2)throws Exception  {
      System.out.println("GbuyWritePro");
  	  GbuyBoardDTO boardDTO=new GbuyBoardDTO();
      UUID uid=UUID.randomUUID();
      String fileName=uid.toString()+"_"+Gbuy_file.getOriginalFilename();
      String fileName2=uid.toString()+"_"+Gbuy_file2.getOriginalFilename();
      // 파일 복사 => upload폴더 파일이름
      File uploadfile=new File(uploadPath,fileName);
      FileCopyUtils.copy(Gbuy_file.getBytes(), uploadfile);
      File uploadfile2=new File(uploadPath,fileName2);
      FileCopyUtils.copy(Gbuy_file2.getBytes(), uploadfile2);
      boardDTO.setGbuy_file(fileName);
      boardDTO.setGbuy_subject(request.getParameter("Gbuy_subject"));
      boardDTO.setGbuy_tcount(Integer.parseInt(request.getParameter("Gbuy_tcount")));
      boardDTO.setGbuy_count(Integer.parseInt(request.getParameter("Gbuy_count")));
      boardDTO.setGbuy_price(Integer.parseInt(request.getParameter("Gbuy_price")));
      boardDTO.setGbuy_file2(fileName2);
      //디비작업
      // 객체생성
//      BoardService boardService=new BoardServiceImpl();
      //메서드 호출
      boardService.writeBoard(boardDTO);
      System.out.println("GbuyWritePro7");
      // /WEB-INF/views/center/write.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
      return "redirect:/GB/GbuyMain";
   }
   //메인페이지 설정
   @RequestMapping(value = "/GB/GbuyMain", method = RequestMethod.GET)
   public String GMain(HttpServletRequest request, Model model) {
      System.out.println("BoardController list(1) ");
      // 한화면에 보여줄 글개수 설정
      int pageSize=3;
      // pageNum 파라미터값 가져오기 => 없으면 1페이지 설정
      String pageNum=request.getParameter("pageNum");
      if(pageNum==null) {
         pageNum="1";
      }
      PageDTO pageDTO=new PageDTO();
      pageDTO.setPageSize(pageSize);
      pageDTO.setPageNum(pageNum);
      List<GbuyBoardDTO> GbuyboardList=boardService.getBoardList(pageDTO);
      //전체 글개수 구하기 => 디비에서 가져오기
      //int  리턴할형  getBoardCount()     메서드 정의
      //select count(*) from board
      // int count=bDAO.getBoardCount();
      int count=boardService.getBoardCount();
      int currentPage=Integer.parseInt(pageNum);
      int pageBlock=5;
      int startPage=(currentPage-1)/pageBlock*pageBlock+1;
      int endPage=startPage+pageBlock-1;
      int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
      if(endPage > pageCount){
         endPage = pageCount;
      }
      pageDTO.setCount(count);
      pageDTO.setPageBlock(pageBlock);
      pageDTO.setStartPage(startPage);
      pageDTO.setEndPage(endPage);
      pageDTO.setPageCount(pageCount);
      // 디비에서 가져온 글을 model 담아서 GbuyMain.jsp 전달
      model.addAttribute("GbuyboardList", GbuyboardList);
      model.addAttribute("pageDTO", pageDTO);
      return "GB/GbuyMain";
   }
      //상세정보페이지
      @RequestMapping(value = "/pay/product_details", method = RequestMethod.GET)
      public String product_details(HttpServletRequest request, Model model) {
         System.out.println("BoardController product_details() ");
         int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
         // num에 대한 글 가져오기
         GbuyBoardDTO boardDTO=boardService.getBoard(gbuy_num);      
         // 디비에서 가져온 글을 model 담아서 content.jsp 전달
         model.addAttribute("boardDTO", boardDTO);
         // /WEB-INF/views/center/content.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
         return "pay/product_details";
      }
      //업데이트 수정
      @RequestMapping(value = "/GB/GbuyUpdate", method = RequestMethod.GET)
      public String Gbuyupdate(HttpServletRequest request, Model model) {
         System.out.println("BoardController update() ");
         int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
         // num에 대한 글 가져오기
         GbuyBoardDTO boardDTO=boardService.getBoard(gbuy_num);
         // 디비에서 가져온 글을 model 담아서 update.jsp 전달
         model.addAttribute("boardDTO", boardDTO);
         // /WEB-INF/views/center/update.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
         return "GB/GbuyUpdate";
      }
      //업데이트 실행
      @RequestMapping(value = "/GB/GbuyUpdatePro", method = RequestMethod.GET)
      public String updatePro(GbuyBoardDTO BoardDTO) {
         System.out.println("BoardController updatePro() ");
         System.out.println(BoardDTO.getGbuy_num()); 
         //디비작업
         // 객체생성
//         BoardService boardService=new BoardServiceImpl();
         //메서드 호출
         boardService.updateGbuy_Board(BoardDTO);
         System.out.println("BoardController updatePro(2) ");
         // 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
         //    response.sendRedirect("/board/list");
         return "redirect:/GB/GbuyMain";
      }
      //글삭제
      @RequestMapping(value = "/GB/GbuyDelete", method = RequestMethod.GET)
      public String GbuyDlete(HttpServletRequest request) {
         System.out.println("BoardController delete() ");
         int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
         // num에 대한 글 삭제
         boardService.deleteGbuy_Board(gbuy_num);
         // 가상주소 로그인주소 이동 /board/list (주소줄에 주소가 바뀌면서 이동)
         //    response.sendRedirect("/board/list");
         return "redirect:/GB/GbuyMain";
      }
      //메인2//글리스트
      @RequestMapping(value = "/GB/GbuyMain2", method = RequestMethod.GET)
      public String Gbuy_Main2(HttpServletRequest request, Model model) {
         System.out.println("BoardController GbuyMain2() ");
         // 한화면에 보여줄 글개수 설정
         int pageSize=4;
         // pageNum 파라미터값 가져오기 => 없으면 1페이지 설정
         String pageNum=request.getParameter("pageNum");
         if(pageNum==null) {
            pageNum="1";
         }
         PageDTO pageDTO=new PageDTO();
         pageDTO.setPageSize(pageSize);
         pageDTO.setPageNum(pageNum);
         List<GbuyBoardDTO> GbuyboardList=boardService.getBoardList(pageDTO);
         //전체 글개수 구하기 => 디비에서 가져오기
         //int  리턴할형  getBoardCount()     메서드 정의
         //select count(*) from board
         // int count=bDAO.getBoardCount();
         int count=boardService.getBoardCount();
         int currentPage=Integer.parseInt(pageNum);
         int pageBlock=5;
         int startPage=(currentPage-1)/pageBlock*pageBlock+1;
         int endPage=startPage+pageBlock-1;
         int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
         if(endPage > pageCount){
            endPage = pageCount;
         }
         pageDTO.setCount(count);
         pageDTO.setPageBlock(pageBlock);
         pageDTO.setStartPage(startPage);
         pageDTO.setEndPage(endPage);
         pageDTO.setPageCount(pageCount);
         
         // 디비에서 가져온 글을 model 담아서 notice.jsp 전달
         model.addAttribute("GbuyboardList", GbuyboardList);
         model.addAttribute("pageDTO", pageDTO);
         // /WEB-INF/views/center/notice.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
         return "GB/GbuyMain2";
      }
      

      //pat결제 진행
      @RequestMapping(value = "/pay/pay_processing", method = RequestMethod.GET)
      public String processing(HttpServletRequest request, Model model) {
         System.out.println("GbuyController Processing() ");
         int gbuy_num=Integer.parseInt(request.getParameter("gbuy_num"));
         int final_price=Integer.parseInt(request.getParameter("final_price")) ;
         int final_qty=Integer.parseInt(request.getParameter("final_qty")) ;
         System.out.println("GbuyController Processing()1 ");
         // num에 대한 글 가져오기
         System.out.println(gbuy_num);
         GbuyBoardDTO boardDTO=boardService.getBoard(gbuy_num);
         // 디비에서 가져온 글을 model 담아서 update.jsp 전달
         System.out.println("GbuyController Processing()2 ");
         model.addAttribute("boardDTO", boardDTO);
         model.addAttribute("final_price", final_price);
         model.addAttribute("final_qty", final_qty);
         System.out.println("GbuyController Processing()3 ");
         // /WEB-INF/views/center/update.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
         return "pay/pay_processing";
      }
      
      
      //pay결제 완료
      @RequestMapping(value = "/pay/pay_processingPro", method = RequestMethod.POST)
      public String pay_processingPro(GbuyBoardDTO boardDTO)  {
         System.out.println("pay_processingPro()");
        
         //메서드 호출
         boardService.Pay_writeBoard(boardDTO);
         boardService.updateGbuy_Board2(boardDTO);
         
         
         
         System.out.println("pay_processingPro1()");
         // /WEB-INF/views/center/write.jsp 이동(주소줄에 주소가 안바뀌면서 이동)
         return "redirect:/GB/GbuyMain";
         
      }//    
}