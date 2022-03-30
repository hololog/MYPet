<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>main</title>
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- 클래식 CK에디터 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <!-- 에디터 넓이 높이 조절 -->
    <style>
      .ck.ck-editor {
          /* max-width: 500px; */
      }
      .ck-editor__editable {
          min-height: 300px;
      }
    </style>
  <body>
	
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

        <!-- ------------------------------- -->
        <!-- 본문 시작-->
        <!-- ------------------------------- -->

    <div class="container py-5">
      <h3 class="text-center  nav justify-content-center bg-light" style="color: #3f51b5;">
        글작성</h3>
        <br>

      <div class="row g-3">
        <div class="col-sm-9">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text ">제목</label>
            </div>            
            <input type="text" class="form-control">              
          </div>
          <!-- 글종류 선택 -->
        </div>
        <div class="col-sm-3">
            <div class="input-group mb-3">
                <select class="custom-select" id="inputGroupSelect03">
                 <option selected>글종류</option>
                  <option value="1">자유</option>
                  <option value="2">꿀팁</option>
                  <option value="3">입양후기</option>
                  <option value="4">공지</option>
                </select>  
            </div>
        </div> 
      </div>
      
      <hr>
      
      <div class="mt-3">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroupFileAddon01">사진</span>
          </div>
          <div class="custom-file">
              &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
          </div>
        </div>
      </div>

      <div class="col-12" id="editor">
        <p>내용</p>
      </div>

      
     <br>
     <br>

      <div class="col-6.5 d-flex  align-items-center flex-wrap gap-2 justify-content-center">
        <button type="button" class="btn btn-outline-primary" style="width: 20%; font-weight: bold;">
          등   록          
        </button>
        <button type="button" class="btn btn-outline-primary" style="width: 20%; font-weight: bold;  ">
          목록가기         
        </button>
      </div> 
      
    </div>
    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ))
            .catch( error => {
                console.error( error );
            } );
    </script>
   
       <!-- 게시판 끝 -->
        
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
