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
                
                <%-- <div class="card-deck">
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
                    </div> --%> 
                    
                </div>
            </div>
            <div class="localHotplaceTitle" value="${area}">
                <span><strong>#이번모임 어디가지<br> #${area}편</strong></span>
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


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YX8YchtPnKuE7FGKGyW6&submodules=geocoder"></script>
<script type="text/javascript">
    $(".carousel").carousel({
        interval: 10000
    })
    
	var text = $(".localHotplaceTitle").val()
	searchCallBack(text+"맛집");

	//상호명을 통한 주소 검색
    function searchCallBack(Addr){
    	$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/groupmain/${gvo.groupNo}/search',
			data: {'address' : encodeURIComponent(Addr)},  //encodeURIComponent로 인코딩하여 넘깁니다.
			dataType: 'json',
			timeout: 10000,
			cache: false,
			error:function(x,e){
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			success: function (addr) {
				var str = "";
				var j = 0;
				for(var i=0;i<addr.length;i++){															
					if(i%3==0){
						j=i;
						str+='<div class="card-deck mx-2">'
					}

					str+='<div class="card cardBackground">'
					str+='<img src="${pageContext.request.contextPath }/assets/images/local_hotplace2.jpg" class="mx-2 w-75">'
					str+='<div class="card-body">'
					str+='<h5 class="card-title"><strong>' + addr[i].split("/")[1] + '</strong></h5>'
					str+='<p class="card-text">' + addr[i].split("/")[0] + '</p>'
					str+='</div>'
					str+='</div>'
					
					if(i==j+2){
						str+='</div>'
					}	
				}
				
				$(".localHotplaceTop6").append(str);
				
				var latlngs = [ ];
				
				for(var i=0;i<addr.length;i++){
					latlngs.push(jusoCallBack(addr[i].split("/")[1]))
				}
				
				console.log(latlngs);
				
				drawMap(latlngs);
			}
		});
	}; 

	//주소를 통해 위/경도 검색
    function jusoCallBack(Addr){
		var lng;
		var lat;
    	$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/groupmain/${gvo.groupNo}/trans',
			data: {'address' : encodeURIComponent(Addr)},  //encodeURIComponent로 인코딩하여 넘깁니다.
			dataType: 'json',
			timeout: 10000,
			cache: false,
			error:function(x,e){
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			async: false,
			success: function (getData) {
				var data = JSON.parse(getData);
				lng = data.result.items[0].point.x;
				lat = data.result.items[0].point.y;				
				
			}
		});
    	return new naver.maps.LatLng(lat, lng)
	}; 
	
	//위경도를 통해 지도 그리기
	function drawMap(latlngs){
		//var HOME_PATH = window.HOME_PATH || '.';
		var HOME_PATH = "/Modu";
		
		var map = new naver.maps.Map(document.getElementById('map'), {
		    zoom: 11,
		    center: jusoCallBack($(".localHotplaceTitle").val())
		});

		/* var latlngs = [
		    new naver.maps.LatLng(lat, lng)
		]; */
		
		var markerList = [];
		
		for (var i=0, ii=latlngs.length; i<ii; i++) {
		    var icon = {
		            url: HOME_PATH +'/assets/images/down.png',
		            size: new naver.maps.Size(24, 37),
		            anchor: new naver.maps.Point(12, 37),
		            origin: new naver.maps.Point(i * 29, 0)
		        },
		        marker = new naver.maps.Marker({
		            position: latlngs[i],
		            map: map,
		            icon: icon
		        });
		
		    marker.set('seq', i);
		
		    markerList.push(marker);
		
		    marker.addListener('mouseover', onMouseOver);
		    marker.addListener('mouseout', onMouseOut);
		
		    icon = null;
		    marker = null;
		}
		
		function onMouseOver(e) {
		    var marker = e.overlay,
		        seq = marker.get('seq');
		
		    marker.setIcon({
		        url: HOME_PATH +'/assets/images/good01.png',
		        size: new naver.maps.Size(24, 37),
		        anchor: new naver.maps.Point(12, 37),
		        origin: new naver.maps.Point(seq * 29, 50)
		    });
		}
		
		function onMouseOut(e) {
		    var marker = e.overlay,
		        seq = marker.get('seq');
		
		    marker.setIcon({
		        url: HOME_PATH +'/assets/images/down.png',
		        size: new naver.maps.Size(24, 37),
		        anchor: new naver.maps.Point(12, 37),
		        origin: new naver.maps.Point(seq * 29, 0)
		    });
		} 
	}
</script>
</body>
</html>