<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>회비관리 시작페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<!-----------header------------------>

  <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!----------------- container------------------->
	<div class="container">
		<div class="carousel-item active">
			<div class="carousel-caption d-none d-md-block mb-5  text-left">	
			<div class="mb-0">
				<h1 class="mr-5">아직,&nbsp;&ensp;&ensp;&ensp;</h1>
                <h1 class="ml-4">회비설정을 </h1>
                <h1 class="mb-5">안하셨나요?</h1>
            </div>
				<a class="btn btn-primary btn-lg ml-5 mt-0" style="text-shadow:none; " href="${pageContext.request.contextPath }/membershipfee/${gvo.groupNo}/membershipsetting">회비설정하기</a>
				<br>
			</div>
               <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/membership3.jpg" alt="membershipsetting">
		</div>
	</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	
	
</body>
</html>