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
		<h1 class="sub-title">공동구매</h1>
		<hr>
		<br>
	</div>
	<!-- 제목 종료 -->
	<!--상품정보-->
	<!-- 글쓰기버튼 -->
	<div class="container" style="border: 1px solid red;">
		<div class="text-lg-end" style="border: 1px solid red;">
<%--  			<%String id=(String)session.getAttribute("id");	//세션값 가져오기  --%>
<%--  			%>			  --%>
			<input type="button" value="글쓰기" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyWrite'">	
			<input type="button" value="리스트" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyMain2'">	
<%-- 			<%} %> --%>
		</div>
		<!--상품-->
		<c:forEach var="GDTO" items="${GbuyboardList}">
		
		<div class="row g-0 border rounded overflow-hidden flex-row mb-4 shadow-sm h-250 position-relative" >
			<c:if test="${GDTO.gbuy_count == 0 }"><div class="LK_end"></div></c:if>
			<div class="col-6 p-4 d-flex flex-column position-static"  id="ba"style="border: 1px solid red;">
			<strong class="d-inline-block mb-2 text-success" id="tx1">목표수 :<c:out value="${GDTO.gbuy_tcount}"/>  </strong>
				<h3 class="tx2">${GDTO.gbuy_subject}</h3>
				<p class="tx1">가격 : ${GDTO.gbuy_price}</p>
				<p class="tx1">재고수량 : ${GDTO.gbuy_count}</p>
				<br>
				<p class="PT9">
				<button class="btn btn-primary btn-lg" type="button" 
						onclick="location.href='${pageContext.request.contextPath }/pay/product_details?gbuy_num=${GDTO.gbuy_num}'">
						상세정보</button>
				</p>
				<div class="col-12">
					<div class="LK_ba">
						<c:if test="${(GDTO.gbuy_count/GDTO.gbuy_tcount)-1!=0}">
						<div class="progress-bar" id="LK_ba" role="progressbar "
							style="width: ${((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100)}%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100">판매 : <fmt:formatNumber value="${(((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100))}"/> %
						</div>
						</c:if>
						<c:if test="${(GDTO.gbuy_count/GDTO.gbuy_tcount)-1==0}">
						<div>판매 : 0%</div>
						</c:if>
						
					</div>
				</div>
			</div>
			<div class="col-6 d-none d-lg-block">
				<svg class="bd-placeholder-img" width="600" height="450"
					xmlns="http://www.w3.org/2000/svg" role="img"
					aria-label="Placeholder: Thumbnail"
					preserveaspectratio="xMidYMid slice" focusable="false">
                     <title>Placeholder</title><rect width="100%"
						height="100%" fill="#55595c"></rect>
                     <text x="44%" y="50%" fill="#eceeef" dy=".3em">이미지창</text>
                </svg>
			</div>
		</div>
 	</c:forEach>
 			<div class="text-lg-end" style="border: 1px solid red;"> 
<%--  			<%if(id!=null){// 세션값이 있으면 글쓰기 버튼 보이기 --%>
<%--  			%>			  --%>
			<input type="button" value="글쓰기" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyWrite'">	
<%-- 			<%} %> --%>
		</div>
    	<div class="text-center">
			<ul class="pagination justify-content-center" style="margin:20px">
	        	<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
				<a><li class="page-item"><a class="btn_GB" href="${pageContext.request.contextPath }/GB/GbuyMain?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">◁</a></li></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a><li class=""><a class="btn_GB" href="${pageContext.request.contextPath }/GB/GbuyMain?pageNum=${i}">${i}</a></li></a></c:forEach>
				<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
				<a><li class="page-item"><a class="btn_GB" href="${pageContext.request.contextPath }/GB/GbuyMain?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">▷</a></li></a></c:if>
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