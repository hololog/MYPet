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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/pay.css" />	
<!-- 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/main.js"></script>

<link type="text/css" rel="stylesheet"
	href="https://t1.kakaocdn.net/checkout/pay/_sdk/style.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- 아임포트 라이브러리 -->
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	function sample4_execDaumPostcode() {
              new daum
               .Postcode({
                   oncomplete: function (data) {
                       var roadAddr = data.roadAddress; // 도로명 주소 변수
                       var extraRoadAddr = ''; // 참고 항목 변수

                       if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                           extraRoadAddr += data.bname;
                       }
                       if (data.buildingName !== '' && data.apartment === 'Y') {
                           extraRoadAddr += (
                               extraRoadAddr !== ''
                                   ? ', ' + data.buildingName
                                   : data.buildingName
                           );
                       }
                       if (extraRoadAddr !== '') {
                           extraRoadAddr = ' (' + extraRoadAddr + ')';
                       }

                       document
                           .getElementById('sample4_postcode')
                           .value = data.zonecode;
                       document
                           .getElementById("sample4_roadAddress")
                           .value = roadAddr;
                       document
                           .getElementById("sample4_jibunAddress")
                           .value = data.jibunAddress;

                       if (roadAddr !== '') {
                           document
                               .getElementById("sample4_extraAddress")
                               .value = extraRoadAddr;
                       } else {
                           document
                               .getElementById("sample4_extraAddress")
                               .value = '';
                       }

                       var guideTextBox = document.getElementById("guide");
                       if (data.autoRoadAddress) {
                           var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                           guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                           guideTextBox.style.display = 'block';

                       } else if (data.autoJibunAddress) {
                           var expJibunAddr = data.autoJibunAddress;
                           guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                           guideTextBox.style.display = 'block';
                       } else {
                           guideTextBox.innerHTML = '';
                           guideTextBox.style.display = 'none';
                       }
                   }
               })
                 .open();
          }
</script>
<script>
// 특수문자 입력 방지(이름 주소)
function characterCheck(obj){
var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
if( regExp.test(obj.value) ){
	alert("특수문자는 입력하실수 없습니다.");
	obj.value = obj.value.substring(0 , obj.value.length - 1 );
	}
}
//특수문자 입력 방지(전화번호)
function characterCheck_phone(obj){
var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
if( regExp.test(obj.value) ){
	alert("숫자만 입력하세요.");
		obj.value = obj.value.substring(0 , obj.value.length - 1 );
	}
}



</script>


</head>
<body>

	<div>
		<!-- header 시작 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- header 종료 -->
		<br> <br> <br> <br> <br> <br> <br>
		<div class="container">
			<div style="text-align: center; font-family: fantasy;">
				<form
					action="${pageContext.request.contextPath }/pay/pay_processingPro"
					method="post" id="pay_form"
				>
					<table class="table table-responsive" style="text-align:center; line-height:300%">
					<input type="hidden" name="Gbuy_count" value="${boardDTO.gbuy_count}">
					<input type="hidden" name="Gbuy_num" value="${boardDTO.gbuy_num}">		
					<input type="hidden" id="Gbuy_price" name="Gbuy_price" value="${boardDTO.gbuy_price}">		
					
						<tr>
							<h3 style="color: #3f51b5;">상품정보 및 배송정보</h3>
							<br>
						</tr>

						<tr>
							<td>수령인</td>
							
							<td style="text-align: center;">
								<input type="text"
							    	   id="user_id" 
							    	   placeholder="수령인" 
							    	   name="user_id"
									   style="width:400px; 
										      height:30px;"
									   onkeyup="characterCheck(this)"
									   onkeydown="characterCheck(this)">
							</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td style="text-align: center;">
								<input type="text" 
									   id=""
									   value="${boardDTO.gbuy_subject}" 
			                           name="product_name"
			                           style="width:400px; 
			                                  height:30px;
			                                  border:none;
			                                  border-right:0px; 
			                                  border-top:0px; 
			                                  boder-left:0px; 
			                                  boder-bottom:0px;
			                                  background-color:transparent;"
			                           readonly>
							</td>
						</tr>
						<tr>
							<td>주문수량</td>
							<td style="text-align: center;">
								<input type="text"
								id="product_count" 
								value="${final_qty}" 
								name="order_qty"
								style="width:400px; 
									   height:30px;
									   border:none;
									   border-right:0px; 
									   border-top:0px; 
									   boder-left:0px; 
									   boder-bottom:0px;
									   background-color:transparent;"
								readonly>
							</td>
						</tr>
						<tr>
							<td>주문금액</td>
							<td style="text-align: center;">
								<input type="hidden" 
								       id="product_total_amount" 
								       value="${final_price}" 
								       name="amount" 
								       readonly>
						        <input type="text"
									   value="<fmt:formatNumber 
									   value="${final_price}" 
									   pattern="#,###"/>원"
									   style="width:400px; 
									          height:30px;
									    	  border:none;
									  		  border-right:0px; 
									   		  border-top:0px; 
									  		  boder-left:0px; 
									   		  boder-bottom:0px;
									   		  background-color:transparent;"
									   readonly>	   
							</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<div class="container">
								<td style="text-align: center;">
								<input type="text"
									   id="sample4_postcode"
									   placeholder="우편번호"
									   name="zipcode"
									   style="width:281px; height:30px;background-color:Gainsboro"
									   readonly>
								<input type="button" 
									   onclick="sample4_execDaumPostcode()" 
									   value="우편번호 찾기"
									   class="w-btn-reset w-btn-gray">
								<br>
								<input type="hidden"
									   id="sample4_jibunAddress"
									   placeholder="지번주소"
									   style="background-color:Gainsboro"
									   readonly>
								<span id="guide"
								      style="color: #999; display: none">
								</span>
								</td>
							</div>
						</tr>
						<tr>
							<td>주소</td>
							<td style="text-align: center;">
							<input type="text"
								   id="sample4_roadAddress" 
								   placeholder="도로명주소" 
								   name="address"
								   style="width:400px; height:30px; background-color:Gainsboro"
								   readonly>
							<br>			  
							<input type="text"
								   id="sample4_detailAddress"
								   placeholder="상세주소"
								   name="detail_address"
								   style="width:400px; height:30px;"
								   onkeyup="characterCheck(this)"
								   onkeydown="characterCheck(this)">
							<input type="hidden"
								   id="sample4_extraAddress"
								   placeholder="참고항목"
								   style="background-color:Gainsboro"
								   readonly>
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td style="text-align: center;">
								<input type="text"
									   name="phone_no" 
									   id="phone_no" 
									   placeholder="숫자만 입력하세요"
									   style="width:400px; height:30px;"										
									   value=""
									   onkeyup="characterCheck_phone(this)"
								   	   onkeydown="characterCheck_phone(this)">
							</td>
						</tr>
					</table>
			</div>
		</div>
		
		<br>
		<div class="" style="text-align: center;">
			<div>
				<input type="button" 
					   id="check_module" 
					   class="w-btn w-btn-buy-green" 
					   value="바로 구매하기"
					   onclick="delivery_data_check()">
				</form>
		<script>
				var price_check = document.getElementById("Gbuy_price");
				var product_count_check = document.getElementById("product_count");
	    		var final_price_check = document.getElementById("product_total_amount");
	    		var user_id_check = document.getElementById("user_id");
	    		var phone_no_check = document.getElementById("phone_no");
	    		var sample4_postcode_check = document.getElementById("sample4_postcode");
	    		var sample4_roadAddress_check = document.getElementById("sample4_roadAddress");
	    		var sample4_detailAddress_check = document.getElementById("sample4_detailAddress");
	    		
	    		
	    	   //상품정보 위변조 검사
	    	   if(final_price_check.value == (price_check.value*product_count_check.value+3000)){
	    		   
	    		   
	    		   //배송정보 입력 검사
	    		   function delivery_data_check(){
		    			
	    	    	   if((user_id_check.value != "" && user_id_check.value != null) &&
	        			  (phone_no_check.value != "" && phone_no_check.value != null) &&
	        			  (sample4_postcode_check.value != "" && sample4_postcode_check.value != null) &&
	        			  (sample4_roadAddress_check.value != "" && sample4_roadAddress_check.value != null) &&
	        			  (sample4_detailAddress_check.value != "" && sample4_detailAddress_check.value != null)
	    	    	   
	    	    	   ){  
	    	    		   $("#check_module").click(function () {
	    	                    var IMP = window.IMP; 
	    	                    IMP.init('imp82814328');
	    	                    var userid = $('#user_id').val();
	    	    				var phone_no = $('#phone_no').val();
	    	                    var zipcode = $('#sample4_postcode').val();
	    	                    var address = $('#sample4_roadAddress').val() + $('#sample4_jibunAddress').val() + $('#sample4_detailAddress').val();
	    	                    var name = '${boardDTO.gbuy_subject}';
	    	                    IMP.request_pay({
	    	                        pg: 'inicis', 
	    	                        pay_method: 'card',
	    	                        merchant_uid: 'merchant_' + new Date().getTime(),
	    	                        name: name, //결제창에서 보여질 이름
	    	                        amount: ${final_price},  //가격
	    	                        buyer_email: '',
	    	                        buyer_name: userid,
	    	                        buyer_tel: phone_no,
	    	                        buyer_addr: address,
	    	                        buyer_postcode: zipcode,
	    	                        m_redirect_url: ''
	    	                    }, function (rsp) {
	    	                        console.log(rsp);
	    	                        if (rsp.success) {
	    	                            var msg = '결제가 완료되었습니다.';
	    	                            msg += '고유ID : ' + rsp.imp_uid;
	    	                            msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	                            msg += '결제 금액 : ' + rsp.paid_amount;
	    	                            msg += '카드 승인번호 : ' + rsp.apply_num;
	    	                            alert(msg);
	    	                            $("#pay_form").submit();
	    	                        } else {
	    	                            var msg = '결제에 실패하였습니다.';
	    	                            msg += '에러내용 : ' + rsp.error_msg;
	    	                            alert(msg);
	    	                        }
	    	                    });
	    	                    });
	    	    	   
	    	    	   
	    	    	   }else{
	    	    		   //배송정보 입력 미완시 팝업
	    	    		   alert('배송정보를 입력해 주세요');
	    	    	   } 
	    	       	   } 
	    		   
	    	   }else{
	    		   //상품정보 위변조시 팝업
	    		   alert('상품정보가 일치하지 않습니다.')
	    		   location.href='${pageContext.request.contextPath}/GB/GbuyMain';
	    	   }
	    		
		</script>
			
					<a href="javascript:history.back();">
						<input type="button" class="w-btn w-btn-indigo" value="취소하기">
					</a>
			</div>
		</div>
		<br>

		<!-- footer 시작 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- footer 종료 -->
	</div>
	<!--스크립트 적용 -->
	<script src="js/main.js">
	</script>
	<!-- 부트스트랩 스크립트 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
</body>
</html>