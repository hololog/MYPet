<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>mylist</title>
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
$(document).ready(function(){
		$.ajax({
			url:'${pageContext.request.contextPath }/mypage/mypagejson',
			dataType:'json',
			data:{"nickname":'${sessionScope.nickname}'},
			success:function(rdata){
				$.each(rdata,function(index,item){
					if(item.board_code == 'v'){
						$('#table1').append('<tr><td>'+item.rownum+'</td><td>'+item.board_code+'</td><td><a href="${pageContext.request.contextPath }/reviewboard/content_review?tip_board_num='+item.num+'">'+item.subject+'</a></td><td>'+item.readcount+'</td></tr>');
					} else {
						$('#table1').append('<tr><td>'+item.rownum+'</td><td>'+item.board_code+'</td><td><a href="${pageContext.request.contextPath }/freeboard/content_free?free_board_num='+item.num+'">'+item.subject+'</a></td><td>'+item.readcount+'</td></tr>');
					}
				});
			}
		});	
	});//
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
      <h1 class="sub-title">내 글목록</h1>
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

            <!-- 게시판 시작 -->
            <div class=" border col" style="padding: 3%;">
            	<div class="col-4 d-flex justify-content-end align-items-center flex-wrap gap-2">
            	</div>
                <div class="content">
                    <table class="table table-hover text-start" >
                        <thead>
                            <tr style="text-align: center;">
                                <th width="7%">번호</th>
                                <th width="11%">종류</th>
                                <th width="65%">제목</th>
                                <th width="9%">조회수</th>
                            </tr>
                        </thead>
                        <tbody id="table1">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- 게시판 끝 -->
  
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