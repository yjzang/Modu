<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
<title>Insert title here</title>
</head>
<body>

	
	<select class='category form-control custom-select text-center' style='margin-top: 7px' id='category'>
		<option value="1" selected>미분류</option>
		<option value="2">식비</option>
		<option value="3">주류</option>
		<option value="4">기타</option>
	</select>
	<button id="btn">!!!!!</button>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YX8YchtPnKuE7FGKGyW6&submodules=geocoder"></script>
<script type="text/javascript">

$("#btn").on("click",function(){
    $(".category").val("2").attr("selected","selected")
  })
  

</script>
</html>