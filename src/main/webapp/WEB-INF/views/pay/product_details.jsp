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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/GBuy.css" />
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
var sell_price;
var amount;
function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	if	(hm.value<${boardDTO.gbuy_count}){
		 hm.value ++ ;
		 sum.value = parseInt(hm.value) * sell_price;
	}
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value >${boardDTO.gbuy_count}) {
			hm.value =${boardDTO.gbuy_count};
		}
		
	sum.value = parseInt(hm.value) * sell_price;
}  
function xx() {
  	hm = document.form.amount;
	sum = document.form.sum;
	hm.value="1" ;

	sum.value = parseInt(hm.value) * sell_price;
}


</script>
      <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
   	  <!-- header 종료 -->
      <!-- 제품이미지 -->
<br>
<div>
<input type="button" value="글수정" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyUpdate?gbuy_num=${boardDTO.gbuy_num}'">
<input type="button" value="글삭제" class="btn_GB" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyDelete?gbuy_num=${boardDTO.gbuy_num}'">	
	<div style="font-family:fantasy; text-align: center; color: #3f51b5; ">
<%-- 	 <h2>공동구매 진행중! (${boardDTO.gbuy_count}/${boardDTO.gbuy_tcount})</h2> --%>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div><img src="${pageContext.request.contextPath }/resources/img/1060dbe08b937cbbe29cf6c9b1bfe278.png" class="img-responsive" alt="product" style="max-width: 100%;height: auto; float: left;">
				</div>
			</div>
			<div class="col-6" style="text-align: left;">
				<table>
					<tr>
                    	<td>제품명 :${boardDTO.gbuy_subject}
                     	</td>
                    </tr>
                    <tr>
                    	<td>판매가:${boardDTO.gbuy_price}원 
                    	</td>
                    <tr>
                        <td id='del_fee'>배송비 :3,000원
                        </td>
                    </tr>
                    <tr>
                    	 <td>목표량:${boardDTO.gbuy_tcount} 
                    	</td>
                    </tr>
                    <tr>
                    	<td>재고수:${boardDTO.gbuy_count} 
                    	</td>
                    </tr>
                    <tr>
                    	<td>
							<form name="form" method="get">
								수량 : <input type="hidden" name="sell_price" value="${boardDTO.gbuy_price}">
									  <input type="text" name="amount" value="1" size="3" onchange="change();" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									  <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><input type="button" value=" x " onclick="xx();"><br>
								금액 : <input type="text" name="sum" size="11" readonly>원
							</form>
                        </td>
                    </tr>
         		</table>
         		<!-- 결제방식 선택 -->
       			<div class="row" style="text-align: center;">
             		<div><button type="button" name="pay_now" class="btn btn-success">
             			 구매하기</button>
             		</div>
         		</div>
			</div>
            <!-- 상세페이지 영역! -->
            <!-- 더미데이터-->
           	<h1 style="text-align: center;">상세 페이지 영역</h1>
            	<div class="col-12" style="text-align: center;">
                	<img src="${pageContext.request.contextPath }/resources/img/1060dbe08b937cbbe29cf6c9b1bfe278.png" class="img-responsive" alt="product_details">
                </div>
		</div>
	</div>
</div>
	<!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
    <!--스크립트 적용 -->
    <script src="js/main.js"></script>
    <!-- 부트스트랩 스크립트 적용 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
