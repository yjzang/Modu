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

<div class="container" >
			
<div class="mb-5 text-center">
      <a href="${pageContext.request.contextPath }/board/${authUser.groupNo}/write" class="btn btn-lg btn-outline-primary" style="font-weight:bold; border:solid 2px; width:900px; ">
						총무만 할 수 있는 '새 글쓰기'		
		</a>
</div>
	
	
	<div id="postList" >
		
			
			<!-- Delete Modal -->

			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							
						
						</div>
						<div class="modal-body d-flex" style="align-items: center; justify-content: center;">
							<div style="font-weight: bold;">정말로 삭제 하시겠습니까?</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-danger" id="btn_del" >삭제</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Delete Comment Modal -->

			<div class="modal fade" id="deleteCmtModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							
						
						</div>
						<div class="modal-body d-flex" style="align-items: center; justify-content: center;">
							<div style="font-weight: bold;">정말로 삭제 하시겠습니까?</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-outline-danger" id="btn_delCmt" >삭제</button>
						</div>
					</div>
				</div>
			</div>
			
			

			<!-- Img Upload Modal -->
			<div class="modal fade" id="boardUploadModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title mt-2" id="exampleModalCenterTitle">&nbsp;사진 추가</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form enctype="multipart/form-data" >
								<div class="form-group p-2" style="position: relative;">
									<input type="file" class="custom-file-input" id="boardUpload"  multiple="multiple" onchange="loadFile(event);">
									<label class="custom-file-label text-center pr-5" for="inputGroupFile04">이미지 업로드 &emsp;</label>
									<div class="rounded col-2" style="float : left"><img id="addImg"  src="" class="w-100 mx-auto mt-3"></div>
								</div>
							</form>

							<!-- <form enctype="multipart/form-data">
								<div class="form-group p-2">
									<input type="file" class="form-control-file" id="boardUpload" multiple="true" onchange="loadFile(event);">
									<img id="addImg"  src="" class="w-100 mx-auto mt-3">
								</div>
							</form> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">추가</button>
						</div>
					</div>
				</div>
			</div>
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
			
			fetchBoard();

		});
	
		
		/* 게시글 불러오기 AJAX */
		
		function fetchBoard(){
			/* console.log("초기화 1이어야하는 "+ begin); */
			
			
		
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/getList",
				  type : "POST",
				  /*   data : {begin : 1},
				  dataType : "json", */
				
				  success : function(list){
					  
									  
					  $.each(list, function(idx, val) {
							console.log(idx + " " + val.boardNo);
							var src ='${pageContext.request.contextPath}/assets/images/like_off.png';
							if(val.likeState==1){
								src ='${pageContext.request.contextPath}/assets/images/like_on.png';
							} 
							render(val,"down",src);
							fetchComment(val.boardNo);	  
					   });
					  
				  
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
			  
		}
		
		
		
		
		
	
		/* 게시글 그리기 함수 */
		function render(vo,updown,src){
			  
						  
			  str= " ";
			  str+= " <div id='board' data-del='board_"+vo.boardNo+"'  data-no='"+vo.boardNo +"'  class='card text-center w-75 mx-auto my-2'>";
			  str+= "	<div class='card-header'>";
			  str+= "		<h4 class='card-title mt-3'>" +vo.boardTitle +"</h4>";
			  str+= "		<div class='text-left ml-5'>" +vo.boardRegDate +"</div>";
			  str+= "		<div class='text-right mr-5'>";
			  str+= "			<a href='${pageContext.request.contextPath }/board/${authUser.groupNo}/write' class='btn btn-sm btn-secondary'>";
			  str+= "			     수정	</a>	";
			  str+= "			<button type='button' class='btn btn-sm btn-secondary' data-toggle='modal' data-target='#deleteModal'>";
			  str+= "			     삭제	</button>";
			  str+= "		</div>";
			  str+= "	    <div id='carouselExampleIndicators_"+vo.boardNo+"' class='carousel slide' data-ride='carousel'>";
			  str+= "			<ol class='carousel-indicators'>";
			  str+= "				<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active' style='color: #00b0f0'></li>";	  
			  str+= "				<li data-target='#carouselExampleIndicators' data-slide-to='1'></li>";
			  str+= "				<li data-target='#carouselExampleIndicators' data-slide-to='2'></li>";
			  str+= "			</ol>";
			  
			  
			  str+= "			<div class='carousel-inner boardImg'>";
			  
			  
			  //if(vo.imgList[0].saveName!=null){
			  if(typeof(vo.imgList[0]) != 'undefined'){
			  str+= "					<div class='carousel-item active'>";
			  str+= "		   	 			<img class='d-block' src='${pageContext.request.contextPath }/upload/"+ vo.imgList[0].saveName+"' alt='First slide'>"; 
			  str+= "					</div>";
			  
				  for(i=1; i < vo.imgList.length; i++){
					  
					  
					  str+= "			<div class='carousel-item' >";
					  str+= "				<img class='d-block' src='${pageContext.request.contextPath }/upload/"+ vo.imgList[i].saveName+"' alt='Second slide'>"; 
					  str+= "			</div>";
					  
					  
					  
				  }
			  
			  } else {					
				  
				  str+= "					<div class='carousel-item active' id='btn_upload'  data-toggle='modal' data-target='#boardUploadModal' style='cursor:pointer;'>";
				  str+= "		   	 			<img class='d-block' src='${pageContext.request.contextPath }/assets/images/plus01.png' alt='First slide' style='width:100px; height:auto; margin-top:100px; margin-bottom:50px;'>";
				  str+= "                        <div>";
				  str+= "                         	<h3 style='color:#50c8ef; font-weight:bold;'> 멤버들과의 추억이 담긴 사진을 올려주세요</h3>";
				  str+= "                         	<br><br><br>";
				  str+= "                         </div>";
				  str+= "					</div>";
				  				
				
			  }
	
			  
			  str+= "			</div>";
			  str+= "			<a class='carousel-control-prev' href='#carouselExampleIndicators_"+vo.boardNo+"' role='button' data-slide='prev'>";
			  str+= "				<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
			  str+= "				<span class='sr-only'>Previous</span>";
			  str+= "			</a>";
			  str+= "			<a class='carousel-control-next' href='#carouselExampleIndicators_"+vo.boardNo+"' role='button' data-slide='next'>";
			  str+= "				<span class='carousel-control-next-icon' aria-hidden='true'></span>";
			  str+= "				<span class='sr-only'>Next</span>";
			  str+= "			</a>";
			  str+= "	    </div>";
		
			  
			  
			  
			  str+= "	    <div class='text-right mr-5'>";
			  str+= "	  		 <button type='button' id='btn_upload'  class='btn btn-primary' data-toggle='modal' data-target='#boardUploadModal'>";
			  str+= "				   사진 추가하기 	";
			  str+= "	 		 </button>";
			  str+= "	    </div>";
			  
			  
				
			  str+= "	    <div class='card-body'>";
			  str+= "	   		<div class='text-left p-5 mb-4' style='border:dashed black 1px ; width: 50%'>";
			  str+= "	    	<pre class='card-text' id='boardContent' >"+ vo.boardContent + "</pre>";
			  str+= "	    </div>";
			  str+= "	    <div class='text-left my-3'>";
			  str+= "	       <span class='p-2' style='border:#54c9ad 2px solid; border-radius: 15px; '>";
			  str+= "	          #6월모임";
			  str+= "	       </span>";
			  str+= "	    </div>";
			  str+= "	    <div>";
			  str+= "	      <table class='table table-sm text-center'>";
			  str+= "	         <thead class='thead-light'>";
			  str+= "	  	       <tr>";
			  str+= "	    	     <th scope='col'></th>";
			  str+= "	   		     <th scope='col'>날짜</th>";
			  str+= "	   		     <th scope='col'>사용내역</th>";
			  str+= "	    	     <th scope='col'>금액</th>";
			  str+= "	   		     <th scope='col'>분류</th>";
			  str+= "	     	     <th scope='col'>태그</th>";
			  str+= "	  	       </tr>";
			  str+= "	         </thead>";
			  str+= "	         <tbody>";
			  str+= "	           <tr>";
			  str+= "	   			  <th scope='row'>";
			  str+= "	  			      <input width=40px type='checkbox' aria-label='Checkbox for following text input'>";
			  str+= "	  			  </th>";
			  str+= "	  			  <td>2018/06/28</td> <td>삼겹살</td>  <td>150000</td> <td>식비</td> <td>#6월모임</td>";
			  str+= "	  		   </tr> ";
			  str+= "	  		   <tr> ";
			  str+= "					 <th scope='row'>	<input type='checkbox' aria-label='Checkbox for following text input'>	</th>";
			  str+= "	   				 <td>2018/06/28</td><td>소주한잔</td><td>77000</td><td>식비</td><td>#6월모임</td>";
			  str+= "	           </tr>";
			  str+= "	         </tbody>";
			  str+= "	      </table>";
			  str+= "	    </div>";
			  
			  
			  
			  str+= "	    <div class='card-footer p-1'> ";
			  str+= "	    	<div class='text-left my-2'>";
			  str+= "	   			<span>";
			  str+= "	 				  <button class='t-button p-1 ml-2'> <img id='like_"+vo.boardNo+"' data-likeno='"+vo.boardNo+"' width=50px src='"+src+"' data-state='"+vo.likeState+"'> </button>";
			  str+= "	  			</span>";
			  str+= "	    		<span id='likeCount_"+vo.boardNo+"' class='ml-2'>";
			  str+= "	  				"+vo.likeCount+"명의 회원이 좋아합니다.";
			  str+= "	  			</span>";
			  str+= "	        </div>";
			  
			 
			  str+= "		<div>";
			  str+= "	   		  <div class='input-group my-3'>";
			  str+= "	 		 		<div class='input-group-prepend'>";
			  str+= "	 				<span class='input-group-text' > ${authUser.userName} </span>";
			  str+= "	  		  </div>";
			  str+= "	 		  <textarea class='form-control' placeholder='댓글을 입력하세요' id='commentContent_"+vo.boardNo+"' aria-label='Recipient's username' aria-describedby='basic-addon2' />";
			  str+= "	   		  <div class='input-group-append'>";
			  str+= "	   				<button class='btn btn-outline-secondary' type='button' data-writeno="+vo.boardNo+"><img src='${pageContext.request.contextPath }/assets/images/write01.png'></button>";
			  str+= "	   		  </div>";
			  str+= "		</div>";
			  str+= "		<div class='text-left my-3'><span>";
			  str+= "			                       <span id='cmtCount_"+vo.boardNo+"' class='ml-3' style='color:gray;'>  댓글 "+vo.cmtCount+"개</span></div>";
 			  str+= "	    	 <div id='cmtList_"+vo.boardNo+"' style=' overflow-x:hidden; overflow-y:auto;  max-height:720px;'>";
			  
			  str+= "	    	 </div>";
			  
			  str+= "	    </div>";
			  str+= "	 </div>";
			  str+= "</div>";
			
							
			  
			  
			  if(updown=="up"){
				  
				  $("#postList").prepend(str);
				  
			  } else{
				  
				  $("#postList").append(str);
			  }
				  
		}
			  

			  
		/* 댓글 등록 이벤트 */
		$("div").on('click','button[data-writeno]',function(){
		
			var boardNo = $(this).data("writeno");
			var commentContent = $("#commentContent_"+boardNo).val(); 
			
			$.ajax ({
				
				url: "${pageContext.request.contextPath}/board/${authUser.groupNo}/addCmt",
				type:"POST",
				data: {boardNo:boardNo, commentContent:commentContent},
				dataType : "json",
				
				
				success : function(cmtCount){
					
					if(cmtCount!=-1){
						
						$("#cmtList_"+boardNo).empty();
						$("#commentContent_"+boardNo).val("");
						fetchComment(boardNo);
						$("#cmtCount_"+boardNo).text("댓글 " +cmtCount+"개");
					
					}
					
					
				},
				
				error : function(XHR, status, error){
					
					console.error(XHR+status+error);
					
				}
				
			});
				
			
			return false;
		
		});
		
		
		
		/* 댓글 지우기 */
		function removeComment(){
			
		
		}
		
		
		/*  댓글 불러오기 AJAX */
		function fetchComment(boardNo){
		 
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/getCmtList",
				  type : "POST",
				  data : {boardNo : boardNo},
				  dataType : "json", 
				 
				  success : function(list){
					  
				      if(list.length!=0){
				    	  
				      
				    	  $.each(list, function(idx, val) {
								console.log(idx + " " + val.boardNo);
								render_comment(val,"down",idx);
						   });
				      }					  
				  
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
			  
		}
		
		
			  
		/* 댓글 그리기 함수 */
		function render_comment(vo,updown,idx){

			  
			  str= " ";
			  
			  if(idx==0){
				  
				  str+= "	    	 <div id='cmt_"+vo.commentNo+"'>";
				  str+= "	      		<div class='my-2 text-left' id='multiCollapseExample1' >";
				  str+= "	   				 <div class='card' id='top_"+vo.boardNo+"'>";
				  str+= "						  <h5 class='card-header'><span class='mr-3  mb-1'><img src='${pageContext.request.contextPath }/assets/images/club02.png'></span><span id='userName'>"+vo.userName+"</span>";
				  str+= "						  <span style='color:gray;margin-left:10px;'>"+vo.commentRegDate+"</span><span class='ml-3 float-right mt-2 pt-1 delCmt' data-delcmtno='"+vo.commentNo+"' data-cmtresetno='"+vo.boardNo+"' style='cursor:pointer' >&times</span></h5>";
				  str+= "	   					  <div class='card-body comment'>";
				  str+= "	  					        <pre class='comment'>"+vo.commentContent+"</pre>";
				  str+= "	   					  </div>";
				  str+= "	  				 </div>";
				  str+= "	   		 	</div>";
				  str+= "	 		 </div>";
				  
				  
				  str+= "	    	 <div id='cmt_"+vo.commentNo+"'>";
				  str+= "	      		<div class='collapse multi-collapse"+vo.boardNo+" my-2 text-left' id='multiCollapseExample1'>";
				  str+= "	   				 <div class='card'>";
				  str+= "						  <h5 class='card-header'><span class='mr-3  mb-1'><img src='${pageContext.request.contextPath }/assets/images/club02.png'></span><span id='userName'>"+vo.userName+"</span>";
				  str+= "						  <span style='color:gray;margin-left:10px;'>"+vo.commentRegDate+"</span><span class='ml-3 float-right mt-2 pt-1 delCmt' data-delcmtno='"+vo.commentNo+"' data-cmtresetno='"+vo.boardNo+"' style='cursor:pointer' >&times</span></h5>";
				  str+= "	   					  <div class='card-body comment'>";
				  str+= "	  					        <pre class='comment'>"+vo.commentContent+"</pre>";
				  str+= "	   					  </div>";
				  str+= "	  				 </div>";
				  str+= "	   		 	</div>";
				  str+= "	 		 </div>";
				  
			  } else if(idx==1) {
				  
				  str+= "	   		 <p>";
				  str+= "	   			 <button class='btn btn-sm btn-secondary btn-comment' id='btn-comment' data-toggle='collapse' data-target='.multi-collapse"+vo.boardNo+"' aria-expanded='false' aria-controls='multiCollapseExample1' value='0' data-cmtboardno='"+vo.boardNo+"'>댓글 더 보기</button>";
				  str+= "	    	 </p>";
			  
				  str+= "	    	 <div id='cmt_"+vo.commentNo+"'>";
				  str+= "	      		<div class='collapse multi-collapse"+vo.boardNo+" my-2 text-left' id='multiCollapseExample1'>";
				  str+= "	   				 <div class='card'>";
				  str+= "						  <h5 class='card-header'><span class='mr-3  mb-1'><img src='${pageContext.request.contextPath }/assets/images/club02.png'></span><span id='userName'>"+vo.userName+"</span>";
				  str+= "						  <span style='color:gray;margin-left:10px;'>"+vo.commentRegDate+"</span><span class='ml-3 float-right mt-2 pt-1 delCmt' data-delcmtno='"+vo.commentNo+"' data-cmtresetno='"+vo.boardNo+"' style='cursor:pointer' >&times</span></h5>";
				  str+= "	   					  <div class='card-body comment'>";
				  str+= "	  					        <pre class='comment'>"+vo.commentContent+"</pre>";
				  str+= "	   					  </div>";
				  str+= "	  				 </div>";
				  str+= "	   		 	</div>";
				  str+= "	 		 </div>";
				  
			  } else {
			  
				  
				  str+= "	    	 <div id='cmt_"+vo.commentNo+"'>";
				  str+= "	      		<div class='collapse multi-collapse"+vo.boardNo+" my-2 text-left' id='multiCollapseExample1"+vo.boardNo+"'>";
				  str+= "	   				 <div class='card'>";
				  str+= "						  <h5 class='card-header'><span class='mr-3  mb-1'><img src='${pageContext.request.contextPath }/assets/images/club02.png'></span><span id='userName'>"+vo.userName+"</span>";
				  str+= "						  <span style='color:gray;margin-left:10px;'>"+vo.commentRegDate+"</span><span class='ml-3 float-right mt-2 pt-1 delCmt' data-delcmtno='"+vo.commentNo+"' data-cmtresetno='"+vo.boardNo+"' style='cursor:pointer' >&times</span></h5>";
				  str+= "	   					  <div class='card-body comment'>";
				  str+= "	  					        <pre class='comment'>"+vo.commentContent+"</pre>";
				  str+= "	   					  </div>";
				  str+= "	  				 </div>";
				  str+= "	   		 	</div>";
				  str+= "	 		 </div>";
				  
			  
			  
			  
			  }
			  
			  
  			  if(updown=="up"){
				  
				  $("#cmtList_"+vo.boardNo).prepend(str);
				  
			  } else{
				  $("#cmtList_"+vo.boardNo).append(str);
			  }
			
		}
			  
		
		
		/*좋아요*/

		
		$("div").on('click',"img[data-likeno]",function(){

			
			var likeState = $(this).data("state");
			var boardNo = $(this).data("likeno");
			var src= $("[data-likeno="+boardNo+"]").attr("src");
			if(likeState==0){
				src="${pageContext.request.contextPath}/assets/images/like_on.png";
				
			} else{
				
				src= "${pageContext.request.contextPath}/assets/images/like_off.png";
			}
			
			console.log("삼항 후"+src);
			$("[data-likeno="+boardNo+"]").attr("src",src);      
			
			
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/upLike",
				  type : "POST",
				  data : {boardNo:boardNo, likeState: likeState},
				  dataType : "json",	
				
				  success : function(resultVo){
					  
					  console.log(resultVo);
					  $("#likeCount_"+boardNo).text(resultVo.likeCount+"명의 회원이 좋아합니다.");
					  $("[data-likeno="+boardNo+"]").data("state",resultVo.likeState);						
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
			
			return false;

		});
			  
			  
			  
			  
		/* 게시글 지우기 함수 */
		function remove(boardNo){
		
			$("[data-del=board_"+boardNo+"]").remove();
			
			
		}
		
	
		
	
		
		
		/* 게시글 삭제 Ajax */
		$("#btn_del").on("click",function(){
			
			
			var boardNo = $("#board").data('no');
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/delete",
				  type : "POST",
				  data : {boardNo:boardNo},
				  dataType : "json",	
				
				  success : function(flag){
						 
					
						  remove(boardNo);
						  $("#deleteModal").modal('hide');
					
											
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
			
			
			 
		});
		
		
		/* 댓글 삭제 이벤트 핸들러 */
		$(document).on("click","div span[data-delcmtno]",function(){
			
			
			var commentNo = $(this).data('delcmtno');
			var boardNo = $(this).data('cmtresetno'); 
			$('#deleteCmtModal').attr('delboardno',boardNo);
			$('#deleteCmtModal').attr('delcommentno',commentNo);
			$('#deleteCmtModal').modal();
			
			 
		});
		
		
		/* 댓글 삭제 ajax */
		$("#btn_delCmt").on("click",function(){
			
	     	var boardNo = $('#deleteCmtModal').attr('delboardno');
		    var commentNo = $('#deleteCmtModal').attr('delcommentno');
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/delCmt",
				  type : "POST",
				  data : {commentNo: commentNo, boardNo: boardNo},
				  dataType : "json",	
				
				  success : function(cmtCount){
						 
						if(cmtCount!=-1){
							
							  alert("삭제되었습니다.");
							  $("#cmtList_"+boardNo).empty();
							  fetchComment(boardNo);
							  $("#cmtCount_"+boardNo).text("댓글 " +cmtCount+"개");
							  $("#deleteCmtModal").modal('hide');
						
						}
						
											
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
			
		});

		/*   댓글 펼치기,감추기   */

	 	$(document).on("click","div #btn-comment",function(event){
			
			var val = $(this).val();
			var boardNo = $(this).data('cmtboardno');
			console.log(boardNo+"  ---"+val);
			if(val==0){
				$('#top_'+boardNo).hide();
				$(this).val("1");
				$(this).html("댓글 감추기");
				
			} else {

				$('#top_'+boardNo).show();
				$(this).val("0");
				$(this).html("댓글 더 보기");
			}
			
		});   


		/*  이미지 미리보기 , 확장자 체크  */		

		var loadFile = function(event) {
			var addImg = document.getElementById('addImg');
			addImg.src = URL.createObjectURL(event.target.files[0]);
			
			var fileName = event.target.files[0].name;
			 
			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			
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
