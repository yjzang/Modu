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
				<table class="table table-striped text-center">
					<thead>
						<tr>
							<th>가입신청자</th>
							<th>자기소개</th>
							<th>수락/거절</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>김개동</td>
							<td>개동이다 수락해라</td>
							<td>
								<button class="btn btn-sm btn-outline-primary mr-2">수락</button>
								<button class="btn btn-sm btn-outline-secondary">거절</button>
							</td>
						</tr>
						<tr>
							<td>홍길똥</td>
							<td>길똥이에요 수락점여</td>
							<td>
								<button class="btn btn-sm btn-outline-primary mr-2">수락</button>  
								<button class="btn btn-sm btn-outline-secondary">거절</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div><br>

			<div class="col-4 float-left mt-3" style="margin-left: 15%">
				<table class="table table-striped text-center">
					<thead>
						<tr>
							<th colspan="2">회원 명단</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>이빵아</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>주데브</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>노나용</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>경서방</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>진미채</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>사람1</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
						<tr>
							<td>사람2</td>
							<td>
								<button class="btn btn-sm btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">추방</button>  
								<button class="btn btn-sm btn-outline-info" data-toggle="modal" data-target="#exampleModal2">총무위임</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div><br><br>

			<div class="col-5 float-right mt-3" style="margin-right: 8%">
				<h5 class="mb-3">모임 정보 수정</h5><br>

				<!-- <label for="gname1">모임 이름</label> -->
				<input type="text" class="form-control w-75 " aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gname1" name="gname" placeholder="모임이름"><br>
				<!-- <label for="gtag1">모임 설명, 해시태그</label> -->
				<input type="text" class="form-control w-75 " aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gtag1" name="gtag" placeholder="모임설명,해시태그"><br><br>

				<form enctype="multipart/form-data">
					<div class="form-group p-2 w-75" style="position: relative;">
						<input type="file" class="custom-file-input" id="boardUpload"  multiple="true" onchange="loadFile(event);">
						<label class="custom-file-label text-center pr-5" for="inputGroupFile04">이미지 업로드 &emsp;</label>
						<img id="addImg"  src="" class="w-100 mx-auto mt-3">
					</div>
				</form>
			</div>
			<div style="clear:both;"></div><br>

			<button class="btn btn-lg btn-primary mr-4" data-toggle="modal" data-target="#exampleModal3">&ensp;초대용 링크 생성&ensp;</button>
			<button class="btn btn-lg btn-secondary" data-toggle="modal" data-target="#exampleModal4">&ensp;저장하기&ensp;</button>

		</center>


	</div><br>
	<!----------------- footer------------------->		
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

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
					<button type="button" class="btn btn-danger">추방하기</button>
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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
					<button type="button" class="btn btn-info">위임하기</button>
				</div>
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
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){

				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");

				$("#boardUpload").val('');
				$("#addImg").hide();

				/*$('#boardUploadModal').modal('hide');*/

			} else{
				$("#addImg").show();
			}

		};
	</script>
</body>
</html>