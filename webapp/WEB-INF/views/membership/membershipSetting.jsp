<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>회비설정하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css"> <!-- stylesheet 외부의 css 가져오겟다 --> 
</head>
<body style="overflow-x:hidden; overflow-y:auto;">


<!-----------header------------------>
	
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
 

<!----------------- container------------------->
<div class="container">
  <div class="container-fluid text-center" style="border: none">
   <h4 class="card-title mt-3" style="table-info">회비설정하기</h4>
   <img src="${pageContext.request.contextPath }/assets/images/feeSetting.jpg" class="mb-5">
 </div>
 <table style="margin-left: 8%">
  <tr>
    <td>
      <div class="card text-center ml-5" style="border: none">
       <img src="${pageContext.request.contextPath }/assets/images/tuto01.png" class="ml-2">
       <div class="card ml-5" style="width: 9rem;">
         <div class="card-header text-white bg-info mb-3 text-left">
          <div class="float-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="checkall">
            <label class="custom-control-label" for="checkall">&ensp;&ensp;&ensp;이름</label>
          </div>
          &ensp;
        </div>
        <ul class="list-group list-group-flush">
         <li class="list-group-item mt-0 pt-0">
         <form action="${pageContext.request.contextPath }/membershipfee/${authUser.groupNo}/setting" name="form" >
        <c:forEach items="${selectUserList }" var="checkList" varStatus="status">
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="${status.count}" name="userName" value="${checkList.userNo}">
            <label class="custom-control-label" for="${status.count}">&ensp;${checkList.userName}</label>
          </div>
        </c:forEach>
     
        </ul>
      </div>
    </div>
  </td>
  <td style="width: 45rem">
   <center>
   <!-- 납부금액 정하기  -->
     <div class="text-center mr-5">
       <img src="${pageContext.request.contextPath }/assets/images/tuto02.png">
     </div>
     <div class="form-inline mb-3" style="margin-left: 120px" >
     <!--  <div class="form-group mx-3 mb-2" align="center"> -->
      <li>
       <label for="inputPassword2" class="font-weight-blod">납부금액 </label>
      </li>
      <li>
       <input type="text" name="memberFeeAmount" value="" class="form-control w-75 text-right" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
        id="inputPassword2" placeholder="0" numberOnly><br>
     </li>
     <!-- </div> -->
     <div class="plus">
     <input type="button" class="btn btn-outline-info  mr-3" onclick="change(10000);"  value="+만원">
     <input type="button" class="btn btn-outline-info " onclick="change(1000);" value="+천원">
     </div> 
    </div>
    <!-- 입금계좌  -->
   <li>
     <label class="my-1 mr-2" for="inlineFormCustomSelectPref">입금계좌</label>
   </li>
   <li>
     <div class="form-block w-75">
      <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="groupBank" style="width: 110px"> 
       <option selected>은행</option>
       <option value="KB국민">KB국민</option>
       <option value="신한">신한</option>
       <option value="우리">우리</option>
       <option value="KEB하나">KEB하나</option>
       <option value="케이뱅크">케이뱅크</option>
       <option value="카카오뱅크">카카오뱅크</option>
       <option value="NH농협">NH농협</option>
       <option value="수협">수협</option>
       <option value="대구">대구</option>
       <option value="BNK부산">BNK부산</option>
       <option value="BNK경남">BNK경남</option>
       <option value="광주">광주</option>
       <option value="전북">전북</option>
       <option value="제주">제주</option>
     </select>
   </div>  
   </li>
   <li>
     <img src="${pageContext.request.contextPath }/assets/images/tuto03.png" class="mb-3">
   </li>
  <!-- 계좌번호  와 예금주명-->
   <div class="col-auto my-2">
    <label class="sr-only" for="">계좌번호</label>
    <input type="text" name="groupAccount" id=inputBox class="form-control w-50 text-center" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="계좌번호">
  </div>
  <div class="col-auto my-2">
    <label class="sr-only" for="">예금주명</label>
    <input type="text" name="groupAccountHolder" class="form-control w-50 text-center" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="예금주명">
  </div>
  <div>
  
   <li>
     <label class="my-1 mr-2" for="inlineFormCustomSelectPref">납부일자</label>
   </li>
   <li>
    <!-- <form class="form-block w-100" > -->
     <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="memberFeeDate">
      <option selected>일</option>
      <option value="1">1일</option>
      <option value="2">2일</option>
      <option value="3">3일</option>
      <option value="4">4일</option>
      <option value="5">5일</option>
      <option value="6">6일</option>
      <option value="7">7일</option>
      <option value="8">8일</option>
      <option value="9">9일</option>
      <option value="10">10일</option>
      <option value="11">11일</option>
      <option value="12">12일</option>
      <option value="13">13일</option>
      <option value="14">14일</option>
      <option value="15">15일</option>
      <option value="16">16일</option>
      <option value="17">17일</option>
      <option value="18">18일</option>
      <option value="19">19일</option>
      <option value="20">20일</option>
      <option value="21">21일</option>
      <option value="22">22일</option>
      <option value="23">23일</option>
      <option value="24">24일</option>
      <option value="25">25일</option>
      <option value="26">26일</option>
      <option value="27">27일</option>
      <option value="28">28일</option>
    </select>
  </li>
  <li>
    <img src="${pageContext.request.contextPath }/assets/images/tuto04.png" class="mb-3">
  </li>
</div>
<div> 
 <li>
   <label class="my-1 mr-2" for="inlineFormCustomSelectPref">매</label>
 </li>
 <li>
  <!-- <form class="form-block w-100" > -->
   <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="memberFeeinterval">
    <option selected>월</option>
    <option value="1">1개월</option>
    <option value="2">2개월</option>
    <option value="3">3개월</option>
    <option value="4">4개월</option>
    <option value="5">5개월</option>
    <option value="6">6개월</option>
    <option value="7">7개월</option>
    <option value="8">8개월</option>
    <option value="9">9개월</option>
    <option value="10">10개월</option>
    <option value="11">11개월</option>
    <option value="12">12개월</option>
  </select>
  <li>
    <label class="my-1 mr-2" for="inlineFormCustomSelectPref">마다</label>
  </li>
  <li>
    <img src="${pageContext.request.contextPath }/assets/images/tuto05.png" class="">
  </li>
</div>
<div>
  <input type="submit" class="btn btn-secondary btn-lg mt-5" value="&ensp;&ensp;설정하기&ensp;&ensp;" >
</div>
</form>
</center>
</td>
</tr>
</table>
</div>
<div>
 <br><br>

</div>


</div>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script> 
<script type="text/javascript">

/* 체크박스 전체 클릭  */
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 userName인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=userName]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 userName인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=userName]").prop("checked",false);
        }
    })
})

</script>
<script type="text/javascript">
/* 세자리마다 콤마, 숫자입력만 가능 */

//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
 
$("input:text[numberOnly]").on("keyup", function() {
	
    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
});


<!-- 버튼 클릭시 값 증가  --> //멘붕.. 동시에 안..

 function change(num){
	 var x = document.form;
	 var y = Number(x.memberFeeAmount.value) + num;
	 if(y < 1) y = 1;
	   x.memberFeeAmount.value = y;
 }
 
 
 /*  특수문자 - 과 숫자만 입력가능 
 function nCheck(){
     var numCheck = document.getElementById("numCheck");
     if(/[^0123456789-]/g.test(numCheck.value)){
    	 $("#checkCheck").html("특수문자 - 과 숫자만 입력가능합니다");
         $("#checkCheck").css("color", "red");
     }else{
    	 $("#checkCheck").html("올바릅니다.");
     }
 }
 
 $('#inputBox').keypress(function (event) { 
 if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
	 event.preventDefault(); 
	 } 
 }); */


 
	
	 
		

</script>




</body>
</html>