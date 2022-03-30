<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
     <!-- font awesome -->
  <script src="https://kit.fontawesome.com/203a25fbbd.js" crossorigin="anonymous"></script>
    <title>자유게시판/리스트</title>

    
    
  </head>
  <body>
	
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

        <!-- ------------------------------- -->
        <!-- 본문 시작-->
        <!-- ------------------------------- -->

        <!-- 제목 시작 -->
       <div class="container">
            <h1 class="sub-title">꿀팁 & 입양후기</h1>
            <hr>
        </div>
       <!-- 제목 종료 -->
        
        
            
       
       
              <br>
              <div>
               
                <!-- 게시판 -->
                <div class="container mt-3">
                    
                  <table class="table table-hover text-center  " >
                    <thead>
                      <tr>
                        <th width="4%">번호</th>
                        <th width="3%"> </th>
                        <th width="30%" style="text-align: start;">제목</th>
                        <th></th>
                        <th width="10%">글쓴이</th>
                        <th width="10%" style="text-align: start;">날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="bDTO" items="${boardList }">
                    <tr onclick="location.href='${pageContext.request.contextPath }/freeboard/content_free?num=${bDTO.num}'">
                        <td>${bDTO.num}</td>
                        <td style="text-align: start;"><span class="badge rounded-pill bg-primary"><i class="bi bi-megaphone"></i> Best</span></td>
                        <td style="text-align: start;">${bDTO.subject}</td>
                        <td style="text-align:end"><div>
                          <!-- 댓글수, 조회수 아이콘 -->
                          <i class="fa-regular fa-comment-dots"> 1 </i>
                          <i class="fa-regular fa-eye"> ${bDTO.readcount} </i>
                        </div></td>
                        <td>${bDTO.name}</td>
                        <td style="text-align: start;"><fmt:formatDate value="${bDTO.date}" pattern="yyyy.MM.dd"/> </td>
   							
                    </tr>
					</c:forEach> 
                   
                    </tbody>
                  </table>
                  <hr/>
                  <!-- 검색 -->
                  <div class="container w-50 ">
                    <div class="d-flex align-items-center justify-content-center ">
                        <input class="form-control w-50" type="search" placeholder="Search" aria-label="Search">
                        <button id="searchBtn" class=" flex-shrink-0 btn btn-outline-primary" type="submit">검색</button>
                    </div>
                  </div>
                  <!-- 글쓰기버튼 -->
                  <div class="col-11 d-flex justify-content-end align-items-center flex-wrap gap-2">
                    <button type="button" class="btn btn-outline-primary " onclick="location.href='${pageContext.request.contextPath }/freeboard/write_free'">글쓰기</button>
                  </div>
                  <!-- 다음버튼 -->
                  <div class="text-center">
                        <ul class="pagination justify-content-center" style="margin:20px 0">
                            
                            <c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
							<a href="${pageContext.request.contextPath }/freeboard/list_free?pageNum=${pageDTO.startPage-pageDTO.pageBlock}"><li class="page-item"><a class="page-link" href="#">◁</a></li></a>
							</c:if>
							
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
							<a href="${pageContext.request.contextPath }/freeboard/list_free?pageNum=${i}"> <li class="page-item"><a class="page-link" href="#">${i}</a></li></a>
							</c:forEach>
							
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
							<a href="${pageContext.request.contextPath }/freeboard/list_free?pageNum=${pageDTO.startPage+pageDTO.pageBlock}"> <li class="page-item"><a class="page-link" href="#">▷</a></li></a>
							</c:if>
                        </ul>
                  </div>
               </div>
           
        


        <!-- 게시판 끝 -->
        
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

         <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  </div>

  <!--스크립트 적용 -->
  <script src="js/main.js"></script>
   <!-- 스크립트5버전 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>

