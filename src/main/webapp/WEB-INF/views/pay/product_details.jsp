<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/GBuy.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pay.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/main.js"></script>
   <!-- JQuery -->
<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<!-- 1씩증가 감소 스크립트 -->
</head>
<body onload="init();">
<script language="JavaScript">
var sell_price;
var amount;
function init () {
			      sell_price = document.form.sell_price.value;
			      amount = document.form.amount.value;
			      document.form.sum.value = (parseInt(sell_price) + 3000);
			      change();
				 }
function add () {
			     hm = document.form.amount;
			   	 sum = document.form.sum;
				 if	(hm.value<${boardDTO.gbuy_count}){
					 hm.value ++ ;
					 sum.value = (parseInt(hm.value) * sell_price + 3000);
				    }
				}
function del () {
				 hm = document.form.amount;
				 sum = document.form.sum;
				 if (hm.value > 1) {
									hm.value -- ;
									sum.value = (parseInt(hm.value) * sell_price + 3000);
					}
				}
function change () {
					hm = document.form.amount;
					sum = document.form.sum;
					if (hm.value >${boardDTO.gbuy_count}) {
						hm.value =${boardDTO.gbuy_count};
						}
					}  
function xx() {
			  	hm = document.form.amount;
				sum = document.form.sum;
				hm.value="1" ;
				sum.value = (parseInt(hm.value) * sell_price + 3000);
				sumview.value = (parseInt(hm.value) * sell_price + 3000);
			   }
</script>
      <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
   	  <!-- header 종료 -->
      <!-- 제품이미지 -->
	<br>
	<div>
	<div class="text-lg-end" style="padding-right:20%;">
		<input type="button" 
			   value="글수정" 
			   class="btn_GB" 
			   onclick="location.href='${pageContext.request.contextPath}/GB/GbuyUpdate?gbuy_num=${boardDTO.gbuy_num}'" >
		<input type="button"
		       value="글삭제" 
		       class="btn_GB" 
		       onclick="location.href='${pageContext.request.contextPath}/GB/GbuyDelete?gbuy_num=${boardDTO.gbuy_num}'" >	
	</div>
	<div style="font-family:fantasy; text-align: center; color: #3f51b5; ">
	<br><br><br><br><br>
	 <h2>공동구매 진행중! (${boardDTO.gbuy_count}/${boardDTO.gbuy_tcount})</h2>
	</div>
	<br>
	<br>
	
	<div class="container">
		<div class="row">
			<div class="col-6">
				<img style="width:80%; height:100%; padding:0;"
				 	 src="${pageContext.request.contextPath }/resources/upload/${boardDTO.gbuy_file}">
			</div>
			<div class="col-6" style="text-align: left; padding:0;">
				<div>
                    <div>제품명 : ${boardDTO.gbuy_subject}</div>
                    <br>
                    <div>판매가 : <fmt:formatNumber value="${boardDTO.gbuy_price}"  pattern="#,###" /> 원
                    </div>
                    <br>
                    <div>배송비 : 3,000 원</div>
                    <br>
                    <div>목표량 : ${boardDTO.gbuy_tcount} 개</div>
                    <br>
                    <div>재고수 : ${boardDTO.gbuy_count} 개</div>
                    <br>
                    <div>
                    	<div>
							<form name="form" method="get">
							<div>
								&nbsp;수량&nbsp;:&nbsp; 
									  <input type="hidden" 
											 name="sell_price" 
											 value="${boardDTO.gbuy_price}">
									  <input type="text" 
									  		 id="final_qty" 
									  		 name="amount" 
									  		 value="1" 
									  		 size="3" 
									  		 onchange="change();"
									  		 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									  		 style="width:30px; 
									         	    height:30px;
									    	  		border:none;
									  		  		border-right:0px; 
									   		  		border-top:0px; 
									  		  		boder-left:0px; 
									   		  		boder-bottom:0px;
									   		  		background-color:transparent;"
									  		 readonly>개
									  <input type="button" 
									  		 value=" + "
									  		 onclick="add();"
									  		 style="width:30px; 
									         	    height:30px;
									    	  		border:none;
									  		  		border-right:0px; 
									   		  		border-top:0px; 
									  		  		boder-left:0px; 
									   		  		boder-bottom:0px;
									   		  		background-color:transparent;" >
									  <input type="button" 
									  		 value=" - "
									  		 onclick="del();"
									  		 style="width:30px; 
									         	    height:30px;
									    	  		border:none;
									  		  		border-right:0px; 
									   		  		border-top:0px; 
									  		  		boder-left:0px; 
									   		  		boder-bottom:0px;
									   		  		background-color:transparent;">
									  <input type="button"
									  		 class="w-btn-reset w-btn-brown"
									  		 value="reset"
									  		 onclick="xx();"
									  		 style="width:80px;"
									  		 >
									  <input type="hidden" 
									  	     name="Gbuy_count" 
									  	     value="${boardDTO.gbuy_count}"> 
							</div>
							<br>        
							<div>
							    금액 &nbsp;:&nbsp;
							    	  <input type="text" 
							    			 name="sum" 
							    			 id="final_price" 
							    			 size="11" 
							    			 value="0"
							    			 style="width:100px; 
									         	    height:30px;
									    	  		border:none;
									  		  		border-right:0px; 
									   		  		border-top:0px; 
									  		  		boder-left:0px; 
									   		  		boder-bottom:0px;
									   		  		background-color:transparent;
									   		  		outline:none;"
							    			 readonly>원
							    			 	       							   
							</div>
							</form>
                        </div>
                    </div>
         		</div>
         		<!-- 결제방식 선택 -->
         		<br>
       			<div class="row" style="text-align: left;">
             		<div>
             			 <input id="btnBuy" 
             			 	    type="button" 
             			 	    value="구매하기" 
             			 	    class="w-btn w-btn-buy-green" 
             			 	    onclick="move()">
             			 	     
             		</div>
         		</div>
         		<script type="text/javascript">
         		
         		function move(){
         			var final_qty = document.getElementById('final_qty').value;
					var final_price = document.getElementById('final_price').value;
             		location.href ='${pageContext.request.contextPath}/pay/pay_processing?gbuy_num=${boardDTO.gbuy_num}'+ '&final_qty=' + final_qty + '&final_price=' + final_price;
         		}
         		</script>
			</div>
            <!-- 상세페이지 영역! -->
            <!-- 더미데이터-->
           	<h1 style="text-align: center;"></h1>
           	<br><br><br><br>
            	<div class="col-12" style="text-align: center;">
                	<img	style="width:100%; height:100%; object-fit:cover;" 
                			src="${pageContext.request.contextPath }/resources/upload/${boardDTO.gbuy_file2}" class="img-responsive" alt="product_details">
                </div>
		</div>
	</div>
</div>
	<!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
