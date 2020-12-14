<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>藝文路線規劃</title>
<!-- leaflet.js -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
	integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
	integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
	crossorigin=""></script>
<!-- leaflet.js draw -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.js"></script>
<!-- lealet.js MarkerCluster -->
<link
	href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css"></link>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />
<script
	src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>
<!-- leaflet.js routing machine -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.css" />
<script
	src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/0f0e9f356e.js"
	crossorigin="anonymous"></script>
<style>
body {
	font-size: 26px;
	color: black;
}
html, body {
	height: 100%;
	padding: 0;
	margin: 0;
}

/* 高度要設定固定高否則無法顯示地圖 */
#artMap {
	height: 650px;
	width: 100%;
}

.askLocation {
	width: 100%;
	margin: 0 auto;
}

.sendRoute {
	width: 800px;
	margin: 0 auto;
}

.selectCategory {
	width: 70px;
	margin: 0 auto;
}

.askLocationInner, .sendRouteInner {
	/* 下列有水平置中效果 */
	text-align: center;
}

.marker-pin {
	text-align: center;
}

.marker-pin h6 {
	color: #0E5255;
}

.askLocation {
	display: inline;
	float: right;
	width: 35%;
	margin-top: 110px;
}

.mapArea {
	display: inline;
	float: left;
	width: 65%;
}

#editPinButton {
	margin-bottom: 30px;
}

.myJourney {
	display: none;
}
</style>

</head>
<body>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">我的藝文足跡</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/35/myJourney' />">我的藝文足跡</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- 詢問使用者位置 -->
	<br>
	<br>
	<div class="askLocation">
		<div class="askLocationInner">
			<!-- 			<h1>今晚，我想來點(X)</h1> -->
			<h1>輸入任意地點尋找活動：</h1>
			<br>
			<div class="searchBox1">
				<input type="text" id="userLocation" value="台北車站">
			</div>
			<br>
			<h3>顯示幾公里內的活動：</h3>
			<br>
			<div class="searchBox2">
				方圓<input type="text" id="userDistance" value="9">公里<br>
			</div>
			<br>
			<h3>想查詢的藝文活動類別：</h3>
			<br>
			<div class="searchBox3">
				<select id="actCategory" class="selectCategory">
					<option>請選擇</option>
					<option>所有</option>
					<option>音樂</option>
					<option>戲劇</option>
					<option>舞蹈</option>
					<option>親子</option>
					<!-- 					<option>獨立音樂</option> -->
					<option>展覽</option>
					<option>講座</option>
					<option>電影</option>
					<option>綜藝</option>
					<option>競賽</option>
					<option>徵選</option>
					<option>其他</option>
					<option>未知分類</option>
					<!-- 					<option>演唱會</option> -->
					<option>研習課程</option>
				</select>
			</div>
			<br> <br> <br> <br>
			<div class="editPinArea">
				<input id="editPinButton" class="genric-btn primary radius"
					type="button" value="規劃我的藝文之旅">
				<div class="myJourney">
					<div>
						<label>活動名稱</label> <input id = "actName" type="text">
					</div>
<!-- 					<div> -->
<!-- 						<label>活動地點</label> <input type="text"> -->
<!-- 					</div> -->
					<div>
						<label>活動時間</label> <input id = "actTime" type="text">
					</div>
					<div>
						<label>備註事項</label>
						<textarea id = "actNotes"></textarea>
					</div>
					<input id="savePinButton" class="genric-btn primary radius"
						type="button" value="儲存">
				</div>
			</div>
		</div>
	</div>

	<!-- 地圖以及資料顯示按鈕本體 -->
	<div class="container my-5 mapArea">
		<div id="artMap"></div>
	</div>
	<div class="sendRoute" style="clear: both;">
		<div class="sendRouteInner">
			<input class="genric-btn primary radius" type=button
				onclick="" value="顯示已規劃路線">
		</div>
	</div>

	<script type="text/javascript">

    let LMap = L.map(document.getElementById('artMap'), {
        center: [23.6, 121], // 中心點
        zoom: 8, // 縮放層級
        crs: L.CRS.EPSG3857, // 座標系統
        downloadable: true,
        attributionControl: false,
    });

    // 使用OSM圖層
    L
        .tileLayer(
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(LMap);

    //設定圖釘樣式: 紅色圖釘
    let redIcon = new L.Icon(
        {
            iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
            shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
            shadowSize: [41, 41]
        });
    
    //設定圖釘樣式: 藍色活動圖釘
    let blueIcon = new L.Icon(
        {
            iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png',
//             shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
//             shadowSize: [41, 41]
        });

	let title = null;
    
    //定義好fetch會固定用到的方法
    let status = response => {
        if (response.status >= 200 && response.status < 300) {
            return Promise.resolve(response)
        } else {
            return Promise.reject(new Error(response.statusText))
        }
    }

    let json = response => {
        return response.json()
    }

//  定義後面map會用到的變數
	let userLat;
	let userLon;
	let nearActsArray;
// 	先設定markerGroup/markerRed，為了判斷是否有先前查詢遺留的圖層
	let markerGroup = null;
	let markerRed = null;
	
// 	定義查詢紐按下後做的ajax處理
	document.getElementById("actCategory").addEventListener("change", processLocation = () => {

// 		如果有先前查詢產生的圖層就移除
	    if (markerGroup !== null) {
	        LMap.removeLayer(markerGroup);
	    }

	    if (markerRed !== null) {
	    	LMap.removeLayer(markerRed);
		}
	    
		let actCategory = document.getElementById("actCategory").value;
		let userLocation = document.getElementById("userLocation").value;
		let userDistance = document.getElementById("userDistance").value;
        let url = "<c:url value='/35/routePlanning/"+userLocation+"/"+userDistance+"/"+actCategory+".ctrl' />";

        fetch(url, {
        	method: "get"
        })
        	.then(status)
        	.then(json)
        	.then(data => {
//             	data中有兩個key
//             	"userCoords" Map型態
//             	"nearActs" List型態
// 				console.log(data);

            	userLat = data.userCoords.lat;
            	userLon = data.userCoords.lon;
            	nearActsArray = data.nearActs;

//				設定地圖中心
            	LMap.setView([userLat, userLon], 15 - Math.round(userDistance/10));
// 				繪製查詢中心點圖釘
		        markerRed = L.marker([data.userCoords.lat, data.userCoords.lon], {
		            icon: redIcon
		        })
		        .bindPopup("<b>"+userLocation+"</b>"+
				"<br>詳細資訊: "+"<a href=\"https://www.google.com/search?q="+userLocation+"\" target=\"_blank\">點擊查看</a>"+
				"<br>文化部查詢相關活動: "+"<a href=\"https://www.moc.gov.tw/searchall_5.html?q="+userLocation+"\" target=\"_blank\">點擊查看</a>")
		        .addTo(LMap);
// 		        Popup直接顯示出來
// 		        markerRed.openPopup();
            	
// 				為了避免活動們的空圖釘結果導致下一次搜尋出來的圖釘被刪
				if(data.nearActs[0].no === null){
					return;
				}
				
//             	繪製活動們的圖釘
				let markerArray=[];
// 				positionArray用於檢查活動位置是否重複
// 				重複就不要繪製圖釘上去
				let positionArray=[];
        		for (let i in data.nearActs) {

					let positionObj = {
						lat: data.nearActs[i].latitude,
						lon: data.nearActs[i].longitude
					};

// 					檢查array內obj的經緯度值是否皆相同
					objCheck = (obj) => {
						return (obj.lat === data.nearActs[i].latitude) && (obj.lon === data.nearActs[i].longitude);
					}

					if (positionArray.some(objCheck)){
						continue;
					}else {
						positionArray.push(positionObj);
						
	        			let actsIcon;
//	 					如果搜尋距離小於多少，改用帶標題圖標，且動態變更圖標題名稱
						if (userDistance < 10){
							actsIcon = new L.divIcon({
		        		    	className: 'custom-div-icon',
		        		            html: "<div class='marker-pin'><h6>"+data.nearActs[i].title.substring(0, 12)+"</h6><img src='https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png'></div>",
		        		            iconSize: [60, 84],
		        		            iconAnchor: [15, 42]
		        		    });
						}else {
							actsIcon = blueIcon;
						}

// 						轉換null值的函式
						let transformNull = (str) => {
							if (str === null){
								str="無資訊";
							}

							return str;
						}
						
						let actsMarker = L.marker([data.nearActs[i].latitude, data.nearActs[i].longitude], {
	    		            icon: actsIcon
	    		        })
	        			.bindPopup("<b>"+data.nearActs[i].title
	    	        			+"</b><br>地址: "+data.nearActs[i].city+data.nearActs[i].district+data.nearActs[i].address
								+"<br>活動地點: "+transformNull(data.nearActs[i].locationName)   	        			
								+"<br>主辦單位: "+transformNull(data.nearActs[i].mainUnit)	    	        			
								+"<br>展演單位: "+transformNull(data.nearActs[i].showUnit)   	        			
								+"<br>時間: "+data.nearActs[i].time
	                			+"<br>活動詳細資訊: "+"<a href=\"https://www.google.com/search?q="+data.nearActs[i].title+"\" target=\"_blank\">點擊查看</a>");

						markerArray.push(actsMarker);
					}

            	}
//         		
				markerGroup = L.layerGroup(markerArray).addTo(LMap);
			})	
	});

// 	啟用事件綁定方法二: 定義完方法後綁定事件
// 	document.getElementById("actCategory").addEventListener("change", processLocation);

	let loc = document.getElementById("userLocation");
	let dis = document.getElementById("userDistance");
	loc.addEventListener("change", processLocation);
	dis.addEventListener("change", processLocation);




	
// 	從這之後是編輯圖釘資訊，定義後續取圖標位置的按鈕要用的變數

    //設定drawItem圖層
    let drawItem = new L.FeatureGroup();
    LMap.addLayer(drawItem);

    //draw的控制選項
    let option = {
        position: 'topleft',
        collapsed: true,
        edit: {
            featureGroup: drawItem
        }
    };

//  新增drawControl
    let drawControl = new L.Control.Draw(option);
    LMap.addControl(drawControl);

    let counter = 0;
    let siteObj = null;
//     let data = new Map();
    LMap.on('draw:created', onMapDraw);
   	function onMapDraw(e) {
        counter++;
        let layer = e.layer;
        drawItem.addLayer(layer);
//         Json
        let shape = layer.toGeoJSON();
//         轉字串
        let shape_for_db = JSON.stringify(shape);
        // 				console.log("1: "+arguments);
        // 				console.log("2: "+layer);
        // 				console.log("3: "+shape);
        console.log("要用的資料: " + shape_for_db);
        siteObj = {
                lat: shape.geometry.coordinates[0],
                lon: shape.geometry.coordinates[1]
                }
//         data.set(counter, JSON.stringify(shape));
    }

// 	LMap.on('click', onMapClick);	
// 	function onMapClick(e){
// 		L.popup()
// 		.setLatLng(e.latlng)
// 		.setContent("經緯度: " + e.latlng.toString())
// 		.openOn(LMap)
		
//         console.log("要用的資料之單純經緯度" + e.latlng.toString());
// 	}

	let myJourney = document.querySelector(".myJourney");
	let edit = document.getElementById("editPinButton");
	let save = document.getElementById("savePinButton");

	let editSiteObj = () => {
		edit.style.display="none";
		myJourney.style.display="block";
	}
	
	edit.addEventListener("click", editSiteObj);

	let saveSiteObj = () => {
		edit.style.display="";
		myJourney.style.display="none";
// 		console.log(siteObj.lat);
// 		console.log(siteObj.lon);
		let name = document.getElementById("actName").value;
		let time = document.getElementById("actTime").value;
		let notes = document.getElementById("actNotes").value;
        let url = "<c:url value='/35/myJourney' />";
		let data ={
				name: name,
				time: time,
				notes: notes,
				lat: siteObj.lat,
				lon: siteObj.lon
				}
        fetch(url, {
            method: "post",
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: JSON.stringify(data)
        })
            .then(status)
            .then(json)
            .then(data => {
				console.log(data);
            })
	}
	
	save.addEventListener("click", saveSiteObj);

	//		下方已經棄用
    // 		IIFEs(Immediately Invoked Functions Expressions)
    // 		第一個括號內是expression，JavaScript會以 expression 的方式來讀取這段函式
    // 		在這種情況下，這個 function 會被建立，但是不會被存在任何變數當中
    // 		在這個expression的最後加上括號 ()，代表執行這段expression

//     (function () {
//         var LMap = L.map(document.getElementById('artMap'), {
//             center: [24, 121], // 中心點
//             zoom: 10, // 縮放層級
//             crs: L.CRS.EPSG3857, // 座標系統
//             downloadable: true,
//             attributionControl: false,
//         });

//         // 			使用OSM圖層
//         L
//             .tileLayer(
//                 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 {
//                     attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
//                 }).addTo(LMap);

        // 			google maps
        // 			L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {
        // 				maxZoom : 20,
        // 				subdomains : [ 'mt0', 'mt1', 'mt2', 'mt3' ]
        // 			}).addTo(LMap); // 新增底圖    
        //         L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        //             maxZoom: 18,
        //             id: 'mapbox.streets'
        //         }).addTo(LMap);  // 新增底圖
		
        //			標記+按下去顯示說明文字，若有.openPopup()這個屬性，會直接顯示文字，無需點按
//         let markerBlue = L.marker([23.6, 121]).addTo(LMap).bindPopup(
//             "<b>Title</b><br>Description");
        // 			markerBlue.openPopup();

        //規劃路徑
        // 			L.Routing.control(
        // 					{
        // 						waypoints : [ L.latLng(24.67906857, 121.7561287),
        // 								L.latLng(23.5, 121.2) ]
        // 					}).addTo(LMap);

        // 			LMap.on('draw:created', function(e) {
        // 				let layer = e.layer;
        // 				let shape = layer.toGeoJSON();
        // 				let shape_for_db = JSON.stringify(shape);
        // 			});

//     })();
	</script>
</body>
</html>