<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-07-23
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>보고서 작성중 에러</title>
</head>
<body>
<div style="text-align: center; margin-top: 200px;">
    <span style="font-size: 50px; color:red;">해당 데이터가 없거나 정보를 불러올 수 없습니다</span>
</div>
<div style="text-align: center; margin-top: 200px;">
    <span><a href="${pageContext.request.contextPath }/groupmain/${groupNo}">메인으로 가기</a></span>
</div>
</body>
</html>
 