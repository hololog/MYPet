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
<style>
#nav-fboard-ksk {
	font-weight: bold;
}
</style>
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
			<!-- 메인 -->
			<div class="row">

				<!-- 지도 api가져올 자리 -->
				<div class="mb-3 col-md-12 col-lg-7" id="map-frame-ksk"
					style="z-index: 2;">
					<div class="sticky-lg-top" style="top: 9rem;">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.111677235935!2d126.97473421573828!3d37.575987879796195!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2eaa19c763d%3A0xb28a32722d675764!2z6rSR7ZmU66y4KEd3YW5naHdhbXVuIEdhdGUp!5e0!3m2!1sko!2skr!4v1481946656451"
							id="map-ksk" allowfullscreen="allowfullscreen"></iframe>
						<!-- <div id="map" style="width:500px;height:400px;"></div>                            -->
					</div>
				</div>
				<!-- 지도 api가져올 자리 -->

				<div class="mb-3 col-md-12 col-lg-5" id="finder-photo">

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
							id="flexCheckDefault" checked="checked"> <label class="form-check-label"
							for="flexCheckDefault" >미해결 공고만 보기</label>
					</div>
					<!-- 검색창 종료-->

					<!-- 간략히보기 시작 5개씩 -->
					<c:set var="num"
						value="${pageDTO.count -(pageDTO.pageNum-1)* pageDTO.pageSize }" />
					<c:forEach var="fb" items="${findmissboardList }"
						varStatus="loop">
						<div class="row ListSH" id="refresh">
						<a type="hidden" data-result="${fb.result}"></a>
								<div class="col-12 col-sm-7 p-2 position-relative">
								<c:choose>
									<c:when test="${fb.upload ne null}">
										<a href="" data-bs-toggle="modal" class="openMod"
											data-bs-toggle="modal" data-test="${loop.count}"
											data-bs-target="#find_content"> <img
											class="img-fluid rounded"
											src="${pageContext.request.contextPath }/resources/img/${fb.upload}"
											alt="실종동물사진" id="">
										</a>
									</c:when>
									<c:when test="${fb.upload eq null}">
										<a href="" data-bs-toggle="modal" class="openMod"
											data-bs-toggle="modal" data-test="${loop.count}"
											data-bs-target="#find_content"> <img
											class="img-fluid rounded"
											src="${pageContext.request.contextPath}/resources/img/dog1.jpg"
											alt="실종동물사진" id="">
										</a>
									</c:when>
								</c:choose>
								</div>
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
										/ ${fb.pet_age}살
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-calendar3"></i>
										<fmt:formatDate value="${fb.missing_date}"
											pattern="yyyy.MM.dd" />
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-geo-alt"></i> ${fb.detail_address}
										부근
									</div>
									<div class="p-1 col-6 col-sm-12">
										<i class="bi bi-coin"></i> 사례금 : <b>${fb.reward}</b>
										만원
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
									href="${pageContext.request.contextPath }/findboard/listM?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">◁</a></li>
							</c:if>

							<c:forEach var="i" begin="${pageDTO.startPage }"
								end="${pageDTO.endPage-1}" step="1">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/findboard/listM?pageNum=${i}">
										${i}</a></li>
							</c:forEach>

							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/findboard/listM?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">
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

		<div class="modal fade  modal-dialog-scrollable" id="find_content">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<c:forEach var="fb" items="${findmissboardList}">
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
								<section id="slider" class="carousel slide"
									data-bs-ride="carousel">
									<!-- 슬라이드 쇼 -->
									<div class="carousel-inner">
										<!-- 사진1 -->
										<div class="carousel-item active">
										<c:if test="${fb.upload ne null}">
											<img
												src="${pageContext.request.contextPath }/resources/img/${fb.upload}"
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
																		<td width="" style="text-align: center"><b> <fmt:formatDate
																					value="${fb.missing_date}"
																					pattern="yyyy.MM.dd" />
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
						</div>
					</c:forEach>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
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
		$(function(){
		    $("#flexCheckDefault").click(function(){
		            location.href="${pageContext.request.contextPath }/findboard/list";
		    });
		});
	</script>
</body>
</html>