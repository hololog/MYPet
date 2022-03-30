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
      <a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#login-modal">LOGIN</a>
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
              <a class="nav-link" id="nav-buy-ksk" href="#">공동구매</a>
              <a class="nav-link" id="nav-event-ksk" href="${pageContext.request.contextPath }/notice/list_notice">공지사항</a>
              <a class="nav-link" id="nav-about-ksk" href="${pageContext.request.contextPath }/main/main#main-about-ksk">ABOUT US</a>
          </div>
      </div>
    </div>
  </nav>
</header>
<!-- header 종료 -->