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

<script> 
function validate() 
{ 
		  var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식 
		  var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식 
		  var email = document.getElementById("email"); 
		  var pw = document.getElementById("pw"); 
		  
		  if(email.value=="") { 
			  alert("이메일을 입력해 주세요"); 
			  email.focus(); 
			  return false; 
			  
		  } if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) { 
			  return false; 
			  
		  }
		  
		  if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) { 
			  return false; 
		  } 
		  
		  if(join.pw.value != join.checkpw.value) { 
			  alert("비밀번호가 다릅니다. 다시 확인해 주세요."); 
			  join.checkpw.value = ""; 
			  join.checkpw.focus(); 
			  return false; 
		  } 
		  
		  alert("회원가입이 완료되었습니다.");
}
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
                         
                       	 <h6><a href="" id="idpw_kds">비밀번호찾기</a></h6> 


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
							<div class="g-signin2" data-onsuccess="onSignIn" align ="center" style="width: 315px; height: auto;">
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
                          <p>
                           <a href="/list/API/login_kakao_sync.html?ks_return_url=https%3A%2F%2Fwww.silicook.co.kr%2Fshop%2Fshopdetail.html%3Fbranduid%3D3519841%26NaPm%3Dct%253Dl2023whs%257Cci%253D692cd9a78351bf0a46e676cfb58ab2bfb06269e7%257Ctr%253Dsbtm%257Csn%253D238329%257Chk%253D132334376ed4a07159a453f979b76afa64be3468" class="link kakao">
						  	<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_kakao.jpg" alt="카카오로 회원가입"></a>
						  </p>  
						 
						    
						    
						  <a href="/list/API/login_naver.html" class="link naver">
 							<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_naver.jpg" alt="네이버로 회원가입"> 
						  </a>
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
             
<script>
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
				
// <%--               location.href=" <% --%>
// //           			session.setAttribute("email", memberCheckDTO.getEmail());
// //   					session.setAttribute("nickname", memberCheckDTO.getNickname());
// 					session.setAttribute("nickname", "hjj");
// //             		session.setAttribute("member_mid", id);
//             		response.sendRedirect("${pageContext.request.contextPath }/main");
// <%--             		%>"; --%>
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
</script>
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