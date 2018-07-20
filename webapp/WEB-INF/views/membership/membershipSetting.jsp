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
            <label class="custom-control-label" for="checkall">&nbsp;</label>
          </div>
          &ensp;이름
        </div>
        <ul class="list-group list-group-flush">
         <li class="list-group-item mt-0 pt-0">
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck1" name="chk">
            <label class="custom-control-label" for="customCheck1">&ensp;이빵아</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck2" name="chk">
            <label class="custom-control-label" for="customCheck2">&ensp;주데브</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck3" name="chk">
            <label class="custom-control-label" for="customCheck3">&ensp;노나용</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck4" name="chk">
            <label class="custom-control-label" for="customCheck4">&ensp;경서방</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck5" name="chk">
            <label class="custom-control-label" for="customCheck5">&ensp;진미채</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck6" name="chk">
            <label class="custom-control-label" for="customCheck6">&ensp;울막내</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck7" name="chk">
            <label class="custom-control-label" for="customCheck7">&ensp;자손데브</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck8" name="chk">
            <label class="custom-control-label" for="customCheck8">&ensp;사람1</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck9" name="chk">
            <label class="custom-control-label" for="customCheck9">&ensp;사람2</label>
          </div>
          <div class="text-left custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="customCheck10" name="chk">
            <label class="custom-control-label" for="customCheck10">&ensp;사람3</label>
          </div>
        </ul>
      </div>
    </div>
  </td>
  <td style="width: 45rem">

   <center>
     <div class="text-center mr-5">
       <img src="${pageContext.request.contextPath }/assets/images/tuto02.png">
     </div>
     <form class="form-inline mb-3" style="margin-left: 120px">
      <div class="form-group mx-3 mb-2" align="center">
       <label for="inputPassword2" class="font-weight-blod">납부금액 </label>
       <input type="text" class="form-control w-75 text-right" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="inputPassword2" placeholder="0"><br>
     </div>
     <button type="button" class="btn btn-outline-info  mr-3">+만원</button>
     <button type="button" class="btn btn-outline-info ">+천원</button>

   </form>
   <li>
     <label class="my-1 mr-2" for="inlineFormCustomSelectPref">입금계좌</label>
   </li>
   <li>
     <form class="form-block w-75">
      <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
       <option selected>은행</option>
       <option value="1">KB국민</option>
       <option value="2">신한</option>
       <option value="3">우리</option>
       <option value="4">KEB하나</option>
       <option value="5">케이뱅크</option>
       <option value="6">카카오뱅크</option>
       <option value="7">NH농협</option>
       <option value="8">수협</option>
       <option value="9">대구</option>
       <option value="10">BNK부산</option>
       <option value="11">BNK경남</option>
       <option value="12">광주</option>
       <option value="13">전북</option>
       <option value="14">제주</option>
     </select>
   </li>
   <li>
     <img src="${pageContext.request.contextPath }/assets/images/tuto03.png" class="mb-3">
   </li>
   <div class="col-auto my-2">
    <label class="sr-only" for="">계좌번호</label>
    <input type="text" class="form-control w-50 text-center" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="계좌번호">
  </div>
  <div class="col-auto my-2">
    <label class="sr-only" for="">예금주명</label>
    <input type="text" class="form-control w-50 text-center" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="예금주명">
  </div>
  <div>
   <li>
     <label class="my-1 mr-2" for="inlineFormCustomSelectPref">납부일자</label>
   </li>
   <li>
    <!-- <form class="form-block w-100" > -->
     <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
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
   <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected>월</option>
    <option value="1">1월</option>
    <option value="2">2월</option>
    <option value="3">3월</option>
    <option value="4">4월</option>
    <option value="5">5월</option>
    <option value="6">6월</option>
    <option value="7">7월</option>
    <option value="8">8월</option>
    <option value="9">9월</option>
    <option value="10">10월</option>
    <option value="11">11월</option>
    <option value="12">12월</option>
  </select>
  <li>
    <label class="my-1 mr-2" for="inlineFormCustomSelectPref">마다</label>
  </li>
  <li>
    <img src="${pageContext.request.contextPath }/assets/images/tuto05.png" class="">
  </li>
</div>
<div>
  <button type="button" class="btn btn-secondary btn-lg mt-5" onclick="location.href='${pageContext.request.contextPath }/feemanage?groupNo=${gvo.groupNo }'">&ensp;&ensp;설정하기&ensp;&ensp;</button>
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


</body>
</html>