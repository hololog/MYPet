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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/pay.css" />	
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
<script>
$(function(){
// 	이미지 클릭시 해당 이미지 모달
	$(".imgC").click(function(){
		$(".modal").show();
		// 해당 이미지 가겨오기
		var imgSrc = $(this).children("img").attr("src");
		var imgAlt = $(this).children("img").attr("alt");
		$(".modalBox img").attr("src", imgSrc);
		$(".modalBox img").attr("alt", imgAlt);
		
		// 해당 이미지 텍스트 가져오기
		var imgTit =  $(this).children("p").text();
		$(".modalBox p").text(imgTit);
		
   // 해당 이미지에 alt값을 가져와 제목으로
		//$(".modalBox p").text(imgAlt);
	});
	
	//.modal안에 button을 클릭하면 .modal닫기
	$(".modal button").click(function(){
		$(".modal").hide();
	});
	
	//.modal밖에 클릭시 닫힘
	$(".modal").click(function (e) {
    if (e.target.className != "modal") {
      return false;
    } else {
      $(".modal").hide();
    }
  });
});
</script>
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
                    <div class="text-lg-end" >
		<c:if test="${sessionScope.nickname eq 'admin'}">
			<input type="button" value="글쓰기" class="w-btn w-btn-indigo" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyWrite'"> &nbsp;	
			<input type="button" value="박스리스트" class="w-btn w-btn-indigo" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyMain'">	
		</c:if>	
		</div>
                  <table class="table table-hover text-center  " style="margin: auto;" >
                    <thead>
                      <tr>
                        <th width="4%">번호</th>
                        <th width="4%"></th>
                        <th width="5%">상품명</th>
                        <th width="5%">목표수</th>
                        <th width="5%">재고수</th>
                        <th width=10%>진행상황</th>
                        <th width="5%">제품가격</th>
		<c:if test="${sessionScope.nickname eq 'admin'}">
                        <th width="3%">수정하기</th>
                        <th width="3%">삭제하기</th>
		</c:if>
                        <th width="7%">등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="GDTO" items="${GbuyboardList}">
                    <tr>
                        <th>${GDTO.gbuy_num}</th>
                        <th class="imgC"><img style="width:90%; height:100%;" 
    							 			  src="${pageContext.request.contextPath }/resources/upload/${GDTO.gbuy_file}" >
    									 <div src="${pageContext.request.contextPath }/resources/upload/${GDTO.gbuy_file}  "></div>
                		</th>
                        <th>${GDTO.gbuy_subject}</th>
                        <th>${GDTO.gbuy_tcount}</th>
                        <th>${GDTO.gbuy_count}</th>
                        <th><div class=""style="border: 1px solid black;">
						<div class="progress-bar" id="" role="progressbar"
							style="width: ${((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100)}%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"><fmt:formatNumber value="${(((GDTO.gbuy_count/GDTO.gbuy_tcount)-1)*(-100))}"/> %</div>
					</div></th>
                        <th>${GDTO.gbuy_price}</th>
		<c:if test="${sessionScope.nickname eq 'admin'}">
                        <th><input type="button" value="글수정" class="btn_GB" onclick="location.href='${pageContext.request.contextPath}/GB/GbuyUpdate?gbuy_num=${GDTO.gbuy_num}'" ></th>
                        <th><input type="button" value="글삭제" class="btn_GB" onclick="location.href='${pageContext.request.contextPath}/GB/GbuyDelete?gbuy_num=${GDTO.gbuy_num}'" ></th>
		</c:if>
                        <th><fmt:formatDate value="${GDTO.gbuy_date}" pattern="yyyy-MM-dd"/></th>
                    </tr>
					</c:forEach> 
                    </tbody>
                  </table>
                  <hr/>
       	    <div class="modal">
			<button>&times;</button>
			<div class="modalBox">
				<img src="${pageContext.request.contextPath }/resources/upload/${GDTO.gbuy_file}" alt="${pageContext.request.contextPath }/resources/upload/${GDTO.gbuy_file}">
				<p></p>
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