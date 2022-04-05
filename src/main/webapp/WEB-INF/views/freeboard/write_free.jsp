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
    <!-- summernote -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


  <body>
	
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

        <!-- ------------------------------- -->
        <!-- 본문 시작-->
        <!-- ------------------------------- -->

     <form action="${pageContext.request.contextPath }/freeboard/write_freePro" method="post">
    <div class="container py-5" name="board_code">
      <h3 class="text-center  nav justify-content-center bg-light" style="color: #3f51b5;">
        글작성</h3>
        <br>
	<input type="text"name="nickname"id="nicename">
      <div class="row g-3">
        <div class="col-sm-9">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text ">제목</label>
            </div>            
            <input type="text" class="form-control"name="subject">              
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
        
       <textarea name="content" id="summernote" placeholder="내용을 입력해주세요." >
      

       </textarea>
          
      </div>
      </div>

      
     <br>
     <br>
	
     <div class="col-6.5 d-flex  align-items-center flex-wrap gap-2 justify-content-center">
        <button type="submit"  class="btn btn-outline-primary" style="width: 20%; font-weight: bold;">
          등   록          
        </button>
        <button type="button" class="btn btn-outline-primary" style="width: 20%; font-weight: bold;  "
        onclick="location.href='${pageContext.request.contextPath }/freeboard/list_free'">
          목록가기         
        </button>
      </div> 
    
     <script>
    $(document).ready(function() {
    	 $('#summernote').summernote({
    	        placeholder: '글을 입력해주세요',
    	        tabsize: 2,
    	        height: 500
    	      });
    });
  </script>
<!--   <script> -->
<!-- // 	// 툴바생략 -->
<!-- // 	var setting = { -->
<!-- //             height : 300, -->
<!-- //             minHeight : null, -->
<!-- //             maxHeight : null, -->
<!-- //             focus : true, -->
<!-- //             lang : 'ko-KR', -->
<!-- //             toolbar : toolbar, -->
<!-- //             //콜백 함수 -->
<!-- //             callbacks : {  -->
<!-- //             	onImageUpload : function(files, editor, welEditable) { -->
<!-- //             // 파일 업로드(다중업로드를 위해 반복문 사용) -->
<!-- //             for (var i = files.length - 1; i >= 0; i--) { -->
<!-- //             uploadSummernoteImageFile(files[i], -->
<!-- //             this); -->
<!-- //             		} -->
<!-- //             	} -->
<!-- //             } -->
<!-- //          }; -->
<!-- //         $('#summernote').summernote(setting); -->
<!-- //         }); -->
        
<!-- //         function uploadSummernoteImageFile(file, el) { -->
<!-- // 			data = new FormData(); -->
<!-- // 			data.append("file", file); -->
<!-- // 			$.ajax({ -->
<!-- // 				data : data, -->
<!-- // 				type : "POST", -->
<!-- // 				url : "uploadSummernoteImageFile", -->
<!-- // 				contentType : false, -->
<!-- // 				enctype : 'multipart/form-data', -->
<!-- // 				processData : false, -->
<!-- // 				success : function(data) { -->
<!-- // 					$(el).summernote('editor.insertImage', data.url); -->
<!-- // 				} -->
<!-- // 			}); -->
<!-- // 		} -->
<!-- </script> -->
   </form>
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
