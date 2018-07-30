<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-07-03
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
<title>모두의 가계부</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
<!-- stylesheet 외부의 css 가져오겟다 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/Modu_sh.css">
<!-- stylesheet 외부의 css 가져오겟다 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
 
</head>
<body style="overflow-x: hidden; overflow-y: auto;">

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<div class="container">

		<br>
		<br>
		<div id="carouselExampleControls" class="carousel slide w-50 mx-auto"
			data-ride="carousel">
			<div class="carousel-inner hotPlace">

				<div class="carousel-item active">
					<img class="d-block w-100"
						src="${pageContext.request.contextPath }/assets/images/fr1.jpg?auto=none"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="${pageContext.request.contextPath }/assets/images/fr2.jpg?auto=none"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="${pageContext.request.contextPath }/assets/images/fr3.jpg?auto=none"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<br>
		<br>
		<div class="news form-control">
			<table width="100%">
				<tr>
					<th>새소식</th>
				</tr>
				<c:if test="${!empty newsList }">
					<c:forEach var="newsList" items="${newsList}">
						<tr>
							<td><a href="/reportbytag/1/${newsList.tagNo}"><${gvo.groupName}>
									의 ${newsList.tagName} 보고서가 작성되었습니다.</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div>
			<div style="float: left; text-align: center">
				<span style="font-size: 30px">지역 추천 맛집 리스트</span>
				<table style="text-align: center">
					<tr>
						<th width="150px">상호</th>
						<th width="400px">주소</th>
						<th width="150px">전화번호</th>
						<th width="80px"></th>
					</tr>
					<tr>
						<td>가보정 1관</td>
						<td id="address">경기도 수원시 팔달구 인계동 958 - 1</td>
						<td>123-1234-1234</td>
						<td>
							<button id="submit">위치</button>
						</td>
					</tr>
					<tr>
						<td>본수원 갈비</td>
						<td id="address2">경기도 수원시 팔달구 우만동 51 - 20</td>
						<td>123-1234-1234</td>
						<td>
							<button id="submit2">위치</button>
						</td>
					</tr>
					<tr>
						<td>송탄 부대찌개</td>
						<td>경기도 수원시 영통구 매탄동 11 - 20</td>
						<td>123-1234-1234</td>
						<td>
							<button>위치</button>
						</td>
					</tr>
					<tr>
						<td>두매산골</td>
						<td>경기도 수원시 팔달구 우만동 958 - 1</td>
						<td>123-1234-1234</td>
						<td>
							<button>위치</button>
						</td>
					</tr>
					<tr>
						<td>한신포차</td>
						<td>경기도 수원시 팔달구 인계동 1 - 20</td>
						<td>123-1234-1234</td>
						<td>
							<button>위치</button>
						</td>
					</tr>
					<tr>
						<td>오메가 3디팟</td>
						<td>경기도 수원시 영통구 매탄동 11 - 20</td>
						<td>123-1234-1234</td>
						<td>
							<button>위치</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="map"
				style="width: 30%; height: 300px; margin: auto auto 50px auto; float: right;"></div>
		</div>
		<div style="clear: both;"></div>
	</div>


	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=slvC1SL1B78rI5IoCUhs&submodules=geocoder"></script>
	<script type="text/javascript">
		$(".carousel").carousel({
			interval : 10000
		});
		$(document)
				.ready(
						function() {
							var map = new naver.maps.Map('map');
							var myaddress = $("#address").text();// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
							naver.maps.Service
									.geocode(
											{
												address : myaddress
											},
											function(status, response) {
												if (status !== naver.maps.Service.Status.OK) {
													// return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
												}
												var result = response.result;
												// 검색 결과 갯수: result.total
												// 첫번째 결과 결과 주소: result.items[0].address
												// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
												var myaddr = new naver.maps.Point(
														result.items[0].point.x,
														result.items[0].point.y);
												map.setCenter(myaddr); // 검색된 좌표로 지도 이동
												// 마커 표시
												var marker = new naver.maps.Marker(
														{
															position : myaddr,
															map : map
														});
												// 마커 클릭 이벤트 처리
												naver.maps.Event
														.addListener(
																marker,
																"click",
																function(e) {
																	if (infowindow
																			.getMap()) {
																		infowindow
																				.close();
																	} else {
																		infowindow
																				.open(
																						map,
																						marker);
																	}
																});
												// 마크 클릭시 인포윈도우 오픈
												var infowindow = new naver.maps.InfoWindow(
														{
															content : '<span>[여기가 현재위치]</span><img src="../../../assets/images/club03.png" alt="??">'
														});
											});
						});
		$("#submit2")
				.on(
						"click",
						function() {
							var map = new naver.maps.Map('map');
							var myaddress = $("#address2").text();// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
							naver.maps.Service
									.geocode(
											{
												address : myaddress
											},
											function(status, response) {
												if (status !== naver.maps.Service.Status.OK) {
													// return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
												}
												var result = response.result;
												// 검색 결과 갯수: result.total
												// 첫번째 결과 결과 주소: result.items[0].address
												// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
												var myaddr = new naver.maps.Point(
														result.items[0].point.x,
														result.items[0].point.y);
												map.setCenter(myaddr); // 검색된 좌표로 지도 이동
												// 마커 표시
												var marker = new naver.maps.Marker(
														{
															position : myaddr,
															map : map
														});
												// 마커 클릭 이벤트 처리
												naver.maps.Event
														.addListener(
																marker,
																"click",
																function(e) {
																	if (infowindow
																			.getMap()) {
																		infowindow
																				.close();
																	} else {
																		infowindow
																				.open(
																						map,
																						marker);
																	}
																});
												// 마크 클릭시 인포윈도우 오픈
												var infowindow = new naver.maps.InfoWindow(
														{
															content : '<span>[여기가 현재위치]</span><img src="../../../assets/images/club03.png" alt="??">'
														});
											});
						});
	</script>
</body>
</html>