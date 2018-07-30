<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>회비 관리</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css">
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<!-----------header------------------>
  <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<div class="container">
 
		<center>
			<div class="feemanage col-8 mt-5">
				<table class="table table-sm table-light border text-center">
					<tr>
						<td class="bg-info" style="color:white" >모임 계좌</td>
						<td class="bg-light" style="color:gray">농협  1234-56-78901</td>
						<td class="bg-info" style="color:white">계좌 주인</td>
						<td class="bg-light" style="color:gray">진미채</td>
					</tr>
				</table>
			</div>

			<div class="pt-3">
				<button class="interval float-left btn btn" type="text" value="" style="color: black" disabled="disabled">납부일: X개월 마다 10일</button>
				<button type="button" class="btn btn-secondary float-right mr-3" onclick="location.href='/Modu/membershipfee/${gvo.groupNo}/membershipsetting'">회비 설정하기</button>
				<div style="clear:both;"></div>
			</div>


			<div align="center" style="margin-top: 50px">
				<input type="text" value="" readonly="readonly" style="text-align: center; border: none; margin-bottom: 10px;"><br>
				<input type="button" value="<" id="yearPrev">
				<input type="text" id="yearOutput" readonly="readonly" value="2018년"  class="form_decade" data-date="" data-date-format="yyyy년" data-link-field="dtp_input3" data-link-format="yyyy" style="text-align: center;">
				<input type="button" value=">" id="yearNext">
			</div>
			<br>
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-outline-info">상반기</button>
				<button type="button" class="btn btn-outline-info">하반기</button>
			</div>

			<div class="feemanage table-bordered" style="border:none; ">
				<table class="table table-striped mt-5 text-center">
					<thead>
						<tr>
							<th scope="col" >이름</th>
							<th scope="col">회비</th>
							<th scope="col" colspan="2">1월</th>
							<th scope="col" colspan="2">2월</th>
							<th scope="col" colspan="2">3월</th>
							<th scope="col" colspan="2">4월</th>
							<th scope="col" colspan="2">5월</th>
							<th scope="col" colspan="2">6월</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${selectUserList }" var="sel">
					

						<tr>
							<td scope="row">${sel.userName}</td>
							<td>10,000</td>
							<td style="color:blue">완료</td>
							<td><img src="${pageContext.request.contextPath }/assets/images/good01.png"></td>
							<td style="color:blue">완료</td>
							<td><img src="${pageContext.request.contextPath }/assets/images/good01.png"></td>
							<td style="color:blue">완료</td>
							<td><img src="${pageContext.request.contextPath }/assets/images/good01.png"></td>
							<td style="color: red">미납</td>
							<td><button class="btn btn-sm btn-outline-secondary">확인</button></td>
							<td style="color: red">미납</td>
							<td><button class="btn btn-sm btn-outline-secondary">확인</button></td>
							<td style="color: red">미납</td>
							<td><button class="btn btn-sm btn-outline-secondary">확인</button></td>  
						</tr> 
						
					</c:forEach>

						

					</tbody>
				</table>
				<!--  회원관리 - 회원이 클릭했을 시, 본인 내역과 함께 출력
				<div style="background: url(images/coment02.png) no-repeat;  background-position: center; "  >
					<br><br><br><br>
					6월 회비가 입금되지 않았습니다.<br>
					6월 회비를 입금해주세요.
					<br><br><br><br>
				</div> -->

			<!-- 
			<table class="table table-striped mt-5 text-center">
			  <thead>
			    <tr>
			      <th scope="col">이름</th>
			      <th scope="col">회비</th>
			      <th scope="col" colspan="2">7월</th>
			      <th scope="col" colspan="2">8월</th>
			      <th scope="col" colspan="2">9월</th>
			      <th scope="col" colspan="2">10월</th>
			      <th scope="col" colspan="2">11월</th>
			      <th scope="col" colspan="2">12월</th>
			    </tr>
			  </thead>
			  <tbody>

			    <tr>
			      <td scope="row">이빵아</td>
			      <td>10,000</td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>	
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>  
			    </tr> 

			    <tr>
			      <td scope="row">주데브</td>
			      <td>10,000</td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>	
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>  
			    </tr> 
			    <tr>
			      <td scope="row">노나용</td>
			      <td>10,000</td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>	
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>  
			      
			    </tr> 
			    <tr>
			      <td scope="row">경서방</td>
			      <td>10,000</td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>	
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>  
			    </tr> 
			    <tr>
			      <td scope="row">진미채</td>
			      <td>10,000</td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>
			      <td>미납</td>	
			      <td><button class="btn btn-sm btn-outline-primary">확인</button></td>  
			    </tr> 

			  </tbody>
			</table> -->


		</div><br>
		
   </center>

</div>

<!----------------- footer------------------->		
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script type="text/javascript">
	$(document).on("ready",function(){
		$('.form_decade').datetimepicker({
			language:  'ko',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 4,
			minView: 4,
			forceParse: 0
		});
	
		$('#yearPrev').on("click",function(){
			var year = $("#yearOutput").val();
			year = Number(year.substr(0,4));
			year -= 1;
			year += '년';
			$("#yearOutput").val(year);
		});
		$('#yearNext').on("click",function(){
			var year = $("#yearOutput").val();
			year = Number(year.substr(0,4));
			year += 1;
			year += '년';
			$("#yearOutput").val(year);
		});
	
		
	});
</script>
</body>
</html>