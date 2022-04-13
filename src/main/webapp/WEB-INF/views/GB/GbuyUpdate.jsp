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
<!-- 메인이미지1 미리보기 스크립트 -->
<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.preview')
      .attr('src', e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
  }
}
</script>
<!--  상세이미지2 미리보기 스크리브 -->
<script>
function readURL2(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.preview2')
      .attr('src', e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
  }
}
</script>

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
<form action="${pageContext.request.contextPath }/GB/GbuyUpdatePro">
<input type="hidden" name="gbuy_num" value="${boardDTO.gbuy_num}">
            <div class="container p-2" style="border: 1px solid red;">
                <div class="container col-md-10">
                <div class="container row col-md-12">
                    <!--파일 미리보기 img-->
                    <div class=" col-md-6" id=kpo style="border: 1px solid red;">
                            <!--상품명-->
                            <br><br>
                            <div class="col input-group mb-3 ">
                           		<label class="input-group-text">상품이름</label>
                                <input type="text" name="Gbuy_subject" class="form-control" value="${boardDTO.gbuy_subject}">
                            </div>
                        <!--가격-->
                            <div class="col input-group mb-3 ">
                           		<label class="input-group-text">상품가격</label>
                            	<input type="text" name="Gbuy_price" class="form-control" value="${boardDTO.gbuy_price}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                             	<label class="input-group-text">원</label>
                        	</div>
                            <div class="col input-group mb-3 ">
                           		<label class="input-group-text">목표수량</label>
                            	<input type="text" id="b" name="Gbuy_tcount" class="form-control" value="${boardDTO.gbuy_tcount}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        	</div>
                            <div class="col input-group mb-3 ">
                           		<label class="input-group-text">재고수량</label>
                            	<input type="text" id="a" name="Gbuy_count" class="form-control" value="${boardDTO.gbuy_count}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                       		</div>
                    </div>
                    <div class="col-md-6 btn text-lg-end ">
             			<img style="width: 300px;" class="preview" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image" >
      					<input type="file" name="Gbuy_file" onchange="readURL(this);">
    				</div>
                        <br>
                        <!--상품등록 결정 버튼-->
                        <p>
                        	<input type="submit" value="수정완료" class="btn btn-primary btn-lg">
							<input type="button" value="수정취소" class="btn btn-primary btn-lg" onclick="history.back(-1);">
                        </p>
                </div>
               	</div>
           </div>
						<!--상세설명-이미지파일--->
                <div class="col12"style="text-align: center;">
					<img style="width: 1000px;" class="preview2" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					<input style="display: block;" type="file" name="Gbuy_file2" onchange="readURL2(this);" >
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