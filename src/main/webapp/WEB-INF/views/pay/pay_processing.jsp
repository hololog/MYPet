<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>결제 페이지</title>
            <!-- css스타일 적용 -->
            <link
                rel="stylesheet"
                href="${pageContext.request.contextPath }/resources/css/style.css"/>
            <link
                rel="stylesheet"
                href="${pageContext.request.contextPath }/resources/css/main.css"/>
            <!-- 부트스트랩 적용 -->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
                <!-- 부트스트랩 아이콘 -->
                <link
                    rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                    <script
                        type="text/javascript"
                        src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
                    <script
                        type="text/javascript"
                        src="${pageContext.request.contextPath }/resources/script/main.js"></script>

                    <link
                        type="text/css"
                        rel="stylesheet"
                        href="https://t1.kakaocdn.net/checkout/pay/_sdk/style.css">
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

                        <!-- 아임포트 라이브러리 -->
                        <!-- jQuery -->
                        <script
                            type="text/javascript"
                            src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
                        <!-- iamport.payment.js -->
                        <script
                            type="text/javascript"
                            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

                        <script>
                            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                            function sample4_execDaumPostcode() {
                                new daum
                                    .Postcode({
                                        oncomplete: function (data) {
                                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 도로명 주소의 노출 규칙에 따라 주소를 표시한다. 내려오는 변수가 값이
                                            // 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                                            var extraRoadAddr = ''; // 참고 항목 변수

                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외) 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                                extraRoadAddr += data.bname;
                                            }
                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                                extraRoadAddr += (
                                                    extraRoadAddr !== ''
                                                        ? ', ' + data.buildingName
                                                        : data.buildingName
                                                );
                                            }
                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                            if (extraRoadAddr !== '') {
                                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                                            }

                                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                            document
                                                .getElementById('sample4_postcode')
                                                .value = data.zonecode;
                                            document
                                                .getElementById("sample4_roadAddress")
                                                .value = roadAddr;
                                            document
                                                .getElementById("sample4_jibunAddress")
                                                .value = data.jibunAddress;

                                            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
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
                                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
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

                    </head>
                    <body>
                        <div>
                            <!-- header 시작 -->
                            <jsp:include page="../inc/top.jsp"></jsp:include>
                            <!-- header 종료 -->
                            <br><br><br><br><br><br>
                                <div class="container">
                                    <div style="text-align: center; font-family:fantasy;">

                                        <table class="table table-responsive" style="text-align: right;">

                                            <tr>
                                                <h3 style="color: #3f51b5;">배송정보</h3>
                                            </tr>
                                            <tr>
                                                <td >수령인</td>
                                                <td style="text-align: center;">
                                                    <input type="text" id="user_id" value=""></td>
                                                    <td></td>

                                                </tr>
                                                <tr>
                                                    <td>상품명</td>
                                                    <td style="text-align: center;">${boardDTO.gbuy_subject}</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>주문수량</td>
                                                    <td style="text-align: center;" id="product_count">${final_qty}</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>주문금액</td>
                                                    <td style="text-align: center;" id="product_total_amount">${final_price}</td>
                                                    <td></td>
                                                </tr>
                                                <tr>

                                                    <td>주소</td>
                                                    <div class="container">
                                                        <td style="text-align: center;">
                                                            <input type="text" id="sample4_postcode" placeholder="우편번호">
                                                                <input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기">
                                                                    <br>
                                                                        <textarea rows="1" cols="50" id="sample4_roadAddress" placeholder="도로명주소"></textarea>
                                                                        <textarea rows="1" cols="50" id="sample4_jibunAddress" placeholder="지번주소"></textarea>

                                                                        <span id="guide" style="color:#999;display:none"></span>

                                                                    </td>
                                                                </div>
                                                            </tr>
                                                            <tr>
                                                                <td>상세주소</td>
                                                                <td style="text-align: center;">
                                                                    <input type="text" id="sample4_detailAddress" placeholder="상세주소">
                                                                        <input type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>전화번호</td>
                                                                        <td style="text-align: center;">
                                                                            <input type="text" name="" id="phone_no" value=""></td>
                                                                            <td></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>

                                                            </div>
				
													
				
				
                                                            <br>
                                                                <!-- 결제방식 선택 -->
                                                                <div class="" style="text-align: center;">
                                                                    <div>
                                                                        <button id="check_module" type="button" class="btn btn-success">바로 구매하기</button>

                                                                        <script>
                                                                            $("#check_module").click(function () {
                                                                                var IMP = window.IMP; // 생략가능
                                                                                IMP.init('imp82814328');
                                                                                // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용 i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
                                                                                //var userId = document.getElementByid('user_id').value;
                                                                                var userId = $('#user_id').val();
                                                                                var phone_no = $('#phone_no').val();
                                                                                var postal_code = $('#sample4_postcode').val();
                                                                                var address = $('#sample4_roadAddress').val() + $('#sample4_jibunAddress').val() + $('#sample4_detailAddress').val();                                                                            
                                                                                IMP.request_pay({
                                                                                    pg: 'inicis', // version 1.1.0부터 지원.
                                                                                    /* 'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔 */
                                                                                    pay_method: 'card',
                                                                                    /* 'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제 */
                                                                                    merchant_uid: 'merchant_' + new Date().getTime(),
                                                                                    /* merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면
 * 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
 */
                                                                                    name: '주문명:결제테스트',
                                                                                    //결제창에서 보여질 이름
                                                                                    amount: ${final_price},
                                                                                    //가격
                                                                                    buyer_email: '',
                                                                                    buyer_name: userId,
                                                                                    buyer_tel: phone_no,
                                                                                    buyer_addr: address,
                                                                                    buyer_postcode: postal_code,
                                                                                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                                                                                    /* 모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로
 * callback함수로 결과가 떨어짐)
 */
                                                                                }, function (rsp) {
                                                                                    console.log(rsp);
                                                                                    if (rsp.success) {
                                                                                        var msg = '결제가 완료되었습니다.';
                                                                                        msg += '고유ID : ' + rsp.imp_uid;
                                                                                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                                                                                        msg += '결제 금액 : ' + rsp.paid_amount;
                                                                                        msg += '카드 승인번호 : ' + rsp.apply_num;
                                                                                        alert(msg);
                                                                                    } else {
                                                                                        var msg = '결제에 실패하였습니다.';
                                                                                        msg += '에러내용 : ' + rsp.error_msg;
                                                                                        alert(msg);
                                                                                    }
                                                                                    
                                                                                });
                                                                            });
                                                                        </script>
                                                                        <a href="javascript:history.back();">
                                                                            <button type="button" class="btn">
                                                                                취소하기
                                                                            </button>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <br>

                                                                    <!-- footer 시작 -->
                                                                    <jsp:include page="../inc/bottom.jsp"></jsp:include>
                                                                    <!-- footer 종료 -->
                                                                </div>
                                                                <!--스크립트 적용 -->
                                                                <script src="js/main.js"></script>
                                                                <!-- 부트스트랩 스크립트 적용 -->
                                                                <script
                                                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                                                                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                                                                    crossorigin="anonymous"></script>
                                                            </body>
                                                        </html>