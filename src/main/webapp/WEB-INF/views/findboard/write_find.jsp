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

	<!-- 실종지역 동적 selectbox ajax -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	// 시/도 select
	$(document).ready(function(){
		$('#province').focus(function(){//포커스 이벤트발생시 ajax 실행
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/provinceSelect',
				dataType:'json',
				success:function(rdata){
// 					$.each(배열이나 객체,function(배열의 인덱스, 배열의 값){}
					$.each(rdata,function(index,item){
						$('#province').append("<option value='"+item.address1+"'>"+item.address1+"</option>");
					});
				}
			});
		}); // provicne selected
		
		$('#province').change(function(){//province 변경 이벤트발생시 ajax 실행
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/citySelect',
				data:{"province":$('#province').val()},// request.setParameter("province", #province의 값)의 같음
				dataType:'json',
				success:function(rdata){
					$('#city').html("<option selected>시</option>");//화면초기화
					$.each(rdata,function(index,item){
						$('#city').append("<option value='"+item.address2+"'>"+item.address2+"</option>");
					});
				}
			});
		}); //city selected
		
		$('#city').change(function(){//city 변경 이벤트발생시 ajax 실행
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/townSelect',
				data:{"city":$('#city').val(),"province":$('#province').val()},// request.setParameter("city", #city의 값)의 같음
				dataType:'json',
				success:function(rdata){
					$('#town').html("<option selected>동</option>");//화면초기화
					$.each(rdata,function(index,item){
						$('#town').append("<option value='"+item.address3+"'>"+item.address3+"</option>");
					});
				}
			});
		}); //city selected
	}); // jQuery closed
			
</script>
<style>
	.dragAndDropDiv {
		border: 2px dashed #92AAB0;
		width: 650px;
		height: 200px;
		color: #92AAB0;
		text-align: center;
		vertical-align: middle;
		padding: 10px 0px 10px 10px;
		font-size:200%;
		display: table-cell;
	}
	.progressBar {
		width: 200px;
		height: 22px;
		border: 1px solid #ddd;
		border-radius: 5px; 
		overflow: hidden;
		display:inline-block;
		margin:0px 10px 5px 5px;
		vertical-align:top;
	}
	 
	.progressBar div {
		height: 100%;
		color: #fff;
		text-align: right;
		line-height: 22px; /* same as #progressBar height if we want text middle aligned */
		width: 0;
		background-color: #0ba1b5; border-radius: 3px; 
	}
	.statusbar{
		border-top:1px solid #A9CCD1;
		min-height:25px;
		width:99%;
		padding:10px 10px 0px 10px;
		vertical-align:top;
	}
	.statusbar:nth-child(odd){
		background:#EBEFF0;
	}
	.filename{
		display:inline-block;
		vertical-align:top;
		width:250px;
	}
	.filesize{
		display:inline-block;
		vertical-align:top;
		color:#30693D;
		width:100px;
		margin-left:10px;
		margin-right:5px;
	}
	.abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                //drag 영역 클릭시 파일 선택창
                objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
                });
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.target.files;
                    handleFileUpload(files,objDragAndDrop);
                });
				function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                 
                   }
                }
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
					this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                
                function sendFileToServer(formData,status)
                {
                    var uploadURL = '${pageContext.request.contextPath }/findboard/write_find_filePro'; //Upload URL
                    var extraData ={}; //Extra Data.
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                 
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });
        </script>
                

	<!-- 유효성 검사 -->
<!-- 
 	$(document).ready(function(){
 		$('#f_eh').submit(function(){				
				if($('#animal_sort_eh').val()==""){
					alert("동물 종류를 선택해 주세요");
					return false;
				}
				if($('input[name=pet_name]').val()==""){
					alert("동물 이름을 입력해 주세요");
					$("input[name=content]").focus();
					return false;
				}
// 				if($("input[name=pet_age]").val()==""){
// 					alert("동물 나이를 입력해 주세요");
// 					$('#pet_age').focus();
// 					return false;
// 				}
				if($("input:radio[name=pet_gender]").is('checked')==false){
					alert("동물 성별을 체크해 주세요");
					return false;
				}
				if($("input[name=missing_date]").val()==""){
					alert("실종날짜를 선택해 주세요");
					return false;
				}
				if(
					$("input[name=address]").val() || 
					$("input[name=address2]").val() || 
					$("input[name=detail_address]").val()==""){
					alert("실종지역을 기입해 주세요");
					return false;
				}
				if($("input[name=content]").val()==""){
					alert("상세 설명을 추가해 주세요");
					$("input[name=content]").focus();
					return false;
				}
				if($("input[name=contact]").val()==""){
					alert("연락수단을 추가해 주세요");
					$("input[name=contact]").focus();
					return false;
				}
 			});//
 		});//		
	</script>
 -->
 
</head>
  <body class="bg-light">
            <!-- header 시작-->
       	  <jsp:include page="../inc/top.jsp"></jsp:include> 
            <!-- header 종료 -->
            <!-- ------------------------------- -->
           <!-- 제목 시작 -->
			<div class="container">
			  <h1 class="sub-title">실종공고</h1>
			  <hr>
			</div>
			<!-- 제목 종료 -->
			<!-- 본문 시작 -->
            <div class="container p-5">

                <form action="${pageContext.request.contextPath}/findboard/write_findPro" method="post" id="f_eh" enctype="multipart/form-data">
                   <input type="hidden" value="${sessionScope.nickname}" name="nickname">
                    <div class="row g-5">
                         <!--왼쪽여백-->
                        <div class="col-md-1 col-lg-3"></div>
                        <!--작성 form-->
                        <div class="col-md-10 col-lg-6">
                           <!--해결,미해결 토글버튼 (클릭시 글자도 바뀌어야 함)-->
                            <div class="row">
                                <div class="col">
<!--                                     <input class="form-check-input" type="checkbox" role="switch" id="swtich_eh" value="0" name="result"> -->
<!--                                     <label class="form-check-label" for="switch_eh">미해결</label> -->
                                </div>
                            <!--사례금 유무-->
                                <div class="col input-group mb-3">
                                    <label class="input-group-text">사례금</label>
                                    <input type="text" class="form-control" placeholder="만원" name="reward">
                                </div>
                            </div>
                            <!--동물 종류 select -->
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="animal_sort_eh">동물 종류</label>
                                    <select class="form-select" id="animal_sort_eh" name="pet_type">
                                        <option value="" selected>선택해주세요</option>
                                        <option value="0">개</option>
                                        <option value="1">고양이</option>                
                                        <option value="2">기타</option>                
                                    </select>
                            </div>
                            <!--동물 이름, 동물 나이 text-->  
                            <div class="input-group mb-3">
                                <label class="input-group-text"> 동물 이름 </label>
                                <input type="text" class="form-control" placeholder="이름" name="pet_name">
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text"> 동물 나이 </label>
                                <input type="text" class="form-control" placeholder="숫자만 입력" name="pet_age">
                                <select class="form-select" name="pet_age2">
                                    <option value="개월">개월</option>
                                    <option value="살">살(년)</option>
                                </select>
                            </div>
                            <!--동물 성별 체크 radio-->
                            <div class="input-group mb-3"> 
                                <div class="input-group-text">동물 성별</div>
                                <div class="form-control">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="ra1_eh" value="0" name="pet_gender">
                                        <label class="form-check-label" for="ra1_eh">암컷</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="ra2_eh" value="1" name="pet_gender">
                                        <label class="form-check-label" for="ra2_eh">수컷</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="ra3_eh" value="2" name="pet_gender">
                                        <label class="form-check-label" for="ra3_eh">모름</label>
                                    </div>
                                </div>
                            </div>
                            <!--실종날짜-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">실종 날짜</label>
                                <input type="date" class="form-control" name="missing_date">
                            </div>
                            <!--실종지역 selectbox -->
                            <div class="input-group">
                                <label class="input-group-text">실종 지역</label>
                                    <select class="form-select" name="address1" id="province">
                                        <option value="">지역</option>
                                    </select>
                                    <select class="form-select" name="address2" id="city">
                                        <option selected>시</option>
                                    </select>
                                    <select class="form-select" name="address3" id="town">
                                        <option selected>동</option>
                                    </select>
                            </div>
                            <div class="input-group">
                            </div>
                            <!--실종지역 상세 위치-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">상세 위치</label>
                                <input type="text" class="form-control" placeholder="OO초등학교 인근" name="detail_address">
                            </div>
                            <!--기타 특징-->
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="ta_eh">기타 특징</label>
                                <textarea rows="4" class="form-control" aria-label="With textarea" id="ta_eh"
                                placeholder="중성화 유무, 자주가는 산책길, 좋아하는 음식 등 동물에 대한 상세정보" name="content"></textarea>
                            </div>
                            <!--연락가능 수단-->
                            <div class="input-group mb-3">
                                <label class="input-group-text">연락 가능 수단</label>
                                <input type="text" class="form-control" placeholder="전화번호, 이메일, 카카오톡 아이디 등" name="contact">
                            </div>
                            
                            <!--(구현못함 ㅠㅠ) file 드래그앤드롭-->
                            <!-- 
								<div id="drop" style="border:1px solid black; width:100%; height:auto; padding:3px">
								<p>
									<small style="color: gray; font-size: 13px;">
	                            	반려동물의 사진을 드래그하여 첨부해주세요<br>
	                            	업로드 가능 이미지 확장자 ( gif, jpeg, jpg, png, bmp )</small>
                            	</p>
                            	<p style="background-color:lightgrey;"><i>첨부파일</i>
                            	<button type="button" value="확인" id="save">저장</button></p>
								</div>                            
                             -->
                             
                             <!-- 기본 multiple file 전달 -->
                             <div id="fileUpload" class="dragAndDropDiv">업로드할 이미지를 드래그하여 넣기 <br> (1장씩 첨부, 최대 3장)</div>
        						<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>

                            <!--submit 버튼-->
                            <div class="text-center p-2">
                                <input type="submit" id="btn_eh" value="글쓰기"> 
                                <input type="button" id="btn_eh" value="취소" 
                                onclick="location.href='${pageContext.request.contextPath}/findboard/list'">
                            </div>
                        </div>
                        <!--오른쪽여백-->
                        <div class="col-md-1 col-lg-3"></div>
                    </div>
                </form>
            </div>

	 	 
	    <!-- (구현못함ㅠㅠ)file drag & drop 스크립트 적용 
	    
   	 	var fileList = [];
    	var $drop = $("#drop");
    	
	    $drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
	    $(this).addClass('drag-over');
	    }).on("dragleave", function(e) { //드래그 요소가 나갔을때
	    $(this).removeClass('drag-over');
	    }).on("dragover", function(e) {
	    e.stopPropagation();
	    e.preventDefault();
	    }).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
	    e.preventDefault();
	    $(this).removeClass('drag-over');
	    
	    var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
	    //확장자 확인하기 
	    if(files !=null && files !=undefined){
		    	var tag="";	
			    for(var i = 0; i < files.length; i++) {
		    		var f = files[i];
		    		var ext = f.name.split('.').pop().toLowerCase();
		    		if(ext == 'png' || ext == 'jpeg' || ext == 'jpg' || ext == 'bmp' || ext == 'gif'){
		    			fileList.push(f);
		    			var fileName = f.name;
		    			var fileSize = f.size /1024/1024;
		    			fileSize = fileSize<1? fileSize.toFixed(3) : fileSize.toFixed(1);
		    			tag += "<span>"+fileName+" "+fileSize+"MB </span><button type='button' class='deletefiles'>삭제</button><br>";
		    		} else {
		    			alert("지원하는 파일 확장자가 아닙니다");
			    	}
		    	$(this).append(tag);
	    		}
    		}
	    }); // drop closed
		  
		   //저장하기
	   $(document).on("click","#save", function(){
		  var formData = new FormData();
		  if(fileList.length > 0){
			  fileList.forEach(function(f){
				 formData.append("fileList",f); 
			  });
		  } 
		  $.ajax({
			url: "${pageContext.request.contextPath}/findboard/fileupload",
			data: formData,
			type:'POST',
			enctype:'multipart/form-data',
			processData:false,
			contentType:false,
			dataType:'json',
			cache:false,
			success:function(rdata){
				 alert("저장되었습니다");
			 	}, 
		 	error:function(rdata){
				 alert("오류발생");
			 	}
		  	}); // ajax closed
	   	}); // document.on closed
	
    	$(document).on("click",".deletefiles", function(e) {
    		alert("삭제 클릭시 파일 삭제 + 실제 업로드 파일도 제거 구현해야함");

		});
	   	
    	(구현못함ㅠㅠ)file drag & drop 스크립트 적용 끝------------ -->  
	    
		  
            <!-- ------------------------------- -->
            <!-- 본문 종료-->
            <!-- ------------------------------- -->
            <!-- footer 시작 -->
       	  <jsp:include page="../inc/bottom.jsp"></jsp:include>
	         <!-- footer 종료 -->

        <!--스크립트 적용 -->
        <script type="text/javascript" defer src="${pageContext.request.contextPath }/resources/script/main.js"></script>
        <!-- 부트스트랩 스크립트 적용 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>