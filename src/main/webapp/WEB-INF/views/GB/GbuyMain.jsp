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
		<div class="LK_rt text-lg-end" style="border: 1px solid red;">
			<input type="button" value="글쓰기" class="btnbtn-outline-primary" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyWrite'">	
		</div>
		<!--상품-->
<c:forEach var="bDTO" items="">
		<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="LK_end"></div>
			<strong class="d-inline-block mb-2 text-success">목표수 : </strong>
			<div class="col-6 p-4 d-flex flex-column position-static">
				<h3 class="mb-0"></h3>	//상품명
				<div class="mb-1 text-muted"></div> //간략설명
				<p>가격 : </p>
				<br>
				<p>
				<button class="btn btn-primary btn-lg" type="button"
						onclick="location.href='${pageContext.request.contextPath }/GB/결제페이지?num='">
						즉시구매</button>
				<button class="btn btn-primary btn-lg" type="button" 
						onclick="location.href='${pageContext.request.contextPath }/GB/상품상세페이지?num='">
						상세정보</button>
				</p>

				<div class="col-md-8">
					<div class="LK_ba">
						<div class="progress-bar" id="LK_ba" role="progressbar"
							style="width: %" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100">목표수량 %</div>
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
		<!--지난상품커버-->
		<div class="container">
			<h1 class="sub-title"></h1>
			<hr>
			<br>
		</div>
		<!--지난상품-->
		<div
			class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="LK_end"></div>
			<div class="col-6 p-4 d-flex flex-column position-static">
				<strong class="d-inline-block mb-2 text-success">Design</strong>
				<h3 class="mb-0">펫먹이</h3>
				<div class="mb-1 text-muted">달달맛맛좋은 사료사료 맛쪼니</div>
				<p>목표수량: 1000EA</p>
				<p>가격 : 10000원</p>
				<br>
				<p>
					<button class="btn btn-primary btn-lg" type="button">즉시구매</button>
					<button class="btn btn-primary btn-lg" type="button">상세정보</button>
				</p>
				<div class="col-md-8">
					<div class="LK_ba">
						<div class="progress-bar" id="LK_ba" role="progressbar"
							style="width: 50%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100">목표수량 12%</div>
					</div>
				</div>
			</div>
			<div class="col-6 d-none d-lg-block">
				<svg class="bd-placeholder-img" width="600" height="450"
					xmlns="http://www.w3.org/2000/svg" role="img"
					aria-label="Placeholder: Thumbnail"
					preserveaspectratio="xMidYMid slice" focusable="false">
                            <title>Placeholder</title><rect width="100%"
						height="100%" fill="#55595c" />
                            <text x="44%" y="50%" fill="#eceeef"
						dy=".3em">이미지창</text>
                        </svg>
			</div>
		</div>
<div id="page_control">
<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }"><a href="${pageContext.request.contextPath }/GB/Gbuy?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">이전</a></c:if>
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"><a href="${pageContext.request.contextPath }/GB/Gbuy?pageNum=${i}">${i} </a></c:forEach>
<c:if test="${pageDTO.endPage < pageDTO.pageCount }"><a href="${pageContext.request.contextPath }/GB/Gbuy?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">다음</a></c:if>
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