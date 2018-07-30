<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>모임관리</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">


<!-----------header------------------>
	
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	
 
	<div class="container">
		<center>
			<div class="col-5 my-5">
				<h1 class="mt-4">모임관리</h1>
			</div>
			<div class="col-8 my-3">
				<table class="table table-striped text-center" id="myList">
					<thead>
						<tr>
							<th>가입신청자</th>
							<th>자기소개</th>
							<th>수락/거절</th>
						</tr>
					</thead>
					<tbody id="applyList">
					<!-- 가입신청자 -->
					<c:forEach items="${joinList}" var="user">
						<tr>
							<td>${user.userName}</td>
							<td>${user.joinMessage}</td>
							<td class="check">
								<button class="btn btn-sm btn-outline-primary mr-2 " id="${user.user_groupNo }"  name="0" data-toggle="modal" data-target="#exampleModalAccept">수락</button>
								<button class="btn btn-sm btn-outline-secondary" id="${user.user_groupNo }" name="1" data-toggle="modal" data-target="#exampleModalFire">거절</button>
							<%-- 	<input type="hidden" name="user_groupNo" value="${user.user_groupNo }"> --%>
							</td>
						</tr>
					</c:forEach>
					
				     <c:if test="${empty joinList}">
					<tr>
					<td></td>
					<td>가입신청자가 없습니다. </td>
					<td></td> 
					</tr>
					</c:if>  
					</tbody>
				</table>
			</div><br>
            
            <!-- 회원명단  -->
			<div class="col-4 float-left mt-3" style="margin-left: 15%">
				<table class="table table-striped text-center" id="myUserList">
					<thead>
						<tr>
							<th colspan="2">회원 명단</th>
						</tr>
					</thead>
					<tbody class="del" id="userList">
					<c:forEach items="${selectUserList }" var="userList">
					<c:choose>
					<c:when test="${userList.userNo eq gvo.manager }">
					   <tr>
							<td>${userList.userName }</td>
							<td>
								<input type="button" class="btn btn-sm btn-outline-secondary"  style="width: 134px;" value="총무">
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${userList.userName }</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" id="huu" name="${userList.user_groupNo }" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" id="${userList.userNo }" value="${userList.groupNo }" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
					</c:otherwise>
					</c:choose>	
					</c:forEach>	
						
					</tbody>
				</table>
			</div><br><br>

           <form  action="${pageContext.request.contextPath }/groupModify" method="post"  enctype="multipart/form-data">
			<div class="col-5 float-right mt-3" style="margin-right: 8%">
				<h5 class="mb-3">모임 정보 수정</h5><br>
                
				<!-- <label for="gname1">모임 이름</label> -->
				<input type="text" class="form-control w-75 " aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gname1" name="groupName" placeholder="모임이름"><br>
				<!-- <label for="gtag1">모임 설명, 해시태그</label> -->
				<input type="text" class="form-control w-75 " aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gtag1" name="groupExplain" placeholder="모임설명,해시태그"><br><br>
				<input type="hidden" name="groupNo" value="${authUser.groupNo }">

				
					<div class="form-group p-2 w-75" style="position: relative;">
							<input type="file" name="file" class="custom-file-input"
								id="boardUpload" multiple="true" onchange="loadFile(event);">
							<label class="custom-file-label text-center pr-5"
								for="boardUpload">이미지 업로드 &emsp;</label> <img id="addImg" src=""
								class="w-100 mx-auto mt-3">
						</div>
			</div>
			<div style="clear:both;"></div><br>

			<button class="btn btn-lg btn-primary mr-4" data-toggle="modal" data-target="#exampleModal3">&ensp;초대용 링크 생성&ensp;</button>
			<input type="submit" class="btn btn-lg btn-secondary" data-toggle="modal" data-target="#exampleModal4" style="width: 134px;"  value="저장하기">
		    </form>

		</center>


	</div><br>
	<!----------------- footer------------------->		
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    
    <!-- 수락하기 Modal -->
	<div class="modal fade" id="exampleModalAccept" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					수락이 완료되었습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 거절하기 Modal -->
	<div class="modal fade" id="exampleModalFire" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					거절이 완료되었습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 추방하기 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">경고</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					정말 추방하시겠습니까? 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
					<button type="button" class="btn btn-danger" id="delUser" value="">추방하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 총무위임  Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					총무로 위임이 됩니다. 총무로 위임하시겠습니까?
				</div>
				<form action="${pageContext.request.contextPath }/updateMana" method="post" >
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소하기">
					<input type="submit" class="btn btn-info" id="afterMana"  value="위임하기">
					<input type="hidden"  id="afterMana1" name="userNo" value="">
					<input type="hidden" id="afterMana2" name="groupNo" value="">
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 초대용 링크생성  Modal -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">초대용 링크 생성</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				      초대용 링크가 복사되었습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 초대용 링크생성  Modal -->
	<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				      변경사항이 저장되었습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		
		/*  이미지 미리보기 , 확장자 체크  */      

	var loadFile = function(event) {
        var addImg = document.getElementById('addImg');
        addImg.src = URL.createObjectURL(event.target.files[0]);

        var fileName = $("#boardUpload").val();

        fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
        console.log(fileName);
        if (fileName != "jpg" && fileName != "png" && fileName != "gif" && fileName != "bmp") {

            alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");

            $("#boardUpload").val('');
            $("#addImg").hide();

            /*$('#boardUploadModal').modal('hide');*/

        } else {
            $("#addImg").show();
        }

    };

		
		//가입신청자 거절하기 수락하기 
		$('.check').on("click","button",function(){
			
			
			var joinState = $(this).attr("name")
			var user_groupNo =$(this).attr("id")
			console.log("joinState");
			
			
			$.ajax({
		           //요청할때
		           url : "${pageContext.request.contextPath }/check", 
		           type : "post",
		           data : {joinState:joinState,user_groupNo:user_groupNo},  
		           dataType : "json",
		           success : function(List) {
		                  console.log("성공");
		                  
		                  
		                  
		            $("#userList").empty();
		           
		            
		  			$.each(List,  function(index, vo) { 
		                  var str="";
		                  
		                  
		                  if(${ List.userNo ne gvo.manager }){

		                	  str +="  <tr>"; 
		                      str +="     <td>"+ vo.userName +"</td>"; 
		                      str +="     <td>"; 
		                      str +="       <button class='btn btn-sm btn-outline-danger mr-2' id='huu' name='${userList.user_groupNo }' data-toggle='modal' data-target='#exampleModal'>추방</button>  "; 
		                      str +="       <button class='btn btn-sm btn-outline-info' id='${userList.userNo }' value='${userList.groupNo }' data-toggle='modal' data-target='#exampleModal2'>총무위임</button>"; 
		                      str +="     </td>"; 
		                      str +="  </tr>"; 
		                      
		                	  
				            	
				            }else{
				            	
				              str +="  <tr>"; 
				              str +="     <td>"+ vo.userName +"</td>"; 
				              str +="     <td>"; 
				              str +="        <input type='button' class='btn btn-sm btn-outline-secondary'  style='width: 134px;' value='총무'>"; 
				              str +="     </td>"; 
			                  str +="  </tr>"; 	  
				            	
				            }
		                 
		                  $("#userList").append(str);
				            
		  			  });
							
		             		                 
		           },
		           error : function(XHR, status, error) {
		                  console.error(status + " : " + error);
		           }
		      });
			 $(this).closest('tr').remove();
			
			
			if(${empty joinList}){
				 
				 $("#applyList").append("<tr><td></td> <td> 가입 신청자가 없습니다. </td><td></td></tr>");
			 } 
			 
		});
		
		//회원 명단 - 추방하기
		
		$(".del").on("click","button",function(){
			
			var user_groupNo =$(this).attr("name")
			$("#delUser").val(user_groupNo);
			
			
			
			$("#delUser").on("click",function(){
				
			console.log("추방");
			var user_groupNo = $(this).attr("value")
			console.log(user_groupNo);
			
				
		   $.ajax({
		           //요청할때
		           url : "${pageContext.request.contextPath }/deleteUser", 
		           type : "post",
		           data : {user_groupNo:user_groupNo},  
		           dataType : "json",
		           success : function(no) {
		                  console.log(no+"성공");
		          
		          $("#exampleModal").modal("hide");
		          //$('#myUserList > tbody:last > tr:last').remove();
		           },
		           error : function(XHR, status, error) {
		                  console.error(status + " : " + error);
		           }
		      });
		   
		       $("#huu").closest('tr').remove();
			});
			
			
			
		}); 
		
		// 총무위임
		$(".del").on("click","button",function(){
			var userNo = $(this).attr("id")
			
			$("#afterMana1").val(userNo);
			var groupNo = $(this).attr("value")
			console.log(groupNo);
			$("#afterMana2").val(groupNo);
			
			$("#afterMana").on("click",function(){
			console.log("총무");
				var userNo = $("#afterMana1").val()
				var groupNo = $("#afterMana2").val()
				console.log("유저번호 :"+userNo);
				console.log("그룹번호 :"+groupNo);
				
				
				  $("#exampleModal2").modal("hide");
				
				  
			});
			
		});
		
			
		
		
	</script>
</body>
</html>