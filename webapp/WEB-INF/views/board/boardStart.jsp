<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
	<title>모두의 가계부</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">


 

<!-- 수정 확인 -->
<!-----------header------------------>

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	

<!----------------- container------------------->

<div class="container text-center" >
 
	<div class="carousel-item active">
			<div class="carousel-caption d-none d-md-block mb-5  text-center">	
				<div style="margin-bottom:110px;">
					<h4 class="mx-auto" style="color: black;text-shadow:none;" >사진과 가계부를</h4>
					<h4 class="mx-auto" style="color: black;text-shadow:none;"> 멤버들과 <span style="color:#00b0f0; text-shadow:none;"> 공유 </span>하세요</h4>
	        
	        	<a class="btn btn-primary  mt-4 mx-auto" style="text-shadow:none; " href="${pageContext.request.contextPath }/board/${authUser.groupNo}/write">첫 글 올리기</a>       
	            </div>
			
				<br>
			</div>
               <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/board1.png" alt="게시판에 글이 없음">
		</div>
		
	



</div>





	<!----------------- footer------------------->		
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	<script type="text/javascript">

	

		$(document).ready(function(){
			
			$('.menuTab').removeClass("active");
			$("#btn_board").addClass("active");
		});
	
		/*좋아요*/


		$("#like").on('click',function(){

			var fileName = $("#like").attr('src');
			fileName = fileName.split(".");
			fileName = fileName[0].split("/");
			fileName = fileName.pop(); /* 배열의 맨마지막 요소 불러오기 */
			console.log(fileName);
			if(fileName=="like_off"){
				$("#like").attr("src","${pageContext.request.contextPath }/assets/images/like.png");
			} else{
				$("#like").attr("src","${pageContext.request.contextPath }/assets/images/like_off.png");
			}
		

		});

		/*   댓글 펼치기,감추기   */


		$("#btn-comment").on("click",function(){

			var val = $('#btn-comment').val();
			console.log(val);

			if(val==0){
				$('.comment-top').hide();
				$('#btn-comment').val("1");
				$(this).html("댓글 감추기");
			} else {

				$('.comment-top').show();
				$('#btn-comment').val("0");
				$(this).html("댓글 더 보기");
			}
			
			return	

		});    


		/*  이미지 미리보기 , 확장자 체크  */		

		var loadFile = function(event) {
			var addImg = document.getElementById('addImg');
			addImg.src = URL.createObjectURL(event.target.files[0]);

			var fileName = $("#boardUpload").val();

			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			console.log(fileName);
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){

				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");

				$("#boardUpload").val('');
				$("#addImg").hide();
				
				/*$('#boardUploadModal').modal('hide');*/
				
			} else{
				$("#addImg").show();
			}

		};

		/*  navbar 스크롤 제어  */

		//Hide Header on on scroll down 
		var didScroll; 
		var lastScrollTop = 0; 
		var delta = 5; 
		var navbarHeight = $('header').outerHeight(); 

		$(window).scroll(function(event){ 
			didScroll = true; 
		}); 

		setInterval(function() { 
			if (didScroll) { 
				hasScrolled(); 
				didScroll = false; 
			} 
		}, 250); 

		function hasScrolled() { 
			var st = $(this).scrollTop(); 

         // Make sure they scroll more than delta 
         if(Math.abs(lastScrollTop - st) <= delta) 
         	return; 

         // If they scrolled down and are past the navbar, add class .nav-up. 
         // This is necessary so you never see what is "behind" the navbar. 
         if (st > lastScrollTop && st > navbarHeight){ 
         // Scroll Down 
         $('header').removeClass('nav-down').addClass('nav-up');
     } else { 
         // Scroll Up 
         if(st + $(window).height() < $(document).height()) { 
         	$('header').removeClass('nav-up').addClass('nav-down'); 
         } 
     } 

     lastScrollTop = st; 

     

 }
</script>
</body>
