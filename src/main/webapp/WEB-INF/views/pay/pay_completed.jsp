<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제 페이지</title>
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
  </head>
  <body>
    <div>
      <!-- header 시작 -->
	  <jsp:include page="../inc/top.jsp"></jsp:include>
   	  <!-- header 종료 -->
   	 <!-- 제목 시작 -->
		<div class="container">
			<h1 class="sub-title">결제</h1>
		</div>
		<!-- 제목 종료 -->

      <div class="container">
                <div class="container-fluid" style="text-align: center; font-family:fantasy;">
                    <table class="table table-responsive ">
                       		<br>
                            <div class="sub-title" style="color: #3f51b5;">
                                <h3>결제가 완료되었습니다.</h3>
                            </div>
                        </tr>
                    </table>
                </div>
                <div class="container-fluid" style="text-align: center;">
                    <table class="table table-responsive ">
                        <tr>
                            <div style="color: #3f51b5;">
                                <h5>주문 내용</h5>
                            </div>
                        </tr>
                    </table>
                    <table class="table table-responsive col-4">
                        <tr >
                            <td>주문번호</td>
                            <td>20220324001</td>
                            <!--주문날짜 + 001~ -->
                        </tr>
                        <tr>
                            <td>주문날짜</td>
                            <td>20220324</td>
                        </tr>
                        <tr>
                            <td>상품번호</td>
                            <td>1a</td>
                        </tr>
                    </table>
                   <a href="${pageContext.request.contextPath }/main/main">
                        <button type="button" class="btn btn-outline-secondary">
                            메인페이지로
                        </button>
                   </a>
                </div>
            </div>
      
     
 	 <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
    
 	 </div>	

    <!--스크립트 적용 -->
    <script src="js/main.js"></script>
    <!-- 부트스트랩 스크립트 적용 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
