<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>write_find</title>
	<!-- css스타일 적용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<!-- 부트스트랩 적용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
  <body class="bg-light">
            <!-- header 시작-->
       	  <jsp:include page="../inc/top.jsp"></jsp:include>   
            <!-- header 종료 -->
            <!-- ------------------------------- -->
            <!-- 본문 시작 -->
            <!-- ------------------------------- -->
           <!-- 제목 시작 -->
			<div class="container">
			  <h1 class="sub-title">실종공고</h1>
			  <hr>
			</div>
			<!-- 제목 종료 -->
            <div class="container p-5">
            
                <form action="${pageContext.request.contextPath}/findboard/write_findPro" method="post" enctype="multipart/form-data">
                    <!--작성자 닉네임 가져오기-->
                    <input type="hidden" name="nickname" value="${sessionScope.id}">
                    <!--작성 date 가져오기 timestamp-->
                    <input type="hidden" value="date">
                    
                    <div class="row g-5">
                         <!--왼쪽여백-->
                        <div class="col-md-1 col-lg-3"></div>
                        <!--작성 form-->
                        <div class="col-md-10 col-lg-6">
                            <!--해결,미해결 토글버튼 (클릭시 글자도 바뀌어야 함)-->
                            <div class="row">
                                <div class="col form-check form-switch mb-3" id="switch_eh">
                                    <input class="form-check-input" type="checkbox" role="switch" id="swtich_eh">
                                    <label class="form-check-label" for="switch_eh">미해결</label>
                                </div>
                            <!--사례금 유무-->
                                <div class="col input-group mb-3">
                                    <label class="input-group-text">사례금</label>
                                    <input type="text" class="form-control" placeholder="만원">
                                </div>
                            </div>
                            <!--동물 종류 select -->
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="animal_sort_eh">동물 종류</label>
                                    <select class="form-select" id="animal_sort_eh" name="animal_category">
                                        <option selected>선택해주세요</option>
                                        <option name="dog" value="0">개</option>
                                        <option name="cat" value="1">고양이</option>                
                                        <option name="etc" value="2">기타</option>                
                                    </select>
                            </div>
                            <!--동물 이름, 동물 나이 text-->  
                            <div class="input-group mb-3">
                                <label class="input-group-text"> 동물 이름 </label>
                                <input type="text" class="form-control" placeholder="이름">
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text"> 동물 나이 </label>
                                <input type="text" class="form-control" placeholder="숫자만 입력">
                                <select class="form-select">
                                    <option>개월</option>
                                    <option>년(세)</option>
                                </select>
                            </div>
                            <!--동물 성별 체크 radio-->
                            <div class="input-group mb-3"> 
                                <div class="input-group-text">동물 성별</div>
                                <div class="form-control">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" id="ra1_eh" value="0">
                                        <label class="form-check-label" for="ra1_eh">암컷</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" id="ra2_eh" value="1">
                                        <label class="form-check-label" for="ra2_eh">수컷</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" id="ra3_eh" value="2">
                                        <label class="form-check-label" for="ra3_eh">모름</label>
                                    </div>
                                </div>
                            </div>
                            <!--실종날짜-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">실종 날짜</label>
                                <input type="date" class="form-control">
                            </div>
                            <!--실종지역 select (JQuery or API 적용 예정)-->
                            <div class="input-group">
                                <label class="input-group-text">실종 지역</label>
                                    <select class="form-select">
                                        <option selected>시</option>
                                        <option value="">부산광역시</option>
                                        <option value="">서울특별시</option>
                                        <option value="">광주광역시</option>
                                    </select>
                                    <select class="form-select">
                                        <option selected>구</option>
                                        <option>수영구</option>
                                        <option>부산진구</option>
                                    </select>
                                    <select class="form-select">
                                        <option selected>동</option>
                                        <option>광안동</option>
                                        <option>망미동</option>
                                    </select>
                            </div>
                            <!--실종지역 상세 위치-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">상세 위치</label>
                                <input type="text" class="form-control" placeholder="OO초등학교 인근">
                            </div>
                            <!--기타 특징-->
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="ta_eh">기타 특징</label>
                                <textarea rows="4" class="form-control" aria-label="With textarea" id="ta_eh"
                                placeholder="중성화 유무, 자주가는 산책길, 좋아하는 음식 등 동물에 대한 상세정보"></textarea>
                            </div>
                            <!--연락가능 수단-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">연락 가능 수단</label>
                                <input type="text" class="form-control" placeholder="전화번호, 이메일, 카카오톡 아이디 등">
                            </div>
                            <!--file 드래그앤드롭-->
                            <div class="dropzone mb-5" id="dropZone">
                                <div id="uploadDiv" class="dz-default dz-message db">
                                    파일을 끌어 올려 업로드 해주세요.<br> 
                                </div>
                                <div id="imgDiv" class="dn"></div>
                                <small style="color: gray; font-size: 13px;">업로드 가능 이미지 확장자 ( gif, jpeg, jpg, png, bmp )</small>
                            </div>

                            <!--submit 버튼-->
                            <div class="text-center p-2">
                                <input type="submit" id="btn_eh" name="submit"> 
                                <input type="button" id="btn_eh" name="cancel" value="cancel"> <!--클릭시 메인으로-->
                            </div>
                        </div>
                        <!--오른쪽여백-->
                        <div class="col-md-1 col-lg-3"></div>
                    </div>
                </form>
            </div>
            
            <!-- ------------------------------- -->
            <!-- 본문 종료-->
            <!-- ------------------------------- -->
            <!-- footer 시작 -->
       	  <jsp:include page="../inc/bottom.jsp"></jsp:include>
	         <!-- footer 종료 -->
      

        <!--스크립트 적용 -->
        <script src="js/main.js"></script>
        <!-- 부트스트랩 스크립트 적용 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>