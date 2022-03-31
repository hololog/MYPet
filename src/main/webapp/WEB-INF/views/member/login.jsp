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

    <title>login</title>
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="css/style.css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />
    <link rel="stylesheet" href=".${pageContext.request.contextPath }/resources/css/main.css"  />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">

        <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
<link href="../project-data/bootstrap-5.1.3-examples/modals/modals.css" rel="stylesheet">
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
                            <h4 class="fw-bold mb-0 title_kds">실종공고를 등록할 예정인가요?</h4>
                      <!-- 닫기 버튼
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       -->
                    </div>
                            
                    <div class="modal-body p-5 pt-0">
                        <form class="whole_modal">
                          <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">E-mail</label>
                          </div>
                          <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
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
                           <a href="">회원가입</a> </h2>
                          </p>
                          </div>
                          
                          <hr class="my-4">
                          <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4 " type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#naver"/></svg>
                            네이버계정으로 로그인
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4 kakao_kds" type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#kakao"/></svg>
                            카카오계정으로 로그인
                          </button>
                          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4 google_kds" type="submit">
                            <svg class="bi me-1" width="16" height="16"><use xlink:href="#google"/></svg>
                            구글계정으로 로그인
                          </button>
                          <div class="singin">
                          <p>
                          <h2 class="fs-5 fw-bold mb-3"><a href="" id="nonmem_kds">▶ 비회원으로 진행하기</a></h2>
                          </p>
                       </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>

                

    <script src="../project-data/bootstrap-5.1.3-examples/assets/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>