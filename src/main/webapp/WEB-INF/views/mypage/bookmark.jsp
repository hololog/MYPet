<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>bookmark</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
	
	.menu-jd {margin: 20px 0 !important;}
	 
	.sidebar1 {
     display:block !important;
     padding-left: 0;}
     
     #sdb>li {/*border: 1px solid red; 
	    	 */	 display:inline-block;
	    		}
	   	 
	    .bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
	    }
	
	    @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	            font-size: 3.5rem;
	        }
	     .menu-jd {margin: 0 20px 0 20px;}   
	        
	    }
	    
	</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-jd.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sidebars.css">

<script type="text/javascript">
	


</script>

</head>
<body>
	<div>
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

    <!-- ------------------------------- -->
    <!-- 본문 시작-->
    <!-- ------------------------------- -->
    <!-- 제목 시작 -->
    <div class="container">
      <h1 class="sub-title">즐겨찾기</h1>
      <hr>
    </div>
    <!-- 제목 종료 -->
    
    <!-- 사이드바 시작 -->
        <div class="row" style="padding-left: 15%; padding-right: 15%; column-gap: 25px; ">
            <div
                class="d-flex flex-column flex-shrink-0 p-4 col-md-2 menu-jd"
                style="min-width: 230px; max-height: 500px">
                <div class="Info" style="display: flex;">
                        <img
                            src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg"
                            alt=""
                            width="70"
                            height="70"
                            class="rounded-circle me-3 align-items-center">
                        <strong style="color: white;"><br>${sessionScope.nickname } 님</strong>
                </div>
                <hr>
              
                <ul class="nav nav-pills flex-column mb-auto sidebar1" id="sdb">
                    <li class="nav-item2">  
                        <a href="${pageContext.request.contextPath }/mypage/myinfo" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내정보
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/mylist" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내 글목록
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/mymisslist" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내 실종공고
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/bookmark" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            즐겨찾기
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/amendpwd" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            비밀번호 변경
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/leave" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            탈퇴
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 사이드바 끝 -->

            <!-- 즐겨찾기 시작 -->
            <div
                class="border col"
                style=" padding-left: 8%; padding-top: 4%; padding-bottom: 4%;">
                <div class="row gap-5">
                    <div class="card col-md-5 gap-2">
                        <img src="${pageContext.request.contextPath }/resources/img/dog1.jpg" class="card-img-top" alt="..."/>
                        <!-- 북마크 아이콘 -->
                        <i
                            class="fa-solid fa-star fa-2x"
                            style="position: absolute; top:10px; left: 10px; color: rgb(245, 211, 22);"></i>
                        <div class="card-body">
                            <h5 class="card-title">멍멍이 찾습니다.</h5>
                            <p class="card-text">부산 전포동/프렌치불독</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn text-white" style="background-color: #3f51b5">상세보기</a>
                                </div>
                                <div>
                                    <!-- 댓글수, 조회수 아이콘 -->
                                    <i class="bi bi-star-fill"></i>
                                    1
                                    <i class="bi bi-chat-dots"></i>
                                    0
                                    <i class="bi bi-eye-fill"></i>
                                    1
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card col-md-5">
                        <img src="${pageContext.request.contextPath }/resources/img/dog1.jpg" class="card-img-top" alt="..."/>
                        <!-- 북마크 아이콘 -->
                        <i
                            class="fa-solid fa-star fa-2x"
                            style="position: absolute; top:10px; left: 10px; color: rgb(245, 211, 22);"></i>
                        <div class="card-body">
                            <h5 class="card-title">멍멍이 찾습니다.</h5>
                            <p class="card-text">부산 전포동/프렌치불독</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn text-white" style="background-color: #3f51b5">상세보기</a>
                                </div>
                                <div>
                                    <!-- 댓글수, 조회수 아이콘 -->
                                    <i class="bi bi-star-fill"></i>
                                    1
                                    <i class="bi bi-chat-dots"></i>
                                    0
                                    <i class="bi bi-eye-fill"></i>
                                    1
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card col-md-5">
                        <img src="${pageContext.request.contextPath }/resources/img/dog1.jpg" class="card-img-top" alt="..."/>
                        <!-- 북마크 아이콘 -->
                        <i
                            class="fa-solid fa-star fa-2x"
                            style="position: absolute; top:10px; left: 10px; color: rgb(245, 211, 22);"></i>
                        <div class="card-body">
                            <h5 class="card-title">멍멍이 찾습니다.</h5>
                            <p class="card-text">부산 전포동/프렌치불독</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn text-white" style="background-color: #3f51b5">상세보기</a>
                                </div>
                                <div>
                                    <!-- 댓글수, 조회수 아이콘 -->
                                    <i class="bi bi-star-fill"></i>
                                    1
                                    <i class="bi bi-chat-dots"></i>
                                    0
                                    <i class="bi bi-eye-fill"></i>
                                    1
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card col-md-5">
                        <img src="${pageContext.request.contextPath }/resources/img/dog1.jpg" class="card-img-top" alt="..."/>
                        <!-- 북마크 아이콘 -->
                        <i
                            class="fa-solid fa-star fa-2x"
                            style="position: absolute; top:10px; left: 10px; color: rgb(245, 211, 22);"></i>
                        <div class="card-body">
                            <h5 class="card-title">멍멍이 찾습니다.</h5>
                            <p class="card-text">부산 전포동/프렌치불독</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn text-white" style="background-color: #3f51b5">상세보기</a>
                                </div>
                                <div>
                                    <!-- 댓글수, 조회수 아이콘 -->
                                    <i class="bi bi-star-fill"></i>
                                    1
                                    <i class="bi bi-chat-dots"></i>
                                    0
                                    <i class="bi bi-eye-fill"></i>
                                    1
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 즐겨찾기 끝 -->
  
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

    <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  </div>
<!-- 부트스트랩 스크립트 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous">
</script>
</body>
</html>