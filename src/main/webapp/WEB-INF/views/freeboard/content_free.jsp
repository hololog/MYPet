<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--   나중에 다시 확인  -->
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <title>main</title>
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
  <script src="/resources/js/jquery-3.6.0.js"></script>
  <!-- Slick -->
  <script src="/resources/js/slick.js"></script>
  <!-- Slick CSS -->
  <link rel="stylesheet" href="css/slick.css">
  <link rel="stylesheet" href="css/slick-theme.css" />


   </head>
  <body>
	<div>
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

        <!-- ------------------------------- -->
        <!-- 본문 시작-->
        <!-- ------------------------------- -->
<br><br><br><br>
            <!-- 제목 시작 -->
            <div class="container justify-content-center">
            <input type="hidden" id="num" value="${boardDTO.free_board_num}" data-bnum="${boardDTO.free_board_num}">
                <h1 class="sub-title">상세페이지</h1>

            </div>
            <!-- 제목 종료 -->
            <hr>
            <!-- 검색창 시작 -->
            <form action="" method="get"></form>

        </div>
        <!-- 검색창 종료-->

        <!-- 수정 삭제 목록 -->
        <div class="col-11 d-flex justify-content-end align-items-center flex-wrap gap-2">
        <c:if test="${ ! empty sessionScope.nickname }">

        <c:if test="${sessionScope.nickname eq boardDTO.nickname}">
          
		            <button
		                type="button"
		                class="btn btn-outline-primary "
		                onclick="location.href='${pageContext.request.contextPath }/freeboard/update_free?free_board_num=${boardDTO.free_board_num}'">수정</button>
		            <button
		                type="button"
		                class="btn btn-outline-primary "
		                onclick='del()'>삭제</button>
		            
		                <script type="text/javascript">
			                function del() {
			                	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			                        alert("삭제"); // 하고 링크된 곳으로
			                        location.href='${pageContext.request.contextPath }/freeboard/delete_free?free_board_num=${boardDTO.free_board_num}';
			                	}else{   //취소
			                        alert("삭제를 취소하셨습니다");
			                    }
			                }   
			                	
                </script>
     		      </c:if>
        </c:if>

		              

            <button
                type="button"
                class="btn btn-outline-primary "
                onclick="location.href='${pageContext.request.contextPath }/freeboard/list_free'">목록</button>
        </div>
       
        <!-- 수정삭제 목록 버튼 끝 -->

<br>
     
        <!-- SNS버튼 시작 -->
        <div
            class="col-11 d-flex justify-content-end align-items-center flex-wrap gap-2"
            >
            <!-- 페이스북 공유 버튼 -->
           			<a href=""
						onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
						<img
						src="${pageContext.request.contextPath }/resources/img/face.png"
						title="페이스북으로 공유하기" class="sharebtn_custom" style="width: 32px;">
					</a>

					<!-- 트위터 공유 버튼 -->
					<a href=""
						onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
						<img
						src="${pageContext.request.contextPath }/resources/img/twit.png"
						title="트위터로 공유하기" class="sharebtn_custom" style="width: 32px;">
					</a>

					<!-- 카카오 스토리 공유 버튼 -->
					<a href=""
						onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;"><img
						src="${pageContext.request.contextPath }/resources/img/kakaop.jpg"
						title="카카오스토리로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
				</div>
        <!-- SNS버튼 끝 -->
        <br>
<!--         이미지 슬라이드 시작 -->
<!--         <div > -->
<!--              <div -->
<!--                 id="carouselExampleIndicators" -->
<!--                 class="carousel slide" -->
<!--                 data-bs-ride="carousel" -->
<!--                 style="width: 1500px; " -->
<!--                 >  -->
<!--             <div -->
<!--                 id="carouselExampleIndicators" -->
<!--                 class="carousel slide" -->
<!--                 data-bs-ride="carousel" -->
<!--                 > -->
<!--                 <div class="carousel-indicators"> -->
<!--                     <button -->
<!--                         type="button" -->
<!--                         data-bs-target="#carouselExampleIndicators" -->
<!--                         data-bs-slide-to="0" -->
<!--                         class="active" -->
<!--                         aria-current="true" -->
<!--                         aria-label="Slide 1"></button> -->
<!--                     <button -->
<!--                         type="button" -->
<!--                         data-bs-target="#carouselExampleIndicators" -->
<!--                         data-bs-slide-to="1" -->
<!--                         aria-label="Slide 2"></button> -->
<!--                     <button -->
<!--                         type="button" -->
<!--                         data-bs-target="#carouselExampleIndicators" -->
<!--                         data-bs-slide-to="2" -->
<!--                         aria-label="Slide 3"></button> -->
<!--                 </div> -->
<%--                 <c:forEach items="${fileDTO }"> --%>
<!--                 <div class="carousel-inner"> -->
<!--                     <div class="carousel-item active"> -->
<!--                         <img -->
<%--                             src="${fileDTO.upload }" --%>
<!--                             class="d-block w-50  img-responsive center-block" -->
<!--                             style=" margin: 0 auto; height: auto;" -->
<!--                             alt="..."> -->
                            
<!--                     </div> -->
                   
<!--                 </div> -->
<%--                 </c:forEach> --%>

<!--                 <button -->
<!--                     class="carousel-control-prev carousel-dark" -->
<!--                     type="button" -->
<!--                     data-bs-target="#carouselExampleIndicators" -->
<!--                     data-bs-slide="prev"> -->
<!--                     <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!--                     <span class="visually-hidden">Previous</span> -->
<!--                 </button> -->
<!--                 <button -->
<!--                     class="carousel-control-next carousel-dark" -->
<!--                     type="button" -->
<!--                     data-bs-target="#carouselExampleIndicators" -->
<!--                     data-bs-slide="next"> -->
<!--                     <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!--                     <span class="visually-hidden">Next</span> -->
<!--                 </button> -->

<!--             </div> -->
<!--         </div> -->
<!--         </div> -->
        <!-- 슬라이드 쇼 끝 -->

         <!-- 글 -->
         <h3 class="justify-content-center text-center font-weight-bold">${boardDTO.subject}</h3>
        <br>
        <br>
        <div class="row text-center justify-content-center">
            <div class="col-md-10 col-xl-8 col-12 " style="margin-top: 10px;">
               <table id="notice text-center border">
				<tr><td>글번호 : </td><td> ${boardDTO.free_board_num}</td></tr>
				    <tr><td>글쓴이 : </td><td> ${boardDTO.nickname}</td><td class="col-6"></td>
				     <td>작성일 : </td><td> <fmt:formatDate value="${boardDTO.insert_date}" pattern="yyyy.MM.dd"/></td></tr>
				</table>
				
				<hr>
				<br>
				<br>
				<div>글내용</div>
				<br>
				<div class="shadow-sm p-3 mb-5 bg-body rounded justify-content-center w-100" style="height:70%" ><h3>${boardDTO.content}</h3></div>
				<br><br>
            </div>
        </div>
        <!-- 글끝 -->

     
				
<!-- 	좋아요버튼 실패 -->
<%-- 		 <c:if test="${empty user_id  }"> --%>
<!-- 		 <button onclick="nolike()"> -->
<!-- 		 <i class="bi-heart " style="font-size:3rem; color: red; cursor: pointer;"></i></button> -->
  			
<!-- 			<script> -->

<!-- // 					function nolike() {  -->
						
<!-- // 					  alert("로그인해라"); -->
						
<%-- // 				  location.href = "${pageContext.request.contextPath }/main/main"; --%> --%>
						
<!-- // 						} -->
						
<!-- 	</script> -->
<%-- 		</c:if>			 --%>
			
<!--           <i class="bi-heart" style="font-size:5rem; color: red; cursor: pointer;"></i> -->
<!-- 		  <script> -->
		
<!-- //            var heart = 0;   -->
<!-- //            jQuery(function($) { -->
<!-- //         	   $('#swapHeart').on('click', function() { -->
<!-- //         	     var $el = $(this), -->
<!-- //         	       textNode = this.lastChild; -->
<!-- //         	     $el.find('span').toggleClass('glyphicon-heart glyphicon-heart-empty'); -->
<!-- //         	     $el.toggleClass('swap'); -->
<!-- //         	   }); -->
        	  
<!-- //         	 }); -->
<!-- //            function like(){ -->
<!-- //         	   $.ajax({ -->
<%-- //    				url:'${pageContext.request.contextPath }/freeboard/like_check', --%>
<!-- //    				type:'POST', -->
<!-- //    				data:{ -->
<%-- //    					"user_id":(${boardDTO.user_id}+1), --%>
<%-- //    					"free_board_num":${boardDTO.free_board_num} --%>
<!-- //    					}, -->
<!-- //    				success:function(data){ -->
<!-- //    					console.log(data); -->
<!-- //    					data = 1; -->
<!-- //    					console.log(data); -->
<!-- //    					if(rdata==1){ -->
<!-- //    						 $('i').attr('class','bi-heart-fill'); -->
<!-- //                         heart = 1 -->
<!-- //    					}else{ -->
   						
<!-- //    						  $('i').attr('class','bi-heart'); -->
<!-- //                         heart = 0 -->
<!-- //    					} -->
<!-- //    				} -->
<!-- //    			  }); -->
<!-- //          	}; -->
<!-- //         	like(); -->
<!-- //            console.log(heart); -->
<!-- //            console.log('d2'); -->
<%-- //            console.log(${pageContext.request.contextPath }); --%>
<!-- //            "user_id":$('#user_id').val(), -->
<!-- // 				"free_board_num":$('#free_board_num').val() -->
           
             
            
<!--            </script> -->
<!--            <script> -->
<!-- //            $(document).ready(function(){ -->
<!-- //            	alert("확인"); -->
<!-- //            	$.ajax{ -->
<%-- //            		url:'${pageContext.request.contextPath }/free/ajaxcomments', --%>
<!-- //            		dataType:'json', -->
<!-- //            		success:function(rdata){ -->
<!-- //            	} -->
<!-- //            	} -->
           	
<!-- //            	}); -->
<!--            </script> -->
						    <script>
					
// 						        $('i').on('click',function(){
// 						            if (heart==0 ){
// 						                $(this).attr('class','bi-heart-fill');
// 						                heart++;
						                
// 						            }else if(heart==1){
// 						                $(this).attr('class','bi-heart');
// 						                heart--;
// 						                //델리트
// 						            }
// 						        });						        	
						    </script>
                <!-- Comment form-->
                <!-- <form class="mb-4"><textarea class="form-control" rows="3"-->
                <!-- placeholder="댓글을 입력해 주세요!"></textarea>-->
                <!-- </form>-->
                <!-- 댓글수, 조회수 아이콘 -->
               
     
<!-- 		<script type="text/javascript"> -->
<!-- // 		$(function(){ -->
<!-- // 			// 추천버튼 클릭시(추천 추가 또는 추천 제거) -->
<!-- // 			$("#rec_update").click(function(){ -->
<!-- // 				$.ajax({ -->
<!-- // 					url: "/free_board/like", -->
<!-- // 	                type: "POST", -->
<!-- // 	                data: { -->
<%-- // 	                    no: ${content.board_no}, --%>
<%-- // 	                    id: '${id}' --%>
<!-- // 	                }, -->
<!-- // 	                success: function () { -->
<!-- // 				        recCount(); -->
<!-- // 	                }, -->
<!-- // 				}) -->
<!-- // 			}) -->
			
<!-- // 			// 게시글 추천수 -->
<!-- // 		    function recCount() { -->
<!-- // 				$.ajax({ -->
<!-- // 					url: "/expro/RecCount.do", -->
<!-- // 	                type: "POST", -->
<!-- // 	                data: { -->
<%-- // 	                    no: ${content.board_no} --%>
<!-- // 	                }, -->
<!-- // 	                success: function (count) { -->
<!-- // 	                	$(".rec_count").html(count); -->
<!-- // 	                }, -->
<!-- // 				}) -->
<!-- // 		    }; -->
<!-- // 		    recCount(); -->
<!-- 		</script> -->
        <!-- <div class="row">-->
        <!-- <div class="col-md-12 col-xl-8">-->
        <!-- <img class="img-fluid rounded" src="/sample/img/dog2.jpg" alt="">-->
        <!-- <h5></h5>-->
        <!-- </div>-->
        <!-- <div class="col-md-12 col-xl-4">-->

        <!-- </div>-->
        <!-- </div>-->
        <!-- <div class="row">-->
        <!-- <div class="col-md-12 col-xl-8">-->
        <!-- <h5></h5>-->
        <!-- </div>-->
        <!-- <div class="col-md-12 col-xl-4">-->

        <!-- </div>-->
        <!-- </div>-->
        <!-- <div class="row">-->
        <!-- <div class="col-md-12 col-xl-8">-->
        <!-- <img class="img-fluid rounded" src="/sample/img/dog4.jpg" alt="">-->
        <!-- <h5></h5>-->
        <!-- </div>-->
        <!-- <div class="col-md-12 col-xl-4">-->

        <!-- </div>-->
        <!-- </div>-->
        <!-- <div class="row">-->
        <!-- <div class="col-md-12 col-xl-8">-->
        <!-- <img class="img-fluid rounded" src="/sample/img/dog5.jpg" alt="">-->
        <!-- <h5></h5>-->
        <!-- </div>-->
        <!-- <div class="col-md-12 col-xl-4">-->

        <!-- </div>-->
        <!-- </div>-->
        <!-- -->
        <!-- </div>-->
        <!-- </div>-->
<!--     </div> -->
    <!-- <div id="form-commentInfo-kj">-->
    <!-- <div id="comment-count-kj">댓글 <span id="count-kj">0</span></div>-->
    <!-- <input id="comment-input-kj" placeholder="댓글을 입력해 주세요.">-->
    <!-- <button id="submit-kj">등록</button>-->
    <!-- </div>-->
    <!-- <div id=comments-kj></div>-->


     <script type="text/javascript">
       $(document).ready(function(){
     		//북마트 클릭이벤트
     		$('.bookmark-click').click(function(){
     			let no = $(this).children('.fbnum-ksk').val();
     			//빈별표 일때
     			if($(this).children('i').attr('class') === 'bi bi-heart'){
     				//별표 변경
     				$(this).children('i').attr('class', 'bi bi-heart-fill');
     				//DB에 free_like테이블과 free_board테이블에 북마크 정보 갱신
     				$.ajax({
     					url:"${pageContext.request.contextPath }/freeboard/addBookmark",
     					data:{"free_board_num" : no},
     					success:function(rdata){
     						if(rdata != null) {
     							//게시물당 북마크수 화면표시
     							$('#mark'+no).text(" "+ rdata);
     						}
     					}	
     				});
     			//꽉찬 별표 일때
     			} else {
     				$(this).children('i').attr('class', 'bi bi-heart');
     				$.ajax({
     					url:"${pageContext.request.contextPath }/freeboard/removeBookmark",
     					data:{"free_board_num" : no},
     					success:function(rdata){
     						if(rdata != null) {
     							$('#mark'+no).html(" "+ rdata);
     						}
     					}	
     				});
     			}
     		});
     	});          
       </script>
		<br>
   
   
   <section class="container mb-7 text-center">
        <div class="card bg-light" style="margin-top: 30px">
            <div class="card-body">
                <!-- Comment form-->
                <!-- <form class="mb-4"><textarea class="form-control" rows="3"-->
                <!-- placeholder="댓글을 입력해 주세요!"></textarea>-->
                <!-- </form>-->
              
				<!-- 조회수 -->
                <i class="fa-regular fa-eye"> ${boardDTO.readcount} </i>
                <!-- 좋아요 아이콘 -->
                <!-- 로그인했을때만 클릭가능  -->
                <c:choose>
					<c:when test="${!empty sessionScope.email }">
						<a type="button" class="bookmark-click">
							<input type="hidden" value="${boardDTO.free_board_num }" class="fbnum-ksk">
							<!-- 빈하트/꽉찬하트 구분 -->
							<c:choose>
								<c:when test="${boardDTO.book ne 0}">
	                            	<i class="bi bi-heart-fill" style="color: red;"></i><span id="mark${boardDTO.free_board_num }" class="star-ksk"> ${boardDTO.like_count }</span> 
								</c:when>
								<c:otherwise>
	                            	<i class="bi bi-heart" style="color: red;"></i><span id="mark${boardDTO.free_board_num }" class="star-ksk"> ${boardDTO.like_count }</span> 
								</c:otherwise>
							</c:choose>
						</a>
					</c:when>
					<c:otherwise>
                   		<i class="bi bi-heart" style="color: red;"></i><span id="mark${boardDTO.free_board_num }" class="star-ksk"> ${boardDTO.like_count }</span> 
					</c:otherwise>	                          
                </c:choose>
                          
                          
                <div class="in-line-kj">
				<div class="card bg-light" style="margin-top: 30px">
					<div class="card-body">
						<div id="comment-count" style="margin-bottom: 5px">
							댓글 <span id="count"></span>
						</div>
						
						<form action="${pageContext.request.contextPath}/freeboard/freecommentsIn" method="post">
						<input type="hidden" value="${boardDTO.free_board_num}" name="board_num">
						<input type="hidden" value="${sessionScope.nickname}" name="nickname">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="댓글을 입력해 주세요!" aria-label="Recipient's username"
								aria-describedby="button-addon2" id="com" name="content">
								<input type="text" style="display:none;"/>
							<c:if test="${empty sessionScope.nickname}">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2"
								style="background-color: white; color: #3f51b5; border-color: #3f51b5" onclick="writecom()">제출</button>
								<script>
								function writecom(){
									alert("댓글쓰기는 로그인 후 이용가능합니다.");
								}
								</script>
							</c:if>
							<c:if test="${!empty sessionScope.nickname}">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2"
								style="background-color: white; color: #3f51b5; border-color: #3f51b5">제출</button>
							</c:if>
							</div>
						</form>
						<!-- Single comment-->
						<div id="nicke">
							<!-- <div class="d-flex" >
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
								</div>
								<div class="ms-3">
									<div class="fw-bold"></div>
									
									</div> -->
									
								
									
							
							<!-- <div class="d-flex" style="padding:10px 0 10px 10px">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
							</div>
							<div class="ms-3">
							<div class="fw-bold">닉네임</div>
								찾았습니다!! 감사합니다!!
								</div>
								<div style="text-align:right">
								2022.04.17
								</div>
							</div> -->
							</div>
							</div>
							</div>
				</div>
				</div>
				</div>
			</section>

    

 <!-- 게시판 끝 -->
        
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

         <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  

<script src="js/main.js"></script>
<!-- 부트스트랩 스크립트 적용 -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous"></script>

<!-- SNS 공유용 주소 연결 JS -->
<script type="text/javascript" async="async">
var url_default_ks = "https://story.kakao.com/share?url=";
var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
var url_default_tw_txt = "https://twitter.com/intent/tweet?text=";
var url_default_tw_url = "&url=";
var url_this_page = location.href;
var url_combine_ks = url_default_ks + url_this_page;
var url_combine_fb = url_default_fb + url_this_page;
var url_combine_tw = url_default_tw_txt + document.title +
        url_default_tw_url + url_this_page;
</script>

<script>
function report() {
    var result = confirm("동물신고전화 이외의 용도로 사용하지 않음을 동의하십니까?");
    if (result) {
        window.open(
            '',
            '상세사진',
            'width=430,height=500,location=no,status=no,scrollbars=yes'
        );
    } else {
        alert("동의 후 이용가능합니다. 불법개인정보 수집은 법적 처벌대상이 될수있습니다. ");
    }
}
</script>
<script>
$(document).ready(function(){
		$.ajax({
		url:'${pageContext.request.contextPath}/free/ajaxcomments',
		data: 'free_board_num='+$('#num').val(),
		dataType:'json',
		success:function(rdata){
			$.each(rdata,function(index,item){
				$('#nicke').append("<div class='d-flex'>"+
								  "	<div class='flex-shrink-0'>"+
								  "		<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg' alt='...'>"+
								  " </div>"+
								  "	<div class='ms-3'>"+
								  "		<div class='fw-bold'>"+item.c_nik+"</div>"+item.comment.replace('`','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;')+
								  " </div>"+
								  "</div>"+
								  "<br>"
								  );
			});
		},
		error:function(er){
			alert("실패원인 : " + er);
		}
	}); 
});
</script>
 <script>
$(document).ready(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/free/ajaxcommentsfCount',
		method:'post',
		data : 'free_board_num='+$('#num').val(),
		dataType:'json',
		success:function(rdata){
			$('#count').html(rdata);
		}
	});
});
</script> 












</body>
</html>