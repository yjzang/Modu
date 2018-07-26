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

	<div class="container">
		<div id="map" style="width:50%;height:400px; margin:auto auto 50px auto"></div>
	</div>
	
	<input type="text" id="search" value=""></input>
	<button id="btn">지도에 표시</button>
	
	<table>
		<tr>
			<th>위치</th>
		</tr>
		<tbody id="content">
		
		</tbody>
	</table>
	
</body>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YX8YchtPnKuE7FGKGyW6&submodules=geocoder"></script>
<script type="text/javascript">

	$("#btn").on("click",function(){
		var text = $("#search").val()
		searchCallBack(text);
	})

    function searchCallBack(Addr){
    	$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/accountbook/1/search',
			data: {'address' : encodeURIComponent(Addr)},  //encodeURIComponent로 인코딩하여 넘깁니다.
			dataType: 'json',
			timeout: 10000,
			cache: false,
			error:function(x,e){
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			success: function (addr) {
				$("#content").empty();
				for(var i=0;i<addr.length;i++){
					var str='';
					str+="<tr id='" + addr[i] + "'>";
					str+="<th>" + addr[i] + "</th>";
					str+="</tr>";
					
					$("#content").append(str);
				}
			}
		});
	}; 
	
	$("#content").on("click","tr",function(){
		var text = $(this).attr("id");
		jusoCallBack(text);
	})
    function jusoCallBack(Addr){
    	$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/accountbook/1/trans',
			data: {'address' : encodeURIComponent(Addr)},  //encodeURIComponent로 인코딩하여 넘깁니다.
			dataType: 'json',
			timeout: 10000,
			cache: false,
			error:function(x,e){
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			success: function (getData) {
				var data = JSON.parse(getData);
				lng = data.result.items[0].point.x;
				lat = data.result.items[0].point.y;
				
				drawMap(lng,lat);
			}
		});
	}; 
	
	function drawMap(){
		var HOME_PATH = window.HOME_PATH || '.';
		
		var map = new naver.maps.Map(document.getElementById('map'), {
		    zoom: 11,
		    center: new naver.maps.LatLng(lat, lng)
		});

		var latlngs = [
		    new naver.maps.LatLng(lat, lng)
		];
		
		var markerList = [];
		
		for (var i=0, ii=latlngs.length; i<ii; i++) {
		    var icon = {
		            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
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
		        url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
		        size: new naver.maps.Size(24, 37),
		        anchor: new naver.maps.Point(12, 37),
		        origin: new naver.maps.Point(seq * 29, 50)
		    });
		}
		
		function onMouseOut(e) {
		    var marker = e.overlay,
		        seq = marker.get('seq');
		
		    marker.setIcon({
		        url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
		        size: new naver.maps.Size(24, 37),
		        anchor: new naver.maps.Point(12, 37),
		        origin: new naver.maps.Point(seq * 29, 0)
		    });
		} 
	}

</script>
</html>