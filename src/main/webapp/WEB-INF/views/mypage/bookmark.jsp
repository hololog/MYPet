<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>bookmark</title>
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
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
	
	.menu-jd {margin: 20px 0 !important;}
	 
	.sidebar1 {
     display:block !important;
     padding-left: 0;}
     
     #sdb>li {/*border: 1px solid red; 
	    	 */	 display:inline-block;
	    		}
	   	 
	    .bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
	    }
	
	    @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	            font-size: 3.5rem;
	        }
	     .menu-jd {margin: 0 20px 0 20px;}   
	        
	    }
	    
	</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-jd.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sidebars.css">
</head>
<body>
	<div>
    <!-- header 시작 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

    <!-- ------------------------------- -->
    <!-- 본문 시작-->
    <!-- ------------------------------- -->
    <!-- 제목 시작 -->
    <div class="container">
      <h1 class="sub-title">즐겨찾기</h1>
      <hr>
    </div>
    <!-- 제목 종료 -->
    
    <!-- 사이드바 시작 -->
       <div class="row" style="padding-left: 15%; padding-right: 15%; column-gap: 25px; ">
            <div
                class="d-flex flex-column flex-shrink-0 p-4 col-md-2 menu-jd"
                style="min-width: 230px; max-height: 500px">
                <div class="Info" style="display: flex;">
                        <img
                            src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg"
                            alt=""
                            width="70"
                            height="70"
                            class="rounded-circle me-3 align-items-center">
                        <strong style="color: white;"><br>${sessionScope.nickname } 님</strong>
                </div>
                <hr>
              
                <ul class="nav nav-pills flex-column mb-auto sidebar1" id="sdb">
                    <li class="nav-item2">  
                        <a href="${pageContext.request.contextPath }/mypage/myinfo" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내정보
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/mylist" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내 글목록
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/mymisslist" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            내 실종공고
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/bookmark" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            즐겨찾기
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/amendpwd" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            비밀번호 변경
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/mypage/leave" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            </svg>
                            탈퇴
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 사이드바 끝 -->
        
        <!-- 즐겨찾기 수정 시작 -->
              <div
                class="border col"
                style=" padding-left: 8%; padding-top: 4%; padding-bottom: 4%;">
                
    					<c:set var="num"
						value="${pageDTO.count -(pageDTO.pageNum-1)* pageDTO.pageSize }" />
					
					<c:forEach var="fb" items="${findboardList}" varStatus="loop">
					
						<div class="row ListSH" id="refresh">
							<a type="hidden" data-result="${fb.result}"></a>
<!-- 							<div class="col-12 col-sm-7 p-2 position-relative"> -->
								<c:choose>
									<c:when test="${fileList[loop.index].filename ne null}">
										<a href="" data-bs-toggle="modal" class="openMod"
											data-bs-toggle="modal" 
											data-bs-target="#find_content" 
											id="marking"> <img class="img-fluid rounded"
											src="${fb.upload}"
											alt="실종동물사진" id="">
										</a>
									</c:when>
									<c:when test="${fileList[loop.index].filename eq null}">
									<a href="" data-bs-toggle="modal" class="openMod"
											data-bs-toggle="modal" data-test="${loop.count}"
											data-bs-target="#find_content"> <img
											class="img-fluid rounded"
											src="${fb.upload}"
											alt="실종동물사진" id="">
									</a>
									</c:when>
									
								</c:choose>
								
							<div class="col-12 col-sm-5 p-2" id="find-info-ksk">
								<div class="row p-2">
									<div class="col-6 col-sm-12">
										<h4>${fb.address}</h4>
									</div>
									<div class="col-6 col-sm-12">
										<h3>${fb.address2}</h3>
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-tags-fill"></i>
										<c:choose>
											<c:when test="${fb.pet_type eq 0}">개</c:when>
											<c:when test="${fb.pet_type eq 1}">고양이</c:when>
											<c:when test="${fb.pet_type eq 2}">기타</c:when>
										</c:choose>
										/
										<c:choose>
											<c:when test="${fb.pet_gender eq 0}">암컷</c:when>
											<c:when test="${fb.pet_gender eq 1}">수컷</c:when>
											<c:when test="${fb.pet_gender eq 2}">모름</c:when>
										</c:choose>
										/ ${fb.pet_age}
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-calendar3"></i>
											${fb.missing_date}
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-geo-alt"></i> ${fb.detail_address} 부근
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-coin"></i> 사례금 : <b>${fb.reward}</b> 만원
									</div>
								</div>
							</div>
						</div>
						<c:set var="num" value="${num-1 }" />
					</c:forEach>

					<!-- 페이징 -->
					<div class="text-center">
						<ul class="pagination justify-content-center"
							style="margin: 20px 0">

							<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/findboard/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">◁</a></li>
							</c:if>

							<c:forEach var="i" begin="${pageDTO.startPage }"
								end="${pageDTO.endPage }" step="1">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/findboard/list?pageNum=${i}">
										${i}</a></li>
							</c:forEach>

							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/findboard/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">
										▷</a></li>
							</c:if>
						</ul>
					</div> 
					<!--페이징 close -->
				</div>
        
        
        <!-- 즐겨찾기 수정 끝 -->
  
  		<!-- The Modal -->

		<div class="modal fade  modal-dialog-scrollable" id="find_content"
			aria-labelledby="ModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<c:forEach var="fb" items="${findboardList}" varStatus="mdloop">
						<div class="ModalSH">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">
									<a><b>${fb.title}</b></a><a>(</a><a><b>${fb.address}</b>&nbsp;</a><a><b>${fb.address2}</b></a><a>)</a>
								</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<div style="margin_bottom: 10px"></div>
								<section id="slider" class="carousel slide"
									data-bs-ride="carousel">
									<!-- 슬라이드 쇼 -->
									<div class="carousel-inner">
										<!-- 사진1 -->
										<div class="carousel-item active">
											<c:if test="${ff.upload ne null}">
												<img
													src="${ff.upload }/${ff.save_filename}"
													alt="first slide" class="d-block w-100"
													style="width: 100%; height: 100%; max-height: 550px;"
													onclick="window.open(this.src,'상세사진','width=630,height=600,location=no,status=no,scrollbars=yes')">
											</c:if>
										</div>
										<!-- 사진2 -->
										<%-- <div class="carousel-item">
											<img
												src="${pageContext.request.contextPath }/resources/img/mdog2.jpeg"
												alt="second slide" class="d-block w-100"
												style="width: 100%; height: 100%; max-height: 550px;"
												onclick="window.open(this.src,'상세사진','width=430,height=500,location=no,status=no,scrollbars=yes')">
										</div> --%>

										<!-- 슬라이드 이동버튼 -->
										<button class="carousel-control-prev" type="button"
											data-bs-target="#slider" data-bs-slide="prev">
											<span class="carousel-control-prev-icon"></span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#slider" data-bs-slide="next">
											<span class="carousel-control-next-icon"></span>
										</button>
										<!-- 슬라이드 이동버튼 끝 -->
									</div>
									<br>
								</section>

								<div class="row">
									<div class="col-md-10 col-xl-8" style="margin-top: 10px;">
										<table width="610" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="19"
													background="${pageContext.request.contextPath }/resources/img/view-13-img.gif"></td>
												<td width="572">

													<table width="572" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td height="29">

																<table width="572" border="0" cellpadding="0"
																	cellspacing="0">
																	<tr>
																		<td width="113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">잃어버린
																			장소</td>
																		<td width="" style="padding-left: 10px"><b>${fb.address }</b>&nbsp;<b>${fb.address2}</b>&nbsp;<b>${fb.detail_address}</b></td>
																		<td width="113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">잃어버린
																			날짜</td>
																		<td width="" style="text-align: center"><b> ${fb.missing_date}
																		</b></td>
																	</tr>
																</table>

															</td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath }/resources/img/view-dotline-img.gif"
																alt="" width="572" height="1"></td>
														</tr>
														<tr>
															<td height="29">

																<table width="572" border="0" cellpadding="0"
																	cellspacing="0">
																	<tr>
																		<td width="113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">글제목</td>
																		<td width="461" style="padding-left: 10px"><b>${fb.title}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>(성별</b>
																			: <b><c:choose>
																					<c:when test="${fb.pet_gender eq 0}">암컷</c:when>
																					<c:when test="${fb.pet_gender eq 1}">수컷</c:when>
																					<c:when test="${fb.pet_gender eq 2}">모름</c:when>
																				</c:choose> </b>)</td>
																	</tr>
																</table>

															</td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath }/resources/img/view-dotline-img.gif"
																alt="" width="572" height="1"></td>
														</tr>
														<tr>
															<td>

																<table width="auto" border="0" cellpadding="0"
																	cellspacing="0" class="Modbody">
																	<tr>
																		<td width="113" height="auto"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">상세설명</td>
																		<td width="461" valign="top"
																			style="line-height: 11pt; padding-left: 10px;"><br>
																			${fb.content }<br> <br></td>

																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<!-- Modal footer -->
							<c:choose>
							<c:when test="${sessionScope.nickname eq fb.nickname}">
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-bs-target="#modify_content" data-bs-toggle="modal"
									data-test2="${mdloop.count}" onclick="conf()">수정하기</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">닫기</button>
							</div>
							</c:when>
							<c:when test="${sessionScope.nickname ne fb.nickname}">
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">닫기</button>
							</div>
							</c:when>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- The Modal2 -->
		<div class="modal fade" id="modify_content"
			aria-labelledby="ModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<c:forEach var="fb" items="${findboardList}" varStatus="num">
						<div class="ModalLH">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">
									<a><b>${fb.title}</b></a><a>(</a><a><b>${fb.address}</b>&nbsp;</a><a><b>${fb.address2}</b></a><a>)</a>
								</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form
									action="${pageContext.request.contextPath}/findboard/write_findPro"
									method="post" id="f_eh" enctype="multipart/form-data">
									<input type="hidden" value="${sessionScope.nickname}"
										name="nickname">
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
													<label class="input-group-text">사례금</label> <input
														type="text" class="form-control"
														placeholder="만원" name="reward" value="${fb.reward }">
												</div>
											</div>
											<!--동물 종류 select -->
											<div class="input-group mb-3">
												<label class="input-group-text" for="animal_sort_eh">동물
													종류</label> <select class="form-select" id="animal_sort_eh"
													name="pet_type">
													<c:choose>
													<c:when test="${fb.pet_type eq 0}">
													<option value="" >선택해주세요</option>
													<option value="0" selected>개</option>
													<option value="1">고양이</option>
													<option value="2">기타</option>
													</c:when>
													<c:when test="${fb.pet_type eq 1}">
													<option value="" >선택해주세요</option>
													<option value="0" >개</option>
													<option value="1" selected>고양이</option>
													<option value="2">기타</option>
													</c:when>
													<c:when test="${fb.pet_type eq 2}">
													<option value="" >선택해주세요</option>
													<option value="0" >개</option>
													<option value="1">고양이</option>
													<option value="2" selected>기타</option>
													</c:when>
													</c:choose>
												</select>
											</div>
											<!--동물 이름, 동물 나이 text-->
											<div class="input-group mb-3">
												<label class="input-group-text"> 동물 이름 </label> <input
													type="text" class="form-control"
													placeholder="이름을 입력해 주세요" name="pet_name" value="${fb.pet_name }">
											</div>
											<div class="input-group mb-3">
												<label class="input-group-text"> 동물 나이 </label> <input
													type="text" class="form-control"
													placeholder="" name="pet_age"value="${fb.pet_age }"> <select
													class="form-select" name="pet_age2">
													<option value="month">개월</option>
													<option value="year" selected>년(세)</option>
												</select>
											</div>
											<!--동물 성별 체크 radio-->
											<div class="input-group mb-3">
												<div class="input-group-text">동물 성별</div>
												<div class="form-control">
												<c:choose>
												<c:when test="${fb.pet_gender eq 0 }">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra1_eh"
															value="0" name="pet_gender" checked> <label
															class="form-check-label" for="ra1_eh">암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra2_eh"
															value="1" name="pet_gender"> <label
															class="form-check-label" for="ra2_eh">수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra3_eh"
															value="2" name="pet_gender"> <label
															class="form-check-label" for="ra3_eh">모름</label>
													</div>
													</c:when>
													<c:when test="${fb.pet_gender eq 1 }">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra1_eh"
															value="0" name="pet_gender" > <label
															class="form-check-label" for="ra1_eh">암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra2_eh"
															value="1" name="pet_gender" checked> <label
															class="form-check-label" for="ra2_eh">수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra3_eh"
															value="2" name="pet_gender"> <label
															class="form-check-label" for="ra3_eh">모름</label>
													</div>
													</c:when>
													<c:when test="${fb.pet_gender eq 2 }">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra1_eh"
															value="0" name="pet_gender" > <label
															class="form-check-label" for="ra1_eh">암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra2_eh"
															value="1" name="pet_gender"> <label
															class="form-check-label" for="ra2_eh">수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" id="ra3_eh"
															value="2" name="pet_gender" checked> <label
															class="form-check-label" for="ra3_eh">모름</label>
													</div>
													</c:when>
													</c:choose>
												</div>
											</div>
											<!--실종날짜-->
											<div class="input-group mb-3">
												<label class="input-group-text">실종 날짜</label> <input
													type="date" class="form-control" name="missing_date" value="${fb.missing_date }">
											</div>
											<!--실종지역 selectbox -->
											<div class="input-group">
												<label class="input-group-text">실종 지역</label> <select
													class="form-select" name="address1" id="province">
													<option value="${fb.address }">지역</option>
												</select> 
												<select class="form-select" name="address2" id="city">
													<option selected>시</option>
												</select> 
												<select class="form-select" name="address3" id="town">
													<option selected>동</option>
												</select>
											</div>
											<div class="input-group"></div>
											<!--실종지역 상세 위치-->
											<div class="input-group mb-3">
												<label class="input-group-text">상세 위치</label> <input
													type="text" class="form-control" placeholder="OO초등학교 인근"
													name="detail_address">
											</div>
											<!--기타 특징-->
											<div class="input-group mb-3">
												<label class="input-group-text" for="ta_eh">기타 특징</label>
												<textarea rows="4" class="form-control"
													aria-label="With textarea" id="ta_eh"
													placeholder="중성화 유무, 자주가는 산책길, 좋아하는 음식 등 동물에 대한 상세정보"
													name="content">${fb.content }</textarea>
											</div>
											<!--연락가능 수단-->
											<div class="input-group mb-3">
												<label class="input-group-text">연락 가능 수단</label> <input
													type="text" class="form-control"
													placeholder="전화번호, 이메일, 카카오톡 아이디 등" name="contact">
											</div>

											<!--file 드래그앤드롭-->
											<div id="drop"
												style="border: 1px solid black; width: 100%; height: auto; padding: 3px">
												<p>
													<small style="color: gray; font-size: 13px;"> 반려동물의
														사진을 드래그하여 첨부해주세요<br> 업로드 가능 이미지 확장자 ( gif, jpeg, jpg,
														png, bmp )
													</small>
												</p>
												<p style="background-color: lightgrey;">
													<i>첨부파일</i>
													<button type="button" value="확인" id="save">저장</button>
												</p>
											</div>
										</div>
										<!--오른쪽여백-->
										<div class="col-md-1 col-lg-3"></div>
									</div>
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" value="글쓰기"
									onclick="modifyfind()">수정하기</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
  
  	<script type="text/javascript">
		$(function() {
			$('#find_content').on('show.bs.modal', function(e) {
				var exp = $(e.relatedTarget).data('test');
				$(".ModalSH").hide();
				$(".ModalSH").eq(exp - 1).show();
			});
		});
	</script>
	<script>
		$(function() {
			$('#modify_content').on('show.bs.modal', function(ea) {
				var exp2 = $(ea.relatedTarget).data('test2');
				$(".ModalLH").hide();
				$(".ModalLH").eq(exp2 - 1).show();
			});
		});
	</script>

	<script>
		$(function() {
			$("#flexCheckDefault")
					.click(
							function() {
								location.href = "${pageContext.request.contextPath }/findboard/listM";
							});
		});
	</script>
  
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

    <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  </div>
<!-- 부트스트랩 스크립트 적용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous">
</script>
</body>
</html>