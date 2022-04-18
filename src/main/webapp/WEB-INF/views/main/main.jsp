<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Main</title>
<!-- css스타일 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
<!-- 부트스트랩 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/203a25fbbd.js" crossorigin="anonymous"></script>
<!-- JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" defer src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<script type="text/javascript" defer src="${pageContext.request.contextPath }/resources/script/data.js"></script>
<!-- CSS , JS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	var email = '${sessionScope.email}';
	if(email == "" || email == null){
		$(window).scroll(function(){
			if($(window).scrollTop()==900){
				$("#login-modal").modal('show');
			}
		});
	}//스크롤 로그인 모달
});
	
$(document).ready(function(){
	//북마트 클릭이벤트
	$('.bookmark-click').click(function(){
		let no = $(this).children('.fbnum-ksk').val();
// 		console.log(no);
		//빈별표 일때
		if($(this).children('i').attr('class') === 'fa-regular fa-star fa-2x'){
			//별표 변경
			$(this).children('i').attr('class', 'fa-solid fa-star fa-2x');
			//DB에 북마크 정보 갱신
			$.ajax({
				url:"${pageContext.request.contextPath }/findboard/addBookmark",
				data:{"findboardNum" : no},
				success:function(rdata){
					if(rdata != null) {
						//게시물당 북마크수 화면표시
						$('#mark'+no).text(" "+ rdata);
					}
				}	
			});
		//꽉찬 별표 일때
		} else {
			$(this).children('i').attr('class', 'fa-regular fa-star fa-2x');
			$.ajax({
				url:"${pageContext.request.contextPath }/findboard/removeBookmark",
				data:{"findboardNum" : no},
				success:function(rdata){
					if(rdata != null) {
						$('#mark'+no).html(" "+ rdata);
					}
				}	
			});
		}
	});
});

$(document).ready(function(){
	$("#mainSearch").autocomplete({ 
// 		source: function(request, response) {
// 			$.ajax({
// 				type: "get",
// 	            url: "/json/address",
// 	            dataType: "json",
// 	            success: function(data) {
// 	            	 response(
// 	           			 $.map(data, function(item) {
// 	           				return {
// 	                            label: item.address,   
// 	                            value: item,    
// 	           				}
// 	           			 })//
// 	         		 );//response end
// 	            }
// 			}); //end ajax
// 		},
		source: List,
		focus : function(event, ui) { 
			return false;
		},
		minLength: 2,// 최소 글자수
		delay: 100,	
	});
});

$(document).ready(function(){
	$("#displayList").hide();
	// 검색어의 길이가 바뀔 때마다 호출
	var wordLength = $(this).val().trim().length;
	if(wordLength == 0){
		$("#displayList").hide();
	} else {
		$.ajax({
			url:"/json/address",
			type:"get",
			data:{"searchWord": $("#searchWord").val()},
			dataType:"json",
			success:function(json){
				if(json.length > 0){
					// 검색된 데이터가 있는 경우
					var html = "";
					$.each(json, function(index, item){
						var word = item.word;
	                          // 검색목록들과 검색단어를 모두 소문자로 바꾼 후 검색단어가 나타난 곳의 index를 표시.
						var index = word.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
						// jaVa -> java
						var len = $("#searchWord").val().length;
						// 검색한 단어를 파랑색으로 표현
						var result = word.substr(0, index) + "<span style='color:blue;'>"+word.substr(index, len)+"</span>" + word.substr(index+len);
						html += "<span class='result' style='cursor:pointer;'>" + result + "</span><br>";
					});
					
					var input_width = $("#searchWord").css("width"); // 검색어 input 태그 width 알아오기
					$("#displayList").css({"width":input_width}); // 검색 결과의 width와 일치시키기
					$("#displayList").html(html);
					$("#displayList").show();
				}
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	           }
		});
	}
});
	
// 자동완성 목록을 클릭하면 검색하기
$(document).on('click', ".result", function(){
	var word = $(this).text();
	$("#searchWord").val(word);
	goSearch(); // 검색기능
});
</script>
</head>
<body>
	<div>
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

    <!-- ------------------------------- -->
    <!-- 본문 시작 -->
    <!-- ------------------------------- -->
    <!-- 이미지 슬라이드 시작 -->
    <section id="slider" class="carousel slide" data-bs-ride="carousel">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-inner">
        <!-- 사진1 -->
        <div class="carousel-item active">
          <img src="${pageContext.request.contextPath }/resources/img/dog4.jpg" alt="first slide" class="d-block w-100" />
        </div>
        <!-- 사진2 -->
        <div class="carousel-item">
          <img src="${pageContext.request.contextPath }/resources/img/dog6.jpg" alt="second slide" class="d-block w-100" />
          <!-- 글삽입 -->
<!--           <div class="carousel-caption"> -->
<!--             <p>설명글</p> -->
<!--           </div> -->
        </div>
        <!-- 사진3 -->
        <div class="carousel-item">
          <img src="${pageContext.request.contextPath }/resources/img/dog5.jpg" alt="third slide" class="d-block w-100" />
          <!-- 버튼삽입 -->
<!--           <div class="carousel-caption"> -->
<!--             <a class="btn btn-lg btn-primary" href="#">버튼</a> -->
<!--           </div> -->
        </div>
      </div>
      <!-- 슬라이드 쇼 끝 -->

      <!-- 슬라이드 이동버튼 -->
      <button class="carousel-control-prev" type="button" data-bs-target="#slider" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#slider" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>

      <!-- 슬라이드 이동버튼 끝 -->
      
      <!-- 슬라이더 위치 표시 -->
      <!-- <div class="carousel-indicators"> <button type="button"
                data-bs-target="#slider" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button> <button type="button" data-bs-target="#slider"
                data-bs-slide-to="1" aria-label="Slide 2"></button> <button type="button"
                data-bs-target="#slider" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div> -->
      <!-- 슬라이더 위치 표시 끝-->
    </section>
    <!-- 이미지 슬라이드 종료-->

    <!-- 검색 창 -->
    <div class="search py-3">
      <div class="container p-2 bg-white">
        <form action="${pageContext.request.contextPath }/findboard/search" method="get">
          <div class="d-flex justify-content-around">
<!--             <div class="s-box1 p-2"> -->
<!--               <input type="text" class="search-box1" placeholder="시/도" /> -->
<!--             </div> -->
<!--             <div class="vr"></div> -->
<!--             <div class="s-box2 p-2"> -->
<!--               <input type="text" class="search-box2" placeholder="시/군/구" /> -->
<!--             </div> -->
<!--             <div class="vr"></div> -->
            <div class="s-box3 p-2">
              <input type="search" id="mainSearch" name="mainSearch" class="search-box3" placeholder="주소검색 읍면동" />
            </div>
            <button type="submit" class="btn text-white" style="background-color: #3f51b5;">
              <i class="bi bi-search"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
    <!-- 검색 종료 -->
    
	<%-- 글검색 폼 --%>
<!-- 	<form name="searchFrm" style="margin-top: 20px;"> -->
<!-- 		<input type="text" id="searchWord" name="searchWord" size="100" autocomplete="off"> -->
<!-- 		<input type="hidden" style="display: none;"> -->
<!-- 		<button type="button" class="btn btn-secondary btn-sm" onclick="goSearch()">검색</button> -->
<!-- 	</form> -->
	<%-- 검색어 자동완성이 보여질 구역 --%>
<!-- 	<div id="displayList" style="border: solid 1px gray; height: 100px; overflow: auto; margin-left: 77px; margin-top; -1px; border-top: 0px;"> -->
<!-- 	</div> -->
	
    <!-- 갤러리 -->
    <section class="container">
      <div>
			<h1 class="sub-title" style="margin: 50px auto 70px;">최근공고</h1>
<!--         <h1 class="title text-center m-4 p-3" style="font-weight: bold;">최근 공고</h1> -->
        <div class="d-flex justify-content-end">
          <a href="${pageContext.request.contextPath }/findboard/list">더보기</a> 
        </div>
       	 <hr>
        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4 g-3">
         <!-- 메인에 실종공고 8개  -->
         <c:forEach var="flist" items="${findboardListMain }">
          <div class="col">
            <div class="card">
              <a href="${pageContext.request.contextPath }/findboard/list">
              	<img src="${pageContext.request.contextPath }/resources/upload/${flist.upload}" class="card-img-top" alt="실종동물사진" />
              </a>
              <c:if test="${!empty sessionScope.email }">
	              <c:choose>
	              	<c:when test="${flist.book eq 'Y' }">
	              		<a type="button" class="bookmark-click">
	              		<input type="hidden" value="${flist.find_board_num }" class="fbnum-ksk">
		              		<i class="fa-solid fa-star fa-2x" style="position: absolute; top:10px; left: 10px; color: rgba(245, 212, 22, 0.788);"></i>
		             	</a>
	              	</c:when>
	              	<c:otherwise>
	              		<a type="button" class="bookmark-click">
	              		<input type="hidden" value="${flist.find_board_num }" class="fbnum-ksk">
	              			<i class="fa-regular fa-star fa-2x" style="position: absolute; top:10px; left: 10px; color: rgba(245, 212, 22, 0.788);"></i>
	              		</a>
	              	</c:otherwise>
	              </c:choose>
              </c:if>
              <div class="card-body">
                <h5 class="card-title">
                	<c:choose>
						<c:when test="${flist.pet_type eq 0 }">개</c:when>
						<c:when test="${flist.pet_type eq 1 }">고양이</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose>/
					<c:choose>
						<c:when test="${flist.pet_gender eq 0 }">암컷</c:when>
						<c:when test="${flist.pet_gender eq 1 }">수컷</c:when>
						<c:otherwise>모름</c:otherwise>
					</c:choose>/ 
					${flist.pet_age }
                </h5>
                <p class="card-text">${flist.address } ${flist.address2 }</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div>
                    <i class="bi bi-star-fill" style="color: rgb(245, 211, 22);"></i><span id="mark${flist.find_board_num }" class="star-ksk"> ${flist.bookmark_count }</span> 
                    <i class="bi bi-chat-dots"></i> <span class="chat-ksk"> 0 </span> 
                    <i class="bi bi-eye-fill"></i> <span class="eye-ksk"> ${flist.readcount }</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
         </c:forEach>
        </div>
        <div class="d-flex mt-1 justify-content-end">
           <a href="${pageContext.request.contextPath }/findboard/list">더보기</a> 
        </div>
        <hr id="divider" />
      </div>
      
    </section>
    <!-- 갤러리 끝 -->

    <!-- 중간 캠페인 시작-->
    <section class="campaign" style="margin: 80px auto;">
      <p class="campaign-text">
        거리의 <br>
        동물들에게 <br>  
        관심을<br> 
        가져주세요
      </p>
    </section>
    <!-- 중간 캠페인 종료 -->

    <!-- 공동구매 소개 시작 -->
    <section class="container py-3">
      <h1 class="title text-start mt-3 p-3" style="font-size: 2em;">진행중인 공동구매</h1>
      <hr class="my-5">
      <div class="row">
        <!-- 가로 12등분 -->
        <div class="col-sm-5">
          <a href="${pageContext.request.contextPath }/pay/product_details"> 
         	<img
            src="https://shop-phinf.pstatic.net/20201228_290/1609112167826pkx0d_JPEG/10247995466374241_827126827.jpg?type=m510"
            class="img-thumbnail" alt="강아지 사료" />
          </a>
        </div>
        <div class="col-sm-7 p-3">
          <h3>강아지 사료</h3>
          <p>
            It is a long established fact that a reader will be distracted by the readable
            content of a page when looking at its layout. The point of using Lorem Ipsum is
            that it has a more-or-less normal distribution of letters
          </p>
          <div class="progress">
            <div class="progress-bar" style="width: 15%; background-color: #3f51b5;" > 20명</div>
            <div class="progress-bar progress-bar-striped progress-bar-animated .active bg-success" role="progressbar" style="width: 85%"></div>
          </div>
          <br>
          <a href="${pageContext.request.contextPath }/pay/product_details" class="btn">구매하러가기</a>
        </div>
      </div>
    </section>
    <!-- 공동구매 소개 종료 -->

<!--     <div class=""> -->
<!--       <p>광고</p> -->
<!--     </div> -->

    <!-- ABOUT US -->
    <section class="container py-3" id="main-about-ksk">
      <h1 class="title text-end mt-3 p-3" style="font-size: 2em;">ABOUT US</h1>
      <hr class="my-5">
      <div class="row">
        <div class="col-sm-8 p-3">
          <p>
            It is a long established fact that a reader will be distracted by the readable
            content of a page when looking at its layout. The point of using Lorem Ipsum is
            that it has a more-or-less normal distribution of letters
          </p>
        </div>
        <div class="col-sm-4">
          <img src="${pageContext.request.contextPath }/resources/img/dog2.jpg" class="img-fluid" alt="" />
        </div>
      </div>
      <p></p>
    </section>

    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

    <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  </div>
<!-- 부트스트랩 스크립트 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous">
</script>
</body>
</html>