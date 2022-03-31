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
		<br>
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
      	 <!-- 결제방식 선택 -->
      	 
      	
      	 
      	 
      	 
            <div class="" style="text-align: center;">
                <div>
                    <button type="button" name="pay_now" class="btn btn-success">
                        구매하기
                    </button>
                    <a href="javascript:history.back();">
                        <button type="button" class="btn">
                            취소하기
                        </button>
                    </a>
                </div>
            </div>
            <br>
      	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "가맹점 사용자 식별키",
          "merchantPayKey": "가맹점 주문 번호",
          "productName": "상품명을 입력하세요",
          "totalPayAmount": "1000",
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
        });
    });
    
</script>



	

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
