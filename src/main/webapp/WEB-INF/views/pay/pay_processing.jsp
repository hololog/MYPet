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
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/main.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  </head>
  <body>
    <div>
      <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
   	  <!-- header 종료 -->

			<br><br><br><br>
     		<br><br><br><br>
            <div class="container">
                <div style="text-align: center; font-family:fantasy;">

                    <table class="table table-responsive" style="text-align: right;">

                        <tr>
                            <h3 style="color: #3f51b5;">배송정보</h3>
                        </tr>
                        <tr>
                            <td>수령인</td>
                            <td style="text-align: center;"><input type="text"></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td>상품명</td>
                            <td style="text-align: center;">양말</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>주문수량</td>
                            <td style="text-align: center;">2</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>주문금액</td>
                            <td style="text-align: center;">30,000원</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td style="text-align: center;"><input type="text" name="" id="" readonly="readonly"></td>
                            <td style="text-align: left;"><input type="button" value="주소찾기"></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td style="text-align: center;"><input type="text" name="" id=""></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td style="text-align: center;"><input type="text" name="" id=""></td>
                            <td></td>
                        </tr>
                    </table>
                </div>

            </div>
            <br>
            <br>
            <br>
            <br>
      
      
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
