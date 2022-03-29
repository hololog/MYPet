<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- css스타일 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />
    <!-- 부트스트랩 적용 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
     <!-- font awesome -->
  <script src="https://kit.fontawesome.com/203a25fbbd.js" crossorigin="anonymous"></script>
    <title>자유게시판/리스트</title>

    
    
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
            <h1 class="sub-title">꿀팁 & 입양후기</h1>
            <hr>
        </div>
       <!-- 제목 종료 -->
        
        
            
       
       
              <br>
              <div>
               
                <!-- 게시판 -->
                <div class="container mt-3">
                    
                  <table class="table table-hover text-center  " >
                    <thead>
                      <tr>
                        <th width="4%">번호</th>
                        <th width="3%"> </th>
                        <th width="30%" style="text-align: start;">제목</th>
                        <th></th>
                        <th width="10%">글쓴이</th>
                        <th width="10%" style="text-align: start;">날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <td>1</td>
                        <td style="text-align: start;"><span class="badge rounded-pill bg-primary"><i class="bi bi-megaphone"></i> Best</span></td>
                        <td style="text-align: start;">title1</td>
                        <td style="text-align:end"><div>
                          <!-- 댓글수, 조회수 아이콘 -->
                          <i class="fa-regular fa-comment-dots"> 1 </i>
                          <i class="fa-regular fa-eye"> 12 </i>
                        </div></td>
                        <td>id1</td>
                        <td style="text-align: start;">2022.03.25</td>
                    </tr>

                    <tr>
                      <td>2</td>
                        <td style="text-align: start;"><span class="badge rounded-pill bg-primary"><i class="bi bi-megaphone"></i> Best</span></td>
                      <td style="text-align: start;">title2</td>
                      <td style="text-align:end"><div>
                        <!-- 댓글수, 조회수 아이콘 -->
                        <i class="fa-regular fa-comment-dots"> 1 </i>
                        <i class="fa-regular fa-eye"> 12 </i>
                      </div></td>
                      <td>id2</td>
                      <td style="text-align: start;">2022.03.25</td>
                    </tr>

                    <tr>
                      <td>3</td>
                      <td style="text-align: start;"><span class="badge rounded-pill bg-primary"><i class="bi bi-megaphone"></i> Best</span></td>
                        <td style="text-align: start;">title3</td>
                        <td style="text-align:end"><div>
                          <!-- 댓글수, 조회수 아이콘 -->
                          <i class="fa-regular fa-comment-dots"> 1 </i>
                          <i class="fa-regular fa-eye"> 12 </i>
                        </div></td>
                        <td>id3</td>
                        <td style="text-align: start;">2022.03.25</td>
                    </tr>

                    <tr>
                        <td>4</td>
                        <td></td>
                        <td style="text-align: start;">title4</td>
                        <td style="text-align:end"><div>
                          <!-- 댓글수, 조회수 아이콘 -->
                          <i class="fa-regular fa-comment-dots"> 1 </i>
                          <i class="fa-regular fa-eye"> 12 </i>
                        </div></td>
                        <td>id4</td>
                        <td style="text-align: start;">2022.03.25</td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td></td>
                        <td style="text-align: start;">title5</td>
                        <td style="text-align:end"><div>
                          <!-- 댓글수, 조회수 아이콘 -->
                          <i class="fa-regular fa-comment-dots"> 1 </i>
                          <i class="fa-regular fa-eye"> 12 </i>
                        </div></td>
                        <td>id5</td>
                        <td style="text-align: start;">2022.03.25</td>
                    </tr>
        
                    <tr>
                      <td>6</td>
                      <td></td>
                      <td style="text-align: start;">title6</td>
                      <td style="text-align:end"><div>
                        <!-- 댓글수, 조회수 아이콘 -->
                        <i class="fa-regular fa-comment-dots"> 1 </i>
                        <i class="fa-regular fa-eye"> 12 </i>
                      </div></td>
                      <td>id6</td>
                      <td style="text-align: start;">2022.03.25</td>
                  </tr>
        
                  <tr>
                    <td>7</td>
                    <td></td>
                    <td style="text-align: start;">title47</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id7</td>
                    <td style="text-align: start;">2022.03.25</td>
                </tr>
        
                  <tr>
                    <td>8</td>
                    <td></td>
                    <td style="text-align: start;">title8</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id8</td>
                    <td style="text-align: start;">2022.03.25</td>
                </tr>
        
                 <tr>
                    <td>9</td>
                    <td></td>
                    <td style="text-align: start;">title9</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id9</td>
                    <td style="text-align: start;">2022.03.25</td>
                </tr>
        
                 <tr>
                    <td>10</td>
                    <td></td>
                    <td style="text-align: start;">title10</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id10</td>
                    <td style="text-align: start;">2022.03.25</td>
                </tr>
        
        
                 <tr>
                    <td>11</td>
                    <td></td>
                    <td style="text-align: start;">title11</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id11</td>
                    <td style="text-align: start;">2022.03.25</td>
                </tr>
        
                  <tr>
                    <td>12</td>
                    <td></td>
                    <td style="text-align: start;">title12</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id12</td>
                    <td style="text-align: start;">2022.03.25</td>
                  </tr>
        
                  <tr>
                    <td>13</td>
                    <td></td>
                    <td style="text-align: start;">title13</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id13</td>
                    <td style="text-align: start;">2022.03.25</td>
                  </tr>
        
                 <tr>
                    <td>14</td>
                    <td></td>
                    <td style="text-align: start;">title14</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id14</td>
                    <td style="text-align: start;">2022.03.25</td>
                  </tr>
        
                 <tr>
                    <td>15</td>
                    <td></td>
                    <td style="text-align: start;">title15</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id15</td>
                    <td style="text-align: start;">2022.03.25</td>
                 </tr>
        
        
                 <tr>
                    <td>16</td>
                    <td></td>
                    <td style="text-align: start;">title16</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id16</td>
                    <td style="text-align: start;">2022.03.25</td>
                 </tr>
        
                  <tr>
                    <td>17</td>
                    <td></td>
                    <td style="text-align: start;">title17</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id17</td>
                    <td style="text-align: start;">2022.03.25</td>
                  </tr>
        
                  <tr>
                    <td>18</td>
                    <td></td>
                    <td style="text-align: start;">title18</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id18</td>
                    <td style="text-align: start;">2022.03.25</td>
                 </tr>
        
        
                 <tr>
                    <td>19</td>
                    <td></td>
                    <td style="text-align: start;">title19</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id19</td>
                    <td style="text-align: start;">2022.03.25</td>
                 </tr>
        
                  <tr>
                    <td>20</td>
                    <td></td>
                    <td style="text-align: start;">title20</td>
                    <td style="text-align:end"><div>
                      <!-- 댓글수, 조회수 아이콘 -->
                      <i class="fa-regular fa-comment-dots"> 1 </i>
                      <i class="fa-regular fa-eye"> 12 </i>
                    </div></td>
                    <td>id20</td>
                    <td style="text-align: start;">2022.03.25</td>
                  </tr>
                    </tbody>
                  </table>
                  <hr/>
                  <!-- 검색 -->
                  <div class="container w-50 ">
                    <div class="d-flex align-items-center justify-content-center ">
                        <input class="form-control w-50" type="search" placeholder="Search" aria-label="Search">
                        <button id="searchBtn" class=" flex-shrink-0 btn btn-outline-primary" type="submit">검색</button>
                    </div>
                  </div>
                  <!-- 글쓰기버튼 -->
                  <div class="col-11 d-flex justify-content-end align-items-center flex-wrap gap-2">
                    <button type="button" class="btn btn-outline-primary " onclick="location.href='write.html'">글쓰기</button>
                  </div>
                  <!-- 다음버튼 -->
                  <div class="text-center">
                        <ul class="pagination justify-content-center" style="margin:20px 0">
                            <li class="page-item"><a class="page-link" href="#">◁</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">▷</a></li>
                        </ul>
                  </div>
               </div>
           
        


        <!-- 게시판 끝 -->
        
    <!-- ------------------------------- -->
    <!-- 본문 종료-->
    <!-- ------------------------------- -->

         <!-- footer 시작 -->
  	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- footer 종료 -->
  </div>

  <!--스크립트 적용 -->
  <script src="js/main.js"></script>
   <!-- 스크립트5버전 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>

