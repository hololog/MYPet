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
   <script>
   function count(type)  {
	   // 결과를 표시할 element
	   const resultElement = document.getElementById('result');
	   
	   // 현재 화면에 표시된 값
	   let number = resultElement.innerText;
	   
	   // 더하기/빼기
	   if(type === 'plus') {
	     number = parseInt(number) + 1;
	   }else if(type === 'minus')  {
		   if(number > 2){
			   number = parseInt(number) - 1;
		   }
		   else{
			   number = 1;
		   }	
	   }
	   
	   // 결과 출력
	   resultElement.innerText = number;
	 }
   </script>
    
    
  </head>
  <body>
    <div>
      <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
   	  <!-- header 종료 -->
   	  
   	  
      <!-- 제품이미지 -->
      		
            
			
           
            <br>
            <br>
            <div style="font-family:fantasy; text-align: center;">
                <h1>창경야옹실록 양말</h1>
            </div>
            <div style="font-family:fantasy; text-align: center; color: #3f51b5; ">
                <h2>공동구매 진행중!(1/100)</h2>
            </div>
            
               
                <br>
                <br>
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div>
                                <img
                               		
                                    src="${pageContext.request.contextPath }/resources/img/1060dbe08b937cbbe29cf6c9b1bfe278.png"
                                    class="img-responsive"
                                    alt="product"
                                    style="max-width: 100%;height: auto; float: left;">
                            </div>
                        </div>
                        <div class="col-6" style="text-align: left;">
                            <table >
                                <tr>
                                    <td>제품명 :
                                    </td>
                                    <td>창경야옹실록 양말
                                    </td>
                                    <tr>
                                        <td>판매가 :
                                        </td>
                                        <td id='each_price'>15,000원</td>
                                    </tr>
                                    <tr>
                                        <td id='del_fee'>배송비 :
                                        </td>
                                        <td>3,000원</td>
                                    </tr>
                                    <tr>
                                    
                                        <td> <input type="hidden" name="sell_price" >수량(최소주문수량 1개 이상) :
                                        </td>
                                        <td>
                                        	<div>
<!--                                         	<input type="number" value="1" id="result"> -->
                                            <div id='result'>1</div>
                                            
                                            <div>
                                            <input type='button'
     											   onclick='count("plus")'
								      			   value='+'
								      			   class="btn btn-default btn-sm"/
								      			   >
											<input type='button'
								     			   onclick='count("minus")'
								       			   value='-'
								       			   class="btn btn-default btn-sm"/
								       			   >
                                            </div>
                                            </div>
                                        <td>

                                    </tr>
                                </div>
                                <tr>
                                    <td>총 상품금액 :
                                    </td>
                                    <td><input
                                        type="text"
                                        id='total_price'
                                        value="15,000"
                                        readonly="readonly"
                                        style="border:none; text-align:right;">원</td>

                                </tr>
                            </tr>
                        </table>
                        <!-- 결제방식 선택 -->
                        <div class="row" style="text-align: center;">
                            <div>
                                <button type="button" name="pay_now" class="btn btn-success">
                                    구매하기
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- 상세페이지 영역! -->
                    <!-- 더미데이터-->
                    <h1 style="text-align: center;">상세 페이지 영역</h1>
                    <div class="col-12" style="text-align: center;">
                        <img
                            src="${pageContext.request.contextPath }/resources/img/1060dbe08b937cbbe29cf6c9b1bfe278.png"
                            class="img-responsive"
                            alt="product_details">
                    </div>
                </div>
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
