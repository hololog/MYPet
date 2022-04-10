// 메인페이지 중간 캠페인 텍스트 애니메이션 효과
let campaign = document.querySelector(".campaign");
let campaignText = document.querySelector(".campaign-text");

campaign.addEventListener('mouseover', function(){
    campaignText.style.animation = "slide 1.5S ease-out";
});
campaign.addEventListener('mouseout', function(){
    campaignText.style.animation = "disappear 1.5S ease-out forwards"
});


//로그인 
//$(document).ready(function(){
//	$('#login-email').focusout(function(){
//		$.ajax({
//			url:"요청url",
//			data:"요청시 같이 보낼 데이터",
//			type:"GET",
//			
//		})
//		.done(function(rdata){
//			
//		})
//	});
//});
//$('.dup').click(function(){

//	$.ajax({
//		url:"${pageContext.request.contextPath }/member/memberCheck2",
//		data:{"id":$('#id').val()},
//		success:function(rdata){
//			if(rdata=='idok'){
//				rdata="아이디 사용가능";
//			}else{
//				rdata="아이디 중복";
//			}
//			$('#divdup').html(rdata);
//		}
//	});//
//
//});//
 		
