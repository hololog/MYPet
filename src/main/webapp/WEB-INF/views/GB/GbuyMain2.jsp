<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main</title>
<!-- css스타일 적용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/GBuy.css" />
<!-- 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/203a25fbbd.js"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/main.js"></script>
</head>
<body>
	<div>
		<!-- header 시작 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- header 종료 -->
	</div>
	<!-- ------------------------------- -->
	<!-- 본문 시작-->
	<!-- ------------------------------- -->

	<div class="container">
		<h1 class="sub-title">공동구매 리스트</h1>
		<hr>
		<br>
	</div>
	<!-- 제목 종료 -->
	<!-- 게시판 -->

                <div class="container mt-3">
                    <div class="text-lg-end" style="border: 1px solid red;">
<%--  			<%String id=(String)session.getAttribute("id");	//세션값 가져오기  --%>
<%--  			%>			  --%>
			<input type="button" value="글쓰기" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyWrite'">	
			<input type="button" value="박스리스트" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyMain'">	
<%-- 			<%} %> --%>
		</div>
                  <table class="table table-hover text-center  " >
                    <thead>
                      <tr>
                        <th width="4%">번호${boardDTO.gbuy_num}</th>
                        <th width="5%">상품명${boardDTO.gbuy_subject}</th>
                        <th width="5%">목표수${boardDTO.gbuy_num}</th>
                        <th width="5%">재고수${boardDTO.gbuy_tcount}</th>
                        <th width=10%>진행상황</th>
                        <th width="5%">재품가격${boardDTO.gbuy_num}</th>
                        <th width="3%">수정하기${boardDTO.gbuy_num}</th>
                        <th width="7%">판매날짜${boardDTO.gbuy_num}</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="GDTO" items="${GbuyboardList}">
                    <tr>
                        <th>${GDTO.gbuy_num}</th>
                        <th>${GDTO.gbuy_subject}</th>
                        <th>${GDTO.gbuy_tcount}</th>
                        <th>${GDTO.gbuy_count}</th>
                        <th><div class=""style="border: 1px solid black;">
						<div class="progress-bar" id="" role="progressbar"
							style="width: ${((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100)}%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100">판매 : <fmt:formatNumber value="${(((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100))}"/> %</div>
					</div></th>
                        <th>${GDTO.gbuy_price}</th>
                        <th><input type="button" value="글수정" class="btn_GB" onclick="location.href='${pageContext.request.contextPath}/GB/GbuyUpdate?gbuy_num=${boardDTO.gbuy_num}'" ></th>
                        <th>${GDTO.gbuy_date}</th>
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
                  <!-- 다음버튼 -->
                  <div class="text-center">
                        <ul class="pagination justify-content-center" style="margin:20px 0">
                            
                               <c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/GB/GbuyMain2?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">◁</a></li>
							</c:if>
							
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/GB/GbuyMain2?pageNum=${i}"> ${i}</a></li>
							</c:forEach>
							
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/GB/GbuyMain2?pageNum=${pageDTO.startPage+pageDTO.pageBlock}"> ▷</a></li>
							</c:if>
                        </ul>
                  </div>
               </div>
	<!-- ------------------------------- -->
	<!-- 본문 종료-->
	<!-- ------------------------------- -->
	<div>
		<!-- footer 시작 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- footer 종료 -->
	</div>
	<!-- 부트스트랩 스크립트 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
</body>
</html>