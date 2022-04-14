<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">

    <title>join</title>
    <!-- css스타일 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css"  />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">

        <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"  />
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/modals.css"  />

  </head>
  <body>

            <!-- modal 시작 -->
            <div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
                <div class="modal-dialog" role="document">
                  <div class="modal-content rounded-5 shadow">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <!-- <h5 class="modal-title">Modal title</h5> -->
                      <div>
                         <div class="whole_modal">
                            <h4 class="fw-bold mb-0 title_kds">회원가입</h4>
                      <!-- 닫기 버튼
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       -->
                    </div>
                            
                    <div class="modal-body p-5 pt-0">
                        <form action="${pageContext.request.contextPath }/member/join" class="whole_modal">
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

                

    <script src="${pageContext.request.contextPath }/../resources/script/bootstrap.bundle.min.js"></script>
  </body>
  
</html>