<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>그룹 첫 페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css">
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<!-----------header------------------>
  <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
  
  <div class="container">
		<div class="carousel-item active">
		<center>
               <img style="height: 80%; width: 80%;"  src="${pageContext.request.contextPath }/assets/images/groupImg04.png" alt="groupImg05">
        </center>
		</div>
	</div>
  
  
 
<!----------------- footer------------------->		
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
</body>
</html>