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
		<div class="text-center mt-5 searchresult">		      
		<h3>‘${param.gSearch}’ 으(로) 검색한 결과입니다.</h3>
	</div>
	<c:if test="${gName ne null }">
	<div class="text-center mt-5 search" style="font-weight:400px;color: red; ">		
	<h5>${gName.groupName} 신청하였습니다. 승인이되면, 카테고리에서 볼 수 있습니다. </h5>
	</div>
	</c:if>
	<div class="text-left mt-5 searchlist">	

		<ul class=" mt-5 p-0">
		<c:forEach items="${searchList }" var="Sea">

			<li class="dom">
				<div class="card searchClub text-white bg-primary mb-3 text-center w-30 mx-4 p-2"  style="background-color: white; ">
				  <div class="card-header"><h4>${Sea.groupName}</h4></div>
				  <div class="card-body">
				    <h6 class="card-title text-center" style="width: 400px">${Sea.groupExplain}</h6>
				  </div>
				  
				  <a class="card-text text-center">
						<button type="button" id="${Sea.groupNo}" name="join" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModalCenter2">모임 신청하기</button>
				    </a>
				    
				  </div>
			</li>
			</c:forEach>
						
		</ul>
	</div>
</div>
  
  

<!----------------- footer------------------->		
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div>
	        <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form id="group-join-form" name="gJoinForm" method="post"action="${pageContext.request.contextPath }/groupmanage/${gvo.groupNo}}/joinGroup">
			<div class="form-group text-center mx-5 introduce">
			    <label for="introduce">가입 신청 메세지</label>
			    <textarea class="form-control" id="introduce" rows="3" name="joinMessage" placeholder="글을 입력해주세요."></textarea>
			    <input type="hidden" id="giveNo" name="groupNo" value="">
			    <input type="hidden" name="gSearch" value="${param.gSearch}">
			  </div>
	      <div class="text-center mb-3">
	        <input class="btn btn-success" type="submit" value="신청하기">
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>

<script type="text/javascript">
 $('.dom').on("click","button",function(){
	 
	console.log("연결");
	var groupNo = $(this).attr("id");
	console.log(groupNo);
	 $("#giveNo").val(groupNo); 
	
});
 
/* var asdf = function(){
	var tmp = $(this).val();
	console.log(tmp);
	$("#giveNo").val(tmp);
}
 */

</script>
</body>
</html>