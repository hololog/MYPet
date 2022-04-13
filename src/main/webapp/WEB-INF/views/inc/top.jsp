<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- header 시작 -->
<header class="fixed-top bg-white">
  <!-- 로고 + 로그인/회원가입 버튼 -->
  <div class="row py-3 mx-3">
    <div class="col-4"></div>
    <div class="col-4 d-flex justify-content-center align-items-center">
      <h1>
        <a href="${pageContext.request.contextPath }/main">
          <i class="bi bi-emoji-smile">MyPet</i>
        </a>
      </h1>
    </div>
    <!-- 로그인시 메뉴변화 -->
	<c:choose>
		<c:when test="${ empty sessionScope.email}">
			<div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2">
	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#login-modal">로그인</a>
	     		<a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#signup-modal">회원가입</a>
		 	</div>
		</c:when>
		<c:otherwise>
			<div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2">
				<span>${sessionScope.nickname }님 반갑습니다.</span>
	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/mypage/myinfo">마이페이지</a>
	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
		 	</div>
		</c:otherwise>
	</c:choose>    
	
  </div>
  <!-- 네이게이션바 -->
  <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
      <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
      </button>
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
    <!-- 로그인 -->
    <div class="modal fade py-5" tabindex="-1" role="dialog" id="login-modal" style="transition: opacity 0.5s linear;">
      <div class="modal-dialog" role="document">
        <div class="modal-content rounded-5 shadow">
          <!-- Modal Header -->
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <h2 class="fw-bold mb-0">Login</h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- Modal body -->
          <div class="modal-body p-5 pt-0">
            <form action="${pageContext.request.contextPath }/member/loginPro" method="post">
              <div class="form-floating mb-3">
<!--                 <input type="email" name="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com"> -->
                <input type="email" name="email" class="form-control rounded-4" id="floatingInput-loginEmail" placeholder="name@example.com">
                <label for="floatingInput-loginEmail" id="login-email">Email address</label>
              </div>
              <div class="form-floating mb-3">
<!--                 <input type="password" name="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password"> -->
                <input type="password" name="password" class="form-control rounded-4" id="login-pass" placeholder="Password">
                <label for="floatingPassword">Password</label>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">Login</button>
              <small class="text-muted">By clicking Login</small>
              <hr class="my-4">
              <h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
              <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"/></svg>
                Login with Twitter
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"/></svg>
                Login with Facebook
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"/></svg>
                Login with GitHub
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
      
    <!-- 회원가입 -->
    <div class="modal fade py-5" tabindex="-1" role="dialog" id="signup-modal" style="transition: opacity 0.5s linear;">
      <div class="modal-dialog" role="document">
        <div class="modal-content rounded-5 shadow">
          <!-- Modal Header -->
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <h2 class="fw-bold mb-0">sign up</h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- Modal body -->
          <div class="modal-body p-5 pt-0">
            <form action="${pageContext.request.contextPath }/member/joinPro" method="post">
              <div class="form-floating mb-3">
                <input type="email" name="email" class="form-control rounded-4" id="floatingInput-signupEmail" placeholder="name@example.com">
                <label for="floatingInput-signupEmail" id="join-email">Email address</label>
                <div class="valid-email" style="color: red"></div>
              </div>
              <div class="form-floating mb-3">
                <input type="text" name="nickname" class="form-control rounded-4" id="floatingInput-nick" placeholder="nickname">
                <label for="floatingInput-nick" id="join-nick">Nickname</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" name="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword">Password</label>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">sign up</button>
              <small class="text-muted">By clicking sign up</small>
              <hr class="my-4">
              <h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
              <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"/></svg>
                sign up with Twitter
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"/></svg>
                sign up with Facebook
              </button>
              <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4" type="submit">
                <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"/></svg>
                sign up with GitHub
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달창 종료 -->
<!-- header 종료 -->