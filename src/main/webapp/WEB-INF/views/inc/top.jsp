<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />

<!-- header 시작 -->
<header class="fixed-top bg-white main-header">
  <!-- 로고 + 로그인/회원가입 버튼 -->

<!--   <div class="row py-3 mx-3"> -->
<!--     <div class="col-4"></div> -->
<!--     <div class="col-4 d-flex justify-content-center align-items-center"> -->
<!--       <h1> -->
<%--         <a href="${pageContext.request.contextPath }/main"> --%>
<!--           <i class="bi bi-emoji-smile">MyPet</i> -->
<!--         </a> -->
<!--       </h1> -->
<!--     </div> -->
<!--     로그인시 메뉴변화 -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${ empty sessionScope.email}"> --%>
<!-- 			<div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2"> -->
<!-- 	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#login-modal">로그인</a> -->
<!-- 	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#signup-modal">회원가입</a> -->
<!-- 		 	</div> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2"> -->
<%-- 				<span>${sessionScope.nickname }님 반갑습니다.</span> --%>
<%-- 	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/mypage/myinfo">마이페이지</a> --%>
<%-- 	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/member/logout">로그아웃</a> --%>
<!-- 		 	</div> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose>     --%>
	
<!--   </div> -->

  <!-- 네이게이션바 -->
  <nav class="navbar navbar-expand-lg navbar-light">
  	
    <div class="container">
    <!-- 로그인시 메뉴변화 -->


      <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
      </button>
          <div class="col-3 logo"><a href="${pageContext.request.contextPath }/main">
          <img src="${pageContext.request.contextPath }/resources/img/New_logo.jpg" style="width:40%" alt="Logo" id="Logo">
        </a>
        </div>
      <div
          class="collapse navbar-collapse"
          id="navbarNav"
          style="justify-content: space-evenly">
          <div class="navbar-nav px-5 col-md-12 nav justify-content-around">
              <a class="nav-link" id="nav-fboard-ksk" href="${pageContext.request.contextPath }/findboard/list">실종공고</a>
              <!-- 드롭다운메뉴 시작 -->
              <div class="dropdown">
                <a class="nav-link dropdown-toggle" id="dropdownMenu" data-bs-toggle="dropdown" aria-expanded="false">
                  게시판
                </a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                  
                  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/freeboard/list_free">자유/나눔게시판</a></li>
                  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/reviewboard/list_review">꿀팁/입양후기</a></li>

                </ul>
              </div>
              <!-- 드롭다운메뉴 종료 -->
              <a class="nav-link" id="nav-buy-ksk" href="${pageContext.request.contextPath }/GB/GbuyMain">공동구매</a>
              <a class="nav-link" id="nav-event-ksk" href="${pageContext.request.contextPath }/notice/list_notice">공지사항</a>
              <a class="nav-link" id="nav-about-ksk" href="${pageContext.request.contextPath }/main#main-about-ksk">ABOUT US</a>
              
              	<c:choose>
		<c:when test="${ empty sessionScope.email}">
			<div class="d-flex justify-content-end align-items-center flex-wrap gap-2">
	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#login-modal">로그인</a>
	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#signup-modal">회원가입</a>
		 	</div>
		</c:when>
		<c:otherwise>
			<div class="d-flex justify-content-end align-items-center flex-wrap gap-2">
				<span>${sessionScope.nickname }님 반갑습니다.</span>
	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/mypage/myinfo">마이페이지</a>
	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
		 	</div>
		</c:otherwise>
	</c:choose>    
          </div>
      </div>
    </div>
  </nav>
</header>

<script>
$(document).ready(function(){
	//스크롤 좌표에 따라 모달창 실행-> 메인페이지로 이동(김성기)
// 	$(window).scroll(function(){
// 		if($(window).scrollTop()==900){
// 			$("#login-modal").modal('show');
// 		}
// 	});
	
	$('#floatingInput-signupEmail').focusout(function(){
		$.ajax({
			url:"${pageContext.request.contextPath }/member/memberCheck",
			data:{"email":$('#floatingInput-signupEmail').val()},
			success:function(rdata){
				if(rdata=='emailOk'){
					rdata = "사용가능한 이메일입니다.";
				} else {
					rdata = "이미 가입한 이메일입니다.";
				}
				$('.valid-email').html(rdata);
			}
		});
	});
});
</script>
<!-- 모달창 시작 -->
            <div class="modal fade py-5" tabindex="-1" role="dialog" id="login-modal" style="transition: opacity 0.5s linear;">
          
		       <div class="modal-dialog" role="document"> 
                <div class="modal-dialog" role="document">
                  <div class="modal-content rounded-5 shadow">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <!-- <h5 class="modal-title">Modal title</h5> -->
                      <div>
                         <div class="whole_modal">
                         <!-- 닫기 버튼-->
                      	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="lg_close"></button>
                    
                            <h4 class="fw-bold mb-0 title_kds">실종공고를 등록할 예정인가요?</h4>
                   
                    	</div>
                    <!-- Modal body -->       
                    <div class="modal-body p-5 pt-0">
                        <form action="${pageContext.request.contextPath }/member/loginPro" class="whole_modal" method="post">
                          <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com" name="email">
                            <label for="floatingInput">E-mail</label>
                          </div>
                          <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password" name="password">
                            <label for="floatingPassword">Password</label>
                          </div>
                          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">로그인</button>
                          <!-- 작은 안내글
                              <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                            -->
                         
                          <h8><a href="" id="idpw_kds">비밀번호찾기</a> </h8>
                          </div>  

                          <div class="singin">
                          <p>
                          <h2 class="fs-5 fw-bold mb-3">아직 회원이 아니신가요?
                           <a href="${pageContext.request.contextPath }/member/tmppwd">회원가입</a> </h2>
                          </p>
                          </div>
                          
                          <hr class="my-4">
                          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4 " type="submit">
<!--                             <svg class="bi me-1" width="16" height="16"><use xlink:href="#naver"/></svg> -->
                            네이버계정으로 로그인
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4 kakao_kds" type="submit">
<!--                             <svg class="bi me-1" width="16" height="16"><use xlink:href="#kakao"/></svg> -->
                            카카오계정으로 로그인
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4 google_kds" type="submit">
<!--                             <svg class="bi me-1" width="16" height="16"><use xlink:href="#google"/></svg> -->
                            구글계정으로 로그인
                          </button>
                          <div class="singin">
                          <p>
                          <h2 class="fs-5 fw-bold mb-3"><a href="" id="nonmem_kds">▶ 비회원으로 진행하기</a></h2>
                          </p>
                       </div>
                          </div>
                        </form>
                        <!-- Modal footer -->
                        <div class="modal-footer">
				
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             </div>
                

      
    <!-- 회원가입 -->

    
            <!-- modal 시작 -->
            <div class="modal fade py-5" tabindex="-1" role="dialog" id="signup-modal" style="transition: opacity 0.5s linear;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content rounded-5 shadow">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <!-- <h5 class="modal-title">Modal title</h5> -->
                      <div>
                         <div class="whole_modal">
                         <!-- 닫기 버튼 -->
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                         <h4 class="fw-bold mb-0 title_kds">회원가입</h4>
                    </div>
                            
                    <div class="modal-body p-5 pt-0">
                        <form class="whole_modal">
                          <div class="form-floating mb-3">
		    <input type="text" class="form-control rounded-4 id="join" placeholder="닉네임"  id="floatingNN_kds" required autofocus>
                            <label for="floatingInput">닉네임</label>
                          </div>
                          <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="floatingInput_kds" placeholder="name@example.com" autofocus>
                            <label for="floatingInput">E-mail</label>
                          </div>
                          <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="floatingPassword_kds" placeholder="비밀번호" autofocus minlength="8" maxlength="10" required>
                            <label for="floatingPassword">비밀번호</label>
                          </div>
		  <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="Ck_floatingPassword_kds" placeholder="비밀번호 재확인" minlength="8" maxlength="10" required>
                            <label for="floatingPassword">비밀번호 재확인</label>
                          </div>
                          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">회원가입</button>
                          <!-- 작은 안내글
                              <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                            -->

                          <hr class="my-4">

                          <div class="singin">
                          <p>
                          <h2 class="fs-5 fw-bold mb-3">SNS계정으로 회원가입하기</h2>
                          </p>
                          </div>
                          
                          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4 " type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#naver"/></svg>
                            네이버계정으로 회원가입
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4 kakao_kds" type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#kakao"/></svg>
                            카카오계정으로 회원가입
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4 google_kds" type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#google"/></svg>
                            구글계정으로 회원가입
                          </button>
                          
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                </div>
                

    
    <script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/css/style.css"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/script.js"></script>

    <!-- 모달창 종료 -->
<!-- header 종료 -->

$(document).mouseup(function (e){
  var LayerPopup = $(".whole_modal");
  if(LayerPopup.has(e.target).length === 0){
    LayerPopup.removeClass("show");
  }
});