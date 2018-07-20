<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-07-03
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">

<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<div class="container">

    <br><br>
    <div id="carouselExampleControls" class="carousel slide w-50 mx-auto" data-ride="carousel">
        <div class="carousel-inner hotPlace">

            <div class="carousel-item active">
                <img class="d-block w-100"  src="${pageContext.request.contextPath }/assets/images/fr1.jpg?auto=none" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/fr2.jpg?auto=none" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/fr3.jpg?auto=none" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="localHotplaceBackground">

        <div class="localHotplaceArea">
            <div class="localHotplaceTop6">
                <div class="card-deck">
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace1.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>가보정 1관</strong></h5>
                            <span class="localHotplaceParking">주차 가능</span>
                            <p class="card-text">경기도 수원시 팔달구 인계동 958-1</p>
                        </div>
                    </div>
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace2.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>본수원 갈비</strong></h5>
                            <span class="localHotplaceParking">주차 가능</span>
                            <p class="card-text">경기도 수원시 팔달구 우만동 51 - 20</p>
                        </div>
                    </div>
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace3.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>송탄 부대찌개</strong></h5>
                            <span class="localHotplaceParking"></span>
                            <p class="card-text">경기도 수원시 영통구 매탄동 11 - 20</p>
                        </div>
                    </div>
                </div>
                <div class="card-deck mt-5">
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace4.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>두매산골</strong></h5>
                            <span class="localHotplaceParking"></span>
                            <p class="card-text">경기도 수원시 팔달구 우만동 958 - 1</p>
                        </div>
                    </div>
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace5.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>한신포차</strong></h5>
                            <span class="localHotplaceParking">주차 가능</span>
                            <p class="card-text">경기도 수원시 팔달구 인계동 1 - 20</p>
                        </div>
                    </div>
                    <div class="card cardBackground">
                        <img src="${pageContext.request.contextPath }/assets/images/local_hotplace6.jpg" class="mx-auto w-75">
                        <div class="card-body">
                            <h5 class="card-title"><strong>오메가 3 디팟</strong></h5>
                            <span class="localHotplaceParking"></span>
                            <p class="card-text">경기도 수원시 영통구 매탄동 11 - 20</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="localHotplaceTitle">
                <span><strong>#이번모임 어디가지<br> #수원편</strong></span>
            </div>
        </div>
    </div>

    <div class="news form-control">
        <table width="100%">
            <tr>
                <td align="center">
                    새소식
                </td>
                <td>
                    <경서방 모임> 5월 보고서가 작성되었습니다.
                </td>
            </tr>
        </table>
    </div>


    <div id="map" style="width:50%;height:400px; margin:auto auto 50px auto"></div>
</div>


<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=slvC1SL1B78rI5IoCUhs&submodules=geocoder"></script>
<script type="text/javascript">
    $(".carousel").carousel({
        interval: 10000
    })
    var map = new naver.maps.Map('map');
    var myaddress = '서울특별시 서초구 서초대로74길33';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
    naver.maps.Service.geocode({address: myaddress}, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            // return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
        }
        var result = response.result;
        // 검색 결과 갯수: result.total
        // 첫번째 결과 결과 주소: result.items[0].address
        // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
        var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
        map.setCenter(myaddr); // 검색된 좌표로 지도 이동
        // 마커 표시
        var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
        });
        // 마커 클릭 이벤트 처리
        naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
        });
        // 마크 클릭시 인포윈도우 오픈
        var infowindow = new naver.maps.InfoWindow({
            content: '<h4> [여기가 현재위치]</h4><a href="file:///D:/bootstrap-4.1.1-dist/sample.html#" target="_blank"><img src="../../../assets/images/club03.png" alt="??"></a>'
        });
    });
</script>
</body>
</html>