<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header 시작 -->
<header class="fixed-top bg-white">
  <!-- 로고 + 로그인/회원가입 버튼 -->
  <div class="row py-3 mx-3">
    <div class="col-4"></div>
    <div class="col-4 d-flex justify-content-center align-items-center">
      <h1>
        <a href="${pageContext.request.contextPath }/main/main">
          <i class="bi bi-emoji-smile">MyPet</i>
        </a>
      </h1>
    </div>
    <div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2">
      <a class="p-1 btn" href="#" data-bs-toggle="modal" data-bs-target="#login-modal">LOGIN</a>
<%--       <a class="p-1 btn" onclick="fnloginmodal('${test.id }')">LOGIN</a> --%>
      <a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#signup-modal">SIGN UP</a>
    </div>
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
              <a class="nav-link" id="nav-buy-ksk" href="${pageContext.request.contextPath }/GB/GbuyWrite">공동구매</a>
              <a class="nav-link" id="nav-event-ksk" href="${pageContext.request.contextPath }/notice/list_notice">공지사항</a>
              <a class="nav-link" id="nav-about-ksk" href="${pageContext.request.contextPath }/main/main#main-about-ksk">ABOUT US</a>
          </div>
      </div>
    </div>
  </nav>
</header>

<script>
$(document).ready(function(){
	$(window).scroll(fuction(){
		let value =  window.scrollY;
		console.log("scrollY", value);
	});
});
// 	$(window).scroll(fuction(){
// 		let value =  window.scrollY;
// 		console.log("scrollY", value);
// 		$(#login-modal).modal()
// 	});
	
// 	window.addEventListener("scroll", function(){
// 		let value = window.scrollY;
// 		console.log("스크롤", value);
// 	});
</script>


<!-- 모달창 시작 -->
    <!-- 로그인 -->
    <div class="modal fade py-5" tabindex="-1" role="dialog" id="login-modal">
      <div class="modal-dialog" role="document">
        <div class="modal-content rounded-5 shadow">
          <!-- Modal Header -->
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <h2 class="fw-bold mb-0">Login</h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- Modal body -->
          <div class="modal-body p-5 pt-0">
            <form class="">
              <div class="form-floating mb-3">
                <input type="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
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
    <div class="modal modal-signin py-5" tabindex="-1" role="dialog" id="signup-modal">
      <div class="modal-dialog" role="document">
        <div class="modal-content rounded-5 shadow">
          <!-- Modal Header -->
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <h2 class="fw-bold mb-0">sign up</h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- Modal body -->
          <div class="modal-body p-5 pt-0">
            <form class="">
              <div class="form-floating mb-3">
                <input type="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
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