<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />
<meta name ="google-signin-client_id" content="21012707042-i0lmmpepn86jtfkojkg5mqaqp2763412.apps.googleusercontent.com">
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
	     		<a class="p-1 btn" href="${pageContext.request.contextPath }/mypage/myinfo?email=${sessionScope.email}">마이페이지</a>
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
              <div class="modal-content rounded-5 shadow">
               <div class="modal-header p-5 pb-4 border-bottom-0">
                      <!-- <h5 class="modal-title">Modal title</h5> -->
                <div class="whole_modal">
                         <!-- 닫기 버튼-->
                      	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="lg_close"></button>
                    	<h4 class="fw-bold mb-0 title_kds">실종공고를 등록할 예정인가요?</h4>
                   
                    	
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
                          <P> 
                          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" id="login_btn">로그인</button>
                          </P>
                          <!-- 작은 안내글
                              <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                            -->
                         <a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#signup-modal">회원가입하기</a>
                         
                       	 <a class="p-1 btn" data-bs-toggle="modal" data-bs-target="#temp_PW">비밀번호찾기</a> 
                       	 
							<hr class="my-4">
							
							 <!-- 네이버로 로그인  -->
							 
 							<div id="naver_id_login" align = "center">
 								<a id="naverIdLogin_loginButton" href="javascript:void(0)">
								<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" style="width: 316px; height: 45px;" />
        						</a>
  						    </div>
  						    <br>

							<!-- 카카오계정으로 로그인 -->
						    <div class="button-login" align ="center" >
              					<a id="kakao-login-btn" >
   								<img src="${pageContext.request.contextPath }/resources/img/kakao_login_medium_wide.png" title="카카계정으로 회원가입" class="kakao_login" style="width: 315px;">
                          		</a>
                            	</div>
                            	<br>
<!--                            	<a href="http://developers.kakao.com/logout">카카오 로그아웃</a> -->
							 
							<!-- 구글계정으로 로그인 -->
							<div class="g-signin2" data-onsuccess="onSignIn" align ="center" style="width: 315px; height: 45px; ">
								<a href="javascript:void(0)"></a>
							</div>
								</form>
							
<!-- 							<div class="singin"> -->
<!-- 								<p> -->
<!-- 								<h2 class="fs-5 fw-bold mb-3"> -->
<!-- 									<a href="" id="nonmem_kds">▶ 비회원으로 진행하기</a> -->
<!-- 								</h2> -->
<!-- 								</p> -->
<!-- 							</div> -->
						</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>



<!-- 임시비밀번호 모달창 -->
<div class="modal fade py-5" tabindex="-1" role="dialog" id="temp_PW" style="transition: opacity 0.5s linear;">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-5 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<div class="whole_modal">
				<br>	
					<h4 class="fw-bold mb-0">임시번호가 전송될 이메일을 입력해주세요</h4>
					<!-- 닫기 버튼
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>-->
					<br>	
					<br>	
					<div class="modal-body p-5 pt-0">
						<div class="form-floating mb-3">
							<input type="email" class="form-control rounded-4" placeholder="name@example.com" name="email" required="required">
							<label for="floatingInput">E-mail</label>
						</div>

						<div class="btn_kds">
							<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
								type="submit">임시비밀번호 전송</button>
						</div>
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
<!--                          닫기 버튼 -->
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                         <h4 class="fw-bold mb-0 title_kds">회원가입</h4>
                   	 
                            
                    <div class="modal-body p-5 pt-0">
                        <form action="${pageContext.request.contextPath }/member/joinPro" class="whole_modal" method="post">
                        
                          <div class="form-floating mb-3">
		   				  <input type="text" class="form-control rounded-4" id="nick" name="nickname" required autofocus>
                            <label for="floatingInput_NM">닉네임</label>
                            <span class="ex-plain email-alert" style="display :none;"> 이미 사용중인 닉네임입니다. </span>
<!--                             <button id="nnbtn">중복확인</button> -->
                          </div>
                          <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="em" name="email" required autofocus>
                            <label for="floatingInput_EM">email@example.com</label>
                            <div class="check_font" id="EM_check"></div>
                          </div>
                          <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" name="password" id="pw" minlength="8" maxlength="10" required autofocus>
                            <label for="floatingPassword">비밀번호(8~10자 입력)</label>
                          </div>
		  					<div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="pw2" onkeyup="checkPwd()" minlength="8" maxlength="10" required>
                            <label for="floatingPassword">비밀번호 재확인</label>
                            <span class="glyphicon glyphicon-ok form-control-feedback" style="display :none"></span>
 							<span id="r_pwErr" class="help-block" style="display :none"> 비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
                          </div>
                          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">회원가입</button>
                         
                          <!-- 작은 안내글
                              <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                            -->

                          <hr class="my-4">

                          <div class="singin">
                          <p>
                          <h2 class="fs-5 fw-bold mb-3">▶ SNS계정으로 회원가입하기</h2>
                          </p>
                          </div>
                           
                          <div>
                          <p>
                           <a id="kakao-login-btn">
						  	<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_kakao.jpg" alt="카카오로 회원가입"></a>
						  </p>  
						 </div>
						 
						 <div id="naver_id_login" align = "center">
						    <a id="naverIdLogin_loginButton" href="javascript:void(0)">
 							<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_naver.jpg" alt="네이버로 회원가입"> 
						  </a>
                          </div>
                          
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>   
            </div>   
                          
<!-- 	네이버 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "mN9peMMHaXTpzr11fU6X", //cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>

<!-- 카카오 로그인//b4c6c29aa62ff98658b6232a7a02f728 -->
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type='text/javascript'>
Kakao.init('b4c6c29aa62ff98658b6232a7a02f728');

$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
			 	 scope : 'account_email';
				
              alert('로그인성공'+id);
				
<%--               location.href=" <% --%>
// //           			session.setAttribute("email", memberCheckDTO.getEmail());
// //   					session.setAttribute("nickname", memberCheckDTO.getNickname());
// 					session.setAttribute("nickname", "hjj");
// //             		session.setAttribute("member_mid", id);
//             		response.sendRedirect("${pageContext.request.contextPath }/main");
<%--             		%>"; --%>
// location.href="${pageContext.request.contextPath }/member/loginPro2";

        }
         
          })
          console.log(authObj);
//           alert(authObj);
          var token = authObj.access_token;
//           alert(token);
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //
</script>   

<!-- 카카오 로그아웃    -->


<!-- 구글계정 로그인 -->
<script>
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBOdmeC4SOSzXmPGLEM2vZueqiBSWKg3wk', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}

// 로그아웃
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
<!-- 구글 api 사용을 위한 스크립트 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>


		
<script type="text/javascript">
//비밀번호 재확인 입력칸에 focus했을 때
$("#pw2").focus(function() {
	recheck();
});
	
//비밀번호 재확인 입력칸이 blur됐을 때
$("#pw2").blur(function() {
	recheck();
});

//비밀번호 재확인 메서드
function recheck() {
	var rpw = $("#pw2").val();
	var pw = $("#pw").val();
		
	if(rpw == pw){
		 $("#r_pwErr").hide();
		changeSuccess("#pw2");
	}else{
		 $("#r_pwErr").show();
		 changeError("#pw2");
	}	
};

</script>

<!-- 회원가입 유효성 -->



<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/css/style.css"></script>
	
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/script.js"></script>

    <!-- 모달창 종료 -->
<!-- header 종료 -->

<script type="text/javascript">
$(document).mouseup(function (e){
  var LayerPopup = $(".whole_modal");
  if(LayerPopup.has(e.target).length === 0){
    LayerPopup.removeClass("show");
  }
});
</script>