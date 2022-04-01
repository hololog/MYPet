<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>상세페이지</title>
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-kj.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap/scss/forms/_form-control.scss">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap/scss/forms/_form-control.scss">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap/scss/forms/_floating-labels.scss">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.scss">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.scss"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-rtl.css"/>
    <!--     부트스트랩 적용-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--     부트스트랩 아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.rtl.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-reboot.rtl.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-utilities.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-utilities.rtl.css">


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body class="bg-light">

    <!-- header 시작 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- header 종료 -->

    <!-- ------------------------------- -->
    <!-- 본문 시작-->
    <!-- ------------------------------- -->


    <div class="container mt-5 p-2" id="find-board">
        <!-- 제목 시작 -->
        <div class="container">
            <h1 class="sub-title">상세확인</h1>
            <hr>
        </div>

        <div style="text-align: right; margin-bottom: 20px;">
            <a class="btn" style="border-color: #3f51b5">수정</a>
            <a class="btn" style="border-color: #3f51b5">삭제</a>
            <a class="btn" style="border-color: #3f51b5">목록</a>
        </div>


        <div class="row">
            <!-- 지도 api가져올 자리 -->
            <div class="mb-3 col-md-10 col-lg-6" id="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.111677235935!2d126.97473421573828!3d37.575987879796195!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2eaa19c763d%3A0xb28a32722d675764!2z6rSR7ZmU66y4KEd3YW5naHdhbXVuIEdhdGUp!5e0!3m2!1sko!2skr!4v1481946656451"
                        frameborder="0" style="border:0" allowfullscreen class="h-50 w-100"></iframe>


                <section id="slider" class="carousel slide" data-bs-ride="carousel" style="margin-bottom: 380px;">
                    <!-- 슬라이드 쇼 -->
                    <div class="carousel-inner">
                        <!-- 사진1 -->
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath }/resources/img/mdog1.jpeg" alt="first slide" class="d-block w-100"
                                 style="width: 100%; height: 100%; max-height: 550px;"
                                 onclick="window.open(this.src,'상세사진','width=430,height=500,location=no,status=no,scrollbars=yes')"
                            >
                        </div>
                        <!-- 사진2 -->
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath }/resources/img/mdog2.jpeg" alt="second slide" class="d-block w-100"
                                 style="width: 100%; height: 100%; max-height: 550px;"
                                 onclick="window.open(this.src,'상세사진','width=430,height=500,location=no,status=no,scrollbars=yes')">
						</div>

                        <!-- 슬라이드 이동버튼 -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#slider"
                                data-bs-slide="prev"
                        >
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#slider"
                                data-bs-slide="next"
                        >
                            <span class="carousel-control-next-icon"></span>
                        </button>
                        <!-- 슬라이드 이동버튼 끝 -->
                    </div>
                    <br>
                </section>

            </div>


            <div class="mb-3 col-md-10 col-lg-6" style="border-left: 2px solid lightgray;">
                <!-- SNS버튼 시작 -->
                <div style="width: 100%; text-align: right; margin-bottom: 2px;">
                    <!-- 페이스북 공유 버튼 --> <a href=""
                                           onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
                    <img src="${pageContext.request.contextPath }/resources/img/face.png" title="페이스북으로 공유하기"
                         class="sharebtn_custom" style="width: 32px;"></a>

                    <!-- 트위터 공유 버튼 --> <a href=""
                                          onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
                    <img src="${pageContext.request.contextPath }/resources/img/twit.png" title="트위터로 공유하기"
                         class="sharebtn_custom" style="width: 32px;"></a>

                    <!-- 카카오 스토리 공유 버튼 --> <a href=""
                                              onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;"><img
                        src="${pageContext.request.contextPath }/resources/img/kakaop.jpg" title="카카오스토리로 공유하기"
                        class="sharebtn_custom" style="width: 32px;"></a>
                </div>
                <!-- SNS버튼 끝 -->
                <!-- 검색창 종료 -->
                <form action="" method="get"></form>
                <div class="row">
                    <div class="pt-3 d-flex justify-content-center gap-3 col-9">
                        <div class="">
                            <input type="text" class="form-control" id="" value="" placeholder="상세내용 검색">
                        </div>
                        <div class="">
                            <button type="submit" class="btn text-white" style="background-color: #3f51b5;"><i
                                    class="bi bi-search"></i></button>
                        </div>
                    </div>
                    <div class="col-3 pt-3" style="text-align: right">
                        <span class="btn btn-primary" role="button" style="color: white" onclick=report()>제보하기</span>
                        <p class="arrow_box" style="position: absolute">연락수단 확인하고 글쓴이에게 제보하기!</p>
                    </div>
                </div>
                <!-- 검색창 종료-->


                <!--                    기능구현시 수정-->
                <div class="row">
                    <div class="col-md-10 col-xl-8" style="margin-top: 10px;">
                        <ul>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque interdum leo risus,
                                nec efficitur ipsum congue sed. Cras congue aliquet purus, in mattis nunc varius
                                sed.
                                Suspendisse augue risus, porta in lectus eu, facilisis gravida eros. Nulla efficitur
                                purus quis convallis maximus. In tempor lacinia dolor a malesuada. Quisque magna
                                mauris,
                                lobortis non urna nec, rutrum accumsan massa. Praesent sapien mauris, dictum id
                                ultricies quis, vulputate at quam.
                                Integer eu iaculis urna, id imperdiet sapien. Vivamus dolor purus, tincidunt non
                                volutpat sed,
                                maximus ullamcorper augue. Aliquam et consectetur justo, non ornare diam. Proin quis
                                urna erat.
                                Mauris sodales, diam sed maximus cursus, justo enim rhoncus ipsum, sit amet ultrices
                                libero lorem sed odio.
                                Ut nec sem fermentum, posuere lectus a, tincidunt enim. Donec elementum nisl vel
                                nibh rhoncus eleifend. Aliquam ut auctor diam.
                                Quisque in mauris pulvinar, iaculis magna vel, imperdiet lectus. Nam eu porttitor
                                erat. Curabitur et euismod risus, a rhoncus libero.
                                Curabitur blandit accumsan tortor a scelerisque.
                            </li>
                        </ul>
                    </div>
                </div>
              </div>

            <section class="mb-7">
                <div class="card bg-light" style="margin-top: 30px">
                    <div class="card-body">
                        <div id="comment-count" style="margin-bottom: 5px">댓글 <span id="count">4</span></div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="댓글을 입력해 주세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2" style="background-color: white; color: #3f51b5; border-color: #3f51b5">제출</button>
                        </div>

                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                            alt="..."></div>
                            <div class="ms-3">
                                <div class="fw-bold">익명1</div>
                                꼭 찾으셧으면 좋겟어요 ㅠㅠ

                                <div class="d-flex mt-4">
                                    <div class="flex-shrink-0"><img class="rounded-circle"
                                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                    alt="..."></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">익명2</div>
                                        그러게요 ㅠㅠ
                                    </div>
                                </div>
                                <!-- Child comment 2-->
                                <div class="d-flex mt-4">
                                    <div class="flex-shrink-0"><img class="rounded-circle"
                                                                    src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                                    alt="..."></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">익명3</div>
                                        33
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Single comment-->
                        <div class="d-flex">
                            <div class="flex-shrink-0"><img class="rounded-circle"
                                                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
                                                            alt="..."></div>
                            <div class="ms-3">
                                <div class="fw-bold">글작성자</div>
                                찾았습니다!! 감사합니다!!
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div style="text-align: right; margin-top: 20px;">
                <a class="btn" style="border-color: #3f51b5">수정</a>
                <a class="btn" style="border-color: #3f51b5">삭제</a>
                <a class="btn" style="border-color: #3f51b5">목록</a>
            </div>
        </div>

    </div>
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->
    <!-- footer 시작 -->
    <jsp:include page="../inc/bottom.jsp"></jsp:include>

    <!-- footer 종료 -->


    <script src="js/main.js"></script>
    <!-- 부트스트랩 스크립트 적용 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <!-- SNS 공유용 주소 연결 JS -->
    <script type="text/javascript" async> var url_default_ks = "https://story.kakao.com/share?url=";
    var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
    var url_default_tw_txt = "https://twitter.com/intent/tweet?text=";
    var url_default_tw_url = "&url=";
    var url_this_page = location.href;
    var url_combine_ks = url_default_ks + url_this_page;
    var url_combine_fb = url_default_fb + url_this_page;
    var url_combine_tw = url_default_tw_txt + document.title + url_default_tw_url + url_this_page;
    </script>

    <script>
        function report() {
            var result = confirm("동물신고전화 이외의 용도로 사용하지 않음을 동의하십니까?");
            if (result) {
                window.open('', '상세사진', 'width=430,height=500,location=no,status=no,scrollbars=yes');
            } else {
                alert("동의 후 이용가능합니다. 불법개인정보 수집은 법적 처벌대상이 될수있습니다. ");
            }
        }
    </script>
</body>
</html>