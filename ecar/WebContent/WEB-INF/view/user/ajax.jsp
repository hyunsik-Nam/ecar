<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ecar</title>
</head>
<body>
	<div style="width: 75%">
		<canvas id="canvas"></canvas>
	</div>
	<div id="map" style="width: 750px; height: 350px;"></div>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a17f98afa9ca291cceb19b84cb97d30f"></script>
	<script>

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for(let i=0; i < positions.length; i++){
    var data = positions[i];
    displayMarker(data);
}

// 지도에 마커를 표시하는 함수입니다    
function displayMarker(data) { 
    var marker = new kakao.maps.Marker({
        map: map,
        position: data.latlng
    });
    var overlay = new kakao.maps.CustomOverlay({
        yAnchor: 3,
        position: marker.getPosition()
    });
    
    var content = document.createElement('div');
    content.innerHTML =  data.title;
    content.style.cssText = 'background: white; border: 1px solid black';
    
    var closeBtn = document.createElement('button');
    closeBtn.innerHTML = '닫기';
    closeBtn.onclick = function () {
        overlay.setMap(null);
    };
    content.appendChild(closeBtn);
    overlay.setContent(content);

    kakao.maps.event.addListener(marker, 'click', function() {
        overlay.setMap(map);
    });
}
</script>
</body>
</html>