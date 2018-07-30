<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>첫 모임생성페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<!-----------header------------------>
 
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<div class="container">
	<div width="100%">
		<div class="carousel-inner">
		    <div class="carousel-caption d-none d-md-block mb-5">		      
			    <h1 class="textalgin-center">모임이 없습니다.</h1>
			    
			    <h1 class="textalgin-center">모임을 추가하세요.</h1>
			    <br><br>
			    <button type="button" class="btn btn-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter01">모임 추가하기</button>
			    <br>
			</div>
		    <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main04.png" alt="create-group">
		</div>
	</div>
</div>
	

<!--footer--> 
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		});
		
 	
	</script>
</body>
</html>