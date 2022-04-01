<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Main</title>
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
</head>
<body>
	<div>
	<!-- 본문 시작-->
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->
    
   			 <!-- 제목 시작 -->
            <div class="container" >
                <h1 class="sub-title">판매등록</h1>
                <hr>
            </div>
            <!-- 제목 종료 -->
<form action="${pageContext.request.contextPath }/GB/GBuywritePro" method="post">
            <div class="container p-2" style="border: 1px solid red;">
                <div class="row g-5">
                    <!--파일 미리보기 img-->
                    <!-- <hr> -->
                    <div class="col-sm-12 col-md-12 col-lg-6 order-lg-last p-5">
                        <h6 class="text-center p-3">
                            <i>메인이미지</i>
                        </h6>
                        <!--첨부 파일 이미지 미리보기. 업로드 전 no image 보여주기-->
                        <img src="img/dog1.jpg" class="img-thumbnail mb-3" alt="파일미리보기">
                        <input type="file" name="file" class="form-control mb-3">
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 p-5">
                        <!--해결,미해결 토글버튼 (클릭시 글자도 바뀌어야 함)-->
                        <div class="row">
                            <!--상품명-->
                            <div class="col input-group mb-3">
                                <input type="text" name="" class="form-control" placeholder="상풍명">
                            </div>
                        </div>
                        <!--상품간략설명-->
                        <div class="input-group mb-3">
                            <textarea rows="2" name="" class="form-control" aria-label="With textarea" placeholder="상품간략소개"></textarea>
                        </div>
                        <!--가격-->
                        <div class="input-group mb-5">
                            <input type="text" name="" class="form-control" placeholder="가격">
                        </div>
                        <div class="input-group mb-5">
                            <input type="text" name="" class="form-control" placeholder="목표수">
                        </div>
                        <div class="input-group mb-5">
                            <input type="text" name="" class="form-control" placeholder="재고수">
                        </div>
                        <!--상세설명-이미지파일--->
                        <div>
                            <input type="file" name="file2">
                        </div>
                        <br>
                        <!--상품등록 결정 버튼-->
                        <p>
                        	<input type="submit" value="판매등록" class="btn btn-primary btn-lg">
							<input type="button" value="취소" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath }/GB/GbuyMain'">
                        </p>
                       
                    </div>
                </div>
            </div>
</form>
    <!-- 공동구매끝 -->
	<!-- 본문종료 종료 -->  
    </div>
    <!-- ------------------------------- -->
    <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
<!-- 부트스트랩 스크립트 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous">
</script>
</body>
</html>