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

    <title>tmppwd</title>
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/style.css" />
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
                      <div class="whole_modal">
                            <h4 class="fw-bold mb-0 title_kds">임시번호가 전송될 이메일을 입력해주세요</h4>
                      <!-- 닫기 버튼
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       -->
                    
                            
                    <div class="modal-body p-5 pt-0">
                        

                          <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="floatingInput_kds" placeholder="name@example.com" autofocus>
                            <label for="floatingInput">E-mail</label>
                          </div>

                          <div class="btn_kds">
                          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">임시비밀번호 전송</button>
                          </div>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
        

    <script src="${pageContext.request.contextPath }/../resources/script/bootstrap.bundle.min.js"></script>
  </body>
  
</html>