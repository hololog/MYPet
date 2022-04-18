<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>실종공고</title>
<!-- css스타일 적용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style-kj.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css" />
<!-- 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/203a25fbbd.js"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/script/main.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eff268212342867ed07048385b8791c9&libraries=services"></script>


<style>
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 650px;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var objDragAndDrop = $(".dragAndDropDiv");

						$(document).on("dragenter", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
									$(this).css('border', '2px solid #0B85A1');
								});
						$(document).on("dragover", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
								});
						$(document).on("drop", ".dragAndDropDiv", function(e) {

							$(this).css('border', '2px dotted #0B85A1');
							e.preventDefault();
							var files = e.originalEvent.dataTransfer.files;

							handleFileUpload(files, objDragAndDrop);
						});

						$(document).on('dragenter', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						$(document).on('dragover', function(e) {
							e.stopPropagation();
							e.preventDefault();
							objDragAndDrop.css('border', '2px dotted #0B85A1');
						});
						$(document).on('drop', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						//drag 영역 클릭시 파일 선택창
						/* objDragAndDrop.on('click', function(e) {
							$('input[type=file]').trigger('click');
						});

						$('input[type=file]').on('change', function(e) {
							var files = e.originalEvent.target.files;
							handleFileUpload(files, objDragAndDrop);
						});
						function handleFileUpload(files, obj) {
							for (var i = 0; i < files.length; i++) {
								var fd = new FormData();
								fd.append('file', files[i]);

								var status = new createStatusbar(obj); //Using this we can set progress.
								status.setFileNameSize(files[i].name,
										files[i].size);
								sendFileToServer(fd, status);

							}
						} */

						var rowCount = 0;
						function createStatusbar(obj) {

							rowCount++;
							var row = "odd";
							if (rowCount % 2 == 0)
								row = "even";
							this.statusbar = $("<div class='statusbar "+row+"'></div>");
							this.filename = $("<div class='filename'></div>")
									.appendTo(this.statusbar);
							this.size = $("<div class='filesize'></div>")
									.appendTo(this.statusbar);
							this.progressBar = $(
									"<div class='progressBar'><div></div></div>")
									.appendTo(this.statusbar);
							this.abort = $("<div class='abort'>중지</div>")
									.appendTo(this.statusbar);

							obj.after(this.statusbar);

							this.setFileNameSize = function(name, size) {
								var sizeStr = "";
								var sizeKB = size / 1024;
								if (parseInt(sizeKB) > 1024) {
									var sizeMB = sizeKB / 1024;
									sizeStr = sizeMB.toFixed(2) + " MB";
								} else {
									sizeStr = sizeKB.toFixed(2) + " KB";
								}

								this.filename.html(name);
								this.size.html(sizeStr);
							}

							this.setProgress = function(progress) {
								var progressBarWidth = progress
										* this.progressBar.width() / 100;
								this.progressBar.find('div').animate({
									width : progressBarWidth
								}, 10).html(progress + "% ");
								if (parseInt(progress) >= 100) {
									this.abort.hide();
								}
							}
							this.setAbort = function(jqxhr) {
								var sb = this.statusbar;
								this.abort.click(function() {
									jqxhr.abort();
									sb.hide();
								});
							}
						}

						function sendFileToServer(formData, status) {
							var uploadURL = '${pageContext.request.contextPath }/findboard/update_find_filePro'; //Upload URL
							var extraData = {}; //Extra Data.
							var jqXHR = $
									.ajax({
										xhr : function() {
											var xhrobj = $.ajaxSettings.xhr();
											if (xhrobj.upload) {
												xhrobj.upload
														.addEventListener(
																'progress',
																function(event) {
																	var percent = 0;
																	var position = event.loaded
																			|| event.position;
																	var total = event.total;
																	if (event.lengthComputable) {
																		percent = Math
																				.ceil(position
																						/ total
																						* 100);
																	}
																	//Set progress
																	status
																			.setProgress(percent);
																}, false);
											}
											return xhrobj;
										},
										url : uploadURL,
										type : "POST",
										contentType : false,
										processData : false,
										cache : false,
										data : formData,
										success : function(data) {
											status.setProgress(100);

											//$("#status1").append("File upload Done<br>");           
										}
									});

							status.setAbort(jqXHR);
						}

					});
</script>


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
			<h1 class="sub-title">실종공고</h1>
			<hr>
		</div>
		<!-- 제목 종료 -->

		<div class="container mt-5 p-2" id="find-board">
			<!-- 신고글쓰기버튼 -->
			<div class="row p-3">
				<div class="col-12">
					<a href="${pageContext.request.contextPath }/findboard/write"
						class="btn float-end" style="border-color: #3f51b5;">실종신고</a>
				</div>
			</div>
			<input type="hidden" data-addr="${findboardDTO.address}">
			<!-- 메인 -->
			<div class="row" style="height: 1397px">

				<!-- 지도 api가져올 자리 -->
				<div id="map" style="max-width: 55%;"
					class="mb-3 col-md-12 col-lg-7" id="map-kj"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eff268212342867ed07048385b8791c9"></script>
				<script type="text/javascript">
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도   
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 지도타입
					var mapTypeControl = new kakao.maps.MapTypeControl();

					// 위치
					map.addControl(mapTypeControl,
							kakao.maps.ControlPosition.TOPRIGHT);

					// 줌 컨트롤러
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl,
							kakao.maps.ControlPosition.RIGHT);

					var geocoder = new kakao.maps.services.Geocoder();

				
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('addr',function(result, status) {
				
										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">진해구</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				</script>
				<!-- 지도 api가져올 자리 -->
				<div class="mb-3 col-md-12 col-lg-5" style="margin-left: 20px"
					id="finder-photo">

					<!-- 검색창 시작 ajax -->
					<div class="pt-3 d-flex justify-content-center gap-3">
						<div class="">
							<input type="text" class="form-control" id="" value=""
								placeholder="내 주변 검색">
						</div>
						<div class="">
							<button type="submit" class="btn text-white"
								style="background-color: #3f51b5;">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
					<div class="form-check d-flex justify-content-center p-3">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault">미해결 공고만 보기</label>
					</div>
					<!-- 검색창 종료-->

					<!-- 간략히보기 시작 5개씩 -->
					<c:set var="num"
						value="${pageDTO.count -(pageDTO.pageNum-1)* pageDTO.pageSize}" />
					<c:forEach var="fb" items="${findboardList}" varStatus="loop">
						<div class="row ListSH" id="refresh">
							<a type="hidden" data-result="${fb.result}"></a>
							<div class="col-12 col-sm-7 p-2 position-relative">
								<c:choose>
									<c:when test="${fileList[loop.index].filename ne null}">
										<a href="" data-bs-toggle="modal" class="openMod pic"
											data-bs-toggle="modal" data-test="${loop.count}" data-map="${fb.address}" data-inx="${loop.index}"
											data-bs-target="#find_content"
											id="marking"> <img class="img-fluid rounded"
											src="${pageContext.request.contextPath }/resources/upload/${fileList[loop.index].save_filename}" alt="실종동물사진" id="">
										</a>
									</c:when>
									<c:when test="${fileList[loop.index].filename eq null}">
										<a href="" data-bs-toggle="modal" class="openMod pic"
											data-bs-toggle="modal" data-test="${loop.count}" data-map="${fb.address}" data-inx="${loop.index}"
											data-bs-target="#find_content"> <img
											class="img-fluid rounded"
											src="${pageContext.request.contextPath }/resources/upload/${fileList[loop.index].save_filename}" alt="실종동물사진" id="">
										</a>
									</c:when>
								</c:choose>
							</div>

							<div class="col-12 col-sm-5 p-2" id="find-info-ksk">
								<div class="row p-2">
									<div class="col-6 col-sm-12" style="white-space:normal">
										<h4>${fb.address}</h4>
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
										<i class="bi bi-calendar3"></i> ${fb.missing_date}
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
				</div>
			</div>
		</div>

		<div class="container mt-5">
			<div class="row">
				<div class="col-sm-4">
					<h2>About Me</h2>
					<h5>Photo of me:</h5>
					<div class="fakeimg">Fake Image</div>
					<p>Some text about me in culpa qui officia deserunt mollit
						anim..</p>
					<hr class="d-sm">

					<h3 class="mt-4">참고 링크</h3>

					<p>Lorem ipsum dolor sit ame.</p>
					<ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					</ul>

				</div>
				<div class="col-sm-8">
					<h2>실종시 대처방법</h2>
					<h5>Title description</h5>
					<p>Some text..</p>
					<p>Sunt in culpa qui officia deserunt mollit anim id est
						laborum consectetur adipiscing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim
						veniam, quis nostrud exercitation ullamco.</p>

					<h2 class="mt-5">구조시 대처방법</h2>
					<h5>Title description</h5>
					<p>Some text..</p>
					<p>Sunt in culpa qui officia deserunt mollit anim id est
						laborum consectetur adipiscing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim
						veniam, quis nostrud exercitation ullamco.</p>
				</div>
			</div>
		</div>

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
									<a><b>${fb.pet_name}</b></a><a>(</a><a><b>${fb.address}</b>&nbsp;</a><a><b>${fb.address2}</b></a><a>)</a>
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
												<img src="${ff.upload }/${ff.save_filename}"
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

								<div >
									<div style="margin-top: 10px;">
																<table width="572" border="0" cellpadding="0"
																	 id="line">
																	<tr>
																		<td class="td113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">잃어버린
																			장소</td>
																		<td style="padding-left: 10px"><b>${fb.address }</b>&nbsp;<b>${fb.address2}</b>&nbsp;<b>${fb.detail_address}</b></td>
																		<td class="td113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">잃어버린
																			날짜</td>
																		<td style="text-align: center"><b>
																				${fb.missing_date} </b></td>
																	</tr>

																	<tr>
																		<td class="td113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">이름</td>
																		<td  style="padding-left: 10px"><b>${fb.pet_name}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>(성별</b>
																			: <b><c:choose>
																					<c:when test="${fb.pet_gender eq 0}">암컷</c:when>
																					<c:when test="${fb.pet_gender eq 1}">수컷</c:when>
																					<c:when test="${fb.pet_gender eq 2}">모름</c:when>
																				</c:choose> </b>)</td>
																	
															 		<td class="td113" style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">종류</td>
																	<td  style="padding-left: 10px"><b>
																	<c:choose>
																		<c:when test="${fb.pet_type eq 0}">개</c:when>
																		<c:when test="${fb.pet_type eq 1}">고양이</c:when>
																		<c:when test="${fb.pet_type eq 2}">기타</c:when>
																	</c:choose>
																	</b></td>
																	</tr>

																	<tr>
																		<td class="td113" height="auto"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">연락수단</td>
																		<td  valign="top"
																			style="line-height: 11pt; padding-left: 10px;"><br>
																			${fb.content }<br> <br></td>
																			<td class="td113"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">나이</td>		

																	</tr>

																	<tr>
																		<td class="td113" height="auto"
																			style="background-color: #919ced; padding: 10px 10px 10px 10px; color: white; text-align: center;">상세설명</td>
																		<td valign="top"
																			style="line-height: 11pt; padding-left: 10px;"><br>
																			${fb.content }<br> <br></td>
																	</tr>
																</table>
							</div>
							<!-- Modal footer -->
							<c:choose>
								<c:when test="${sessionScope.nickname eq fb.nickname}">
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-bs-target="#modify_content" data-bs-toggle="modal"
											data-test2="${mdloop.count}" >수정하기</button>
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
									<a><b>${fb.pet_name}</b></a><a>(</a><a><b>${fb.address}</b></a>><a>) 수정하기</a>
								</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form
									action="${pageContext.request.contextPath}/findboard/update_findPro"
									method="post" id="f_eh" enctype="multipart/form-data">
									<input type="hidden" value="${fb.find_board_num}" name="find_board_num">
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
													<label class="input-group-text">사례금</label> <input
														type="text" class="form-control" placeholder="만원"
														name="reward" value="${fb.reward }">
												</div>
											</div>
											<!--동물 종류 select -->
											<div class="input-group mb-3">
												<label class="input-group-text" for="animal_sort_eh">동물
													종류</label> <select class="form-select" id="animal_sort_eh"
													name="pet_type">
													<c:choose>
													<c:when test="${fb.pet_type eq null }">
													<option value="" selected>선택해주세요</option>
													<option value="0">개</option>
													<option value="1">고양이</option>
													<option value="2">기타</option>
													</c:when>
													<c:when test="${fb.pet_type eq 0 }">
													<option value="" >선택해주세요</option>
													<option value="0" selected>개</option>
													<option value="1">고양이</option>
													<option value="2">기타</option>
													</c:when>
													<c:when test="${fb.pet_type eq 1 }">
													<option value="" >선택해주세요</option>
													<option value="0">개</option>
													<option value="1" selected>고양이</option>
													<option value="2">기타</option>
													</c:when>
													<c:when test="${fb.pet_type eq 2 }">
													<option value="" >선택해주세요</option>
													<option value="0">개</option>
													<option value="1">고양이</option>
													<option value="2"selected>기타</option>
													</c:when>
													</c:choose>
												</select>
											</div>
											<!--동물 이름, 동물 나이 text-->
											<div class="input-group mb-3">
												<label class="input-group-text"> 동물 이름 </label> <input
													type="text" class="form-control" placeholder="이름"
													name="pet_name" value="${fb.pet_name }">
											</div>
											<div class="input-group mb-3">
												<label class="input-group-text"> 동물 나이 </label> <input
													type="text" class="form-control" placeholder="숫자만 입력"
													name="pet_age"> <select class="form-select"
													name="pet_age2">
													<option value="개월">개월</option>
													<option value="살">살(년)</option>
												</select>
											</div>
											<!--동물 성별 체크 radio-->
											<div class="input-group mb-3">
												<div class="input-group-text">동물 성별</div>
												<div class="form-control">
													 <c:choose>
													<c:when test="${fb.pet_gender eq 0}"> 
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="0" name="pet_gender"  checked> <label
															class="form-check-label" for="ra1_eh">암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio"
															value="1" name="pet_gender"> <label
															class="form-check-label" for="ra2_eh">수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="2" name="pet_gender"> <label
															class="form-check-label" for="ra3_eh">모름</label>
													</div>
													</c:when>
													<c:when test="${fb.pet_gender eq 1}">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="0" name="pet_gender"> <label
															class="form-check-label" for="ra1_eh" >암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="1" name="pet_gender" checked> <label
															class="form-check-label" for="ra2_eh" >수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="2" name="pet_gender"> <label
															class="form-check-label" for="ra3_eh">모름</label>
													</div>
													</c:when>
													<c:when test="${fb.pet_gender eq 2}">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="0" name="pet_gender"> <label
															class="form-check-label" for="ra1_eh" >암컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="1" name="pet_gender"> <label
															class="form-check-label" for="ra2_eh">수컷</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" 
															value="2" name="pet_gender" checked> <label
															class="form-check-label" for="ra3_eh" >모름</label>
													</div>
													</c:when>
													</c:choose>
												</div>
											</div>
											<!--실종날짜-->
											<div class="input-group mb-3">
												<label class="input-group-text">실종 날짜</label> <input
													type="date" class="form-control" name="missing_date" value="${fb.missing_date}">
											</div>
											<!--실종지역 selectbox -->
											<div class="input-group">
												<label class="input-group-text">실종 지역</label> <select
													class="form-select province" name="address1" data-test2="${num.index}">
													<option value="">지역</option>
												</select> <select class="form-select city" name="address2">
													<option selected>시</option>
												</select> <select class="form-select town" name="address3">
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
													name="content">${fb.content}</textarea>
											</div>
											<!--연락가능 수단-->
											<div class="input-group mb-3">
												<label class="input-group-text">연락 가능 수단</label> <input
													type="text" class="form-control"
													placeholder="전화번호, 이메일, 카카오톡 아이디 등" name="contact" value="${fb.contact }">
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
											<div id="fileUpload" class="dragAndDropDiv">
												업로드할 이미지를 드래그하여 넣기 <br> (1장씩 첨부, 최대 3장)
											</div>
											<input type="file" name="fileUpload" id="fileUpload"
												style="display: none;" multiple />

											<!--submit 버튼-->
										</div>
										<!--오른쪽여백-->
										<div class="col-md-1 col-lg-3"></div>
									</div>
								

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" value="글쓰기" >수정하기</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">닫기</button>
							</div>
							</form>
						</div>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>




	<!-- ------------------------------- -->
	<!-- 본문 종료-->
	<!-- ------------------------------- -->

	<!-- footer 시작 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- footer 종료 -->
	<!-- 부트스트랩 스크립트 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
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
	<script>
		window.onload = function relayout() {

			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
			// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			map.relayout();
			//		map.setBounds(bounds);

		}
	</script>
	<script type="text/javascript">
	// 시/도 select
	$(document).ready(function(){
		$('.province').one("focus",function(){//포커스 이벤트발생시 ajax 실행
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/provinceSelect',
				dataType:'json',
				success:function(rdata){
// 					$.each(배열이나 객체,function(배열의 인덱스, 배열의 값){}
					$.each(rdata,function(index,item){
						$('.province').append("<option value='"+item.address1+"'>"+item.address1+"</option>");
					});
				}
			});
		}); // provicne selected
		
		$('.province').change(function(){//province 변경 이벤트발생시 ajax 실행
			var exp3=$(".province").data("test2");
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/citySelect',
				data:{"province":$('.province').eq(exp3-1).val()},// request.setParameter("province", #province의 값)의 같음
				dataType:'json',
				success:function(rdata){
					$('.city').html("<option selected>시</option>");//화면초기화
					$.each(rdata,function(index,item){
						$('.city').append("<option value='"+item.address2+"'>"+item.address2+"</option>");
					});
				}
			});
		}); //city selected
		
		$('.city').change(function(){//city 변경 이벤트발생시 ajax 실행
			var exp3=$(".province").data("test2");
			$.ajax({
				url:'${pageContext.request.contextPath }/findboard/townSelect',
				data:{"city":$('.city').eq(exp3-1).val(),"province":$('.province').eq(exp3-1).val()},// request.setParameter("city", #city의 값)의 같음
				dataType:'json',
				success:function(rdata){
					$('.town').html("<option selected>동</option>");//화면초기화
					$.each(rdata,function(index,item){
						$('.town').append("<option value='"+item.address3+"'>"+item.address3+"</option>");
					});
				}
			});
		}); //city selected
	}); // jQuery closed	
</script>
<!-- <script>
$(document).ready(function(){
	$('.pic').mouseover(function(){
		var inx = $(".pic").data("test");
		var exp4 = $(".pic").data("map");
		var addr = $(".pic").eq(inx).data("map");
		alert(inx);
	});
});
</script> -->
</body>
</html>