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
      <a href="${pageContext.request.contextPath }/board/${gvo.groupNo}/write" class="btn btn-lg btn-outline-primary" style="font-weight:bold; border:solid 2px; width:900px; ">
						총무만 할 수 있는 '새 글쓰기'		
		</a>
</div>

			
<div class="mb-5 text-center">
      <a href="${pageContext.request.contextPath }/board/${gvo.groupNo}/goCal" class="btn btn-lg btn-outline-secondary" style="font-weight:bold; border:solid 2px; width:900px; ">
						달 력 연 습
		</a>
</div>

<div class="mb-5 text-center">
      <a href="${pageContext.request.contextPath }/board/${gvo.groupNo}/goAuto" class="btn btn-lg btn-outline-secondary" style="font-weight:bold; border:solid 2px; width:900px; ">
						오토 연 습
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
								<input type="hidden" name="boardNo" id="imgBoardNo">
								<input type="hidden" name="userNo" value="${authUser.userNo}">
								<div class="form-group p-2" style="position: relative;">
									<input type="file" class="custom-file-input" id="boardUpload"  multiple="multiple" onchange="loadFile(event);">
									<label class="custom-file-label text-center pr-5" for="inputGroupFile04">이미지 업로드 &emsp;</label>
									<div id="imgPreview">
										<div class="rounded col-4" style="float : left">
											<img id="addImg0"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg1"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg2"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div style="clear:both;"> </div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg3"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg4"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg5"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div style="clear:both;"> </div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg6"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg7"  src="" class="w-100 mx-auto mt-3">
										</div>
										<div class="rounded col-4" style="float : left">
											<img id="addImg8"  src="" class="w-100 mx-auto mt-3">
										</div>
									</div>
								
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
							<button type="button" id="btn_submit" class="btn btn-primary">추가</button>
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
							fetchAccount(val.boardNo,val.tagNo);
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
			  str+= "			<a href='${pageContext.request.contextPath }/board/${authUser.groupNo}/modifyForm/"+vo.boardNo+"' class='btn btn-sm btn-secondary'>";
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
			  
			  
			  str+= "			<div class='carousel-inner boardImg' id='boardImg_"+vo.boardNo+"'>";
			  
			  
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
				  
				  str+= "					<div class='carousel-item active' data-imgboardno='"+vo.boardNo+"' id='btn_upload'  data-toggle='modal' data-target='#boardUploadModal' style='cursor:pointer;'>";
				  str+= "		   	 			<img class='d-block'  src='${pageContext.request.contextPath }/assets/images/plus01.png' alt='First slide' style='width:100px; height:auto; margin-top:100px; margin-bottom:50px;'>";
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
			  str+= "	  		 <button type='button' id='btn_upload' data-imgboardno='"+vo.boardNo+"' class='btn btn-primary' data-toggle='modal' data-target='#boardUploadModal'>";
			  str+= "				   사진 추가하기 	";
			  str+= "	 		 </button>";
			  str+= "	    </div>";
			  
			  
				
			  str+= "	    <div class='card-body'>";
			  str+= "	   		<div class='text-left p-5 mb-4' style='border:dashed black 1px ; width: 50%'>";
			  str+= "	    	<pre class='card-text' id='boardContent' >"+ vo.boardContent + "</pre>";
			  str+= "	    </div>";
			  str+= "	    <div class='text-left my-3'>";
			  if(vo.tagNo!=null){
				  str+= "	       <span class='p-2' style='border:#54c9ad 2px solid; border-radius: 15px; '>";
				  str+= "	          #"+ vo.tagName+ "";
				  str+= "	       </span>";
			  }
			  str+= "	    </div>";
			  str+= "	    <div>";
			  str+= "	      <table class='table table-sm text-center'>";
			  str+= "	         <thead class='thead-light'>";
			  str+= "	  	       <tr>";
			  str+= "	   		     <th scope='col'>날짜</th>";
			  str+= "	   		     <th scope='col'>사용내역</th>";
			  str+= "	    	     <th scope='col' style='font-size:14pt;'>금액(원)</th>";
			  str+= "	     	     <th scope='col' style='font-size:14pt;'>인원(명)</th>";
			  str+= "	   		     <th scope='col'>장소</th>";
			  str+= "	     	     <th scope='col'>지도</th>";
			  str+= "	  	       </tr>";
			  str+= "	         </thead>";
			  str+= "	         <tbody id='accountList_"+vo.boardNo+"'>";
			  
			  str+=	" <td colspan='8' style='color:gray;' id='accDefault_"+vo.boardNo+"'>가계부가 첨부되지 않았습니다.</td>"	
			  
			  str+= "	         </tbody>";
			  str+= "	      </table>";
			  str+= "	    </div>";
			  
			  
			  
			  str+= "	    <div class='card-footer p-1'> ";
			  str+= "	    	<div class='text-left my-2'>";
			  str+= "	   			<span>";
			  str+= "	 				  <button class='t-button p-1 ml-2'> <img id='like_"+vo.boardNo+"' data-likeno='"+vo.boardNo+"' width=50px src='"+src+"' data-state='"+(vo.likeState==null?0:vo.likeState)+"'> </button>";
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
			  
		/*  사진추가 할때 보드 넘버 첨부하기 */
		$(document).on('click','div [data-imgboardno]', function(){
			
			var boardNo= $(this).data('imgboardno');
			console.log(boardNo);
			$("#imgBoardNo").val(boardNo);
			for(var k=0; k<9 ;k++){
				addImg[k]= document.getElementById('addImg'+k);
				addImg[k].src='';	
				$("#boardUpload").val('');
			}
			
		});
			 
		/*  이미지 미리보기 , 확장자 체크  */		
		var up_files = {};
		var loadFile = function(event) {
			
			
			var addImg = new Array();
			
			for(var k=0; k<9 ;k++){
				addImg[k]= document.getElementById('addImg'+k);
				addImg[k].src='';	
			}
			
			if(event.target.files.length>9){
				
				alert("이미지는 한번에 9개까지만 등록 가능합니다.")
				
			} else{
			
				for(var i=0;i<event.target.files.length; i++ ){
					$("#imgPreview").show();
					$("#addImg"+i).show();
					addImg[i]= document.getElementById('addImg'+i);
					addImg[i].src = URL.createObjectURL(event.target.files[i]);
					var fileName= new Array();
					var file = event.target.files[i];
					up_files[i] = file;
					fileName[i] = event.target.files[i].name;
					fileName[i] = fileName[i].slice(fileName[i].indexOf(".") + 1).toLowerCase();
					console.log(fileName[i]);
					
					if(fileName[i] != "jpg" && fileName[i] != "png" &&  fileName[i] != "gif" &&  fileName[i] != "bmp"){
						
						alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
						$("#boardUpload").val('');
						$("#imgPreview").hide();
						return false;
						/*$('#boardUploadModal').modal('hide');*/
			
					} else{
						
					}
				 }

			}
		};
			  
		
		
	/* 사진추가 aJAX  */
	 $('#btn_submit').on('click',function() {                        
                var form = $('#boardUpload')[0];
                console.log("##4341"+form);
                var formData = new FormData(form);
    
                for (var index = 0; index < Object.keys(up_files).length; index++) {
                    //formData 공간에 files라는 이름으로 파일을 추가한다.
                    //동일명으로 계속 추가할 수 있다.
                    formData.append('files',up_files[index]);
                }	
                var userNo = ${authUser.userNo};
    			var boardNo = $("#imgBoardNo").val();
			
			$.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                cache : false,
                timeout : 600000,
                url : '${pageContext.request.contextPath}/board/${authUser.groupNo}/addImg/'+boardNo,
                dataType : 'JSON',
                data : formData,
                success : function(list) {
                    //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                    //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                    //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                 /*    if (result === -1) {
                        alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                        // 이후 동작 ...
                    } else if (result === -2) {
                        alert('파일이 10MB를 초과하였습니다.');
                        // 이후 동작 ...
                    } else { 
                        alert('이미지 업로드 성공'); */
                        renderImg(list,boardNo);
						$("#boardUploadModal").modal('hide');
                    
                }
                //전송실패에대한 핸들링은 고려하지 않음
            });
		  
	 });
			  
	
	/* 사진 추가 그리기 함수 */
	
	function renderImg(list,boardNo){
	      str= "";
		  str+= "					<div class='carousel-item active'>";
		  str+= "		   	 			<img class='d-block' src='${pageContext.request.contextPath }/upload/"+ list[0].saveName+"' alt='First slide'>"; 
		  str+= "					</div>";
		  
			  for(i=1; i < list.length; i++){
				  
				  
				  str+= "			<div class='carousel-item' >";
				  str+= "				<img class='d-block' src='${pageContext.request.contextPath }/upload/"+ list[i].saveName+"' alt='Second slide'>"; 
				  str+= "			</div>";
				  
				  
				  
		  }
			  
		  $("#boardImg_"+boardNo).empty();
		  $("#boardImg_"+boardNo).append(str);
			  
	}
		/* 가계부 ajax */ 
		
		function fetchAccount(boardNo,tagNo){
			
			
			$.ajax({
				  
				  url : "${pageContext.request.contextPath}/board/${authUser.groupNo}/getAccountList",
				  type : "POST",
				  data : {tagNo: tagNo},
				  dataType : "json", 
				 
				  success : function(list){
					  
				      if(list.length!=0){
				    	  
				    	  console.log("!!"+list.length);
				      
				    	  $.each(list, function(idx, val) {
				    		 
				    	  		
								renderAccount(val,"down",boardNo);
						   });
				      }					  
				  
				  },
				  
				  error : function(XHR, status, error){
					 console.error(XHR+status+error);
				  }
				  
			  });
		
		
		}
		
		/* 가계부 그리기 */ 
		
		function renderAccount(vo,updown,boardNo){
			  str= " ";
			
			  str+= "	    	 <tr id='delAcc_"+vo.accountbookNo+"'>";
			  str+= "				<input type='hidden' name='accountList["+i+"].accountbookNo' val='"+vo.accountbookNo+"' >";
			  str+= "						<td style='width:160px;'>"+vo.accountbookRegDate+"</td>";
			  str+= "						<td id='accUsage_"+vo.accountbookNo+"'>"+vo.accountbookUsage+"</td>";
			  str+= "						<td>"+vo.accountbookSpend+"</td>";
			  str+= "						<td style='width:80px;'>"+((vo.accountbookPersonnel!=null)?vo.accountbookPersonnel:'')+"</td>"; 
			  str+= "						<td>"+((vo.accountbookPlace!=null)?vo.accountbookPlace:'')+"</td>";
			  str+= "						<td><button type='button' class='btn t-button p-0' data-toggle='modal' data-target='#mapModal'><img src='${pageContext.request.contextPath }/assets/images/mapIcon.png'></button></td>";
			
			  str+= "			</tr>";
			  
			
			  
			  if(updown=="up"){
				  
				  $("#accountList_"+boardNo).prepend(str);
				  
			  } else{
				  
			  	  $("#accDefault_"+boardNo).remove();
				  $("#accountList_"+boardNo).append(str);
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
						  alert("삭제되었습니다.");
					
											
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
							
							  /* alert("삭제되었습니다."); */
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
