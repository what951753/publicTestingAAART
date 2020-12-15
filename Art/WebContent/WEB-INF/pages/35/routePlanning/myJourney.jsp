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
	height: 850px;
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

#myJourneyResult {
	display: none;
}

.showPins {
	margin: 40px 0;
}

.searchBox1, .searchBox2r {
	padding: 20px 0;
}

.searchBox1 h1, .searchBox2l h3, .searchBox2r h3 {
	padding-bottom: 5px;
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
			<div class="showPins">
				<input id="showPins" class="genric-btn primary radius" type=button
					onclick=getMyJourney() value="顯示我的地點">
			</div>
			<div class="searchBox1">
				<h1>輸入任意地點，尋找活動：</h1>
				<input type="text" id="userLocation">
			</div>
			<div class="searchBox2">
				<div class="searchBox2l">
					<h3>可接受距離該地點多遠的活動</h3>
					<input type="text" id="userDistance">公里<br>
				</div>
				<div class="searchBox2r">
					<h3>選擇偏好的藝文活動種類</h3>
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
				<div class="oneKey">
					<button class="genric-btn info radius" id="oneKey" type="button">一鍵輸入</button>
				</div>
			</div>
			<br> <br>
			<div class="editPinArea">
				<input id="editPinButton" class="genric-btn primary radius"
					type="button" value="用圖釘標記我想去的地方">
				<div class="myJourney">
					<div>
						<label>活動名稱</label> <input id="actName" type="text">
					</div>
					<!-- 					<div> -->
					<!-- 						<label>活動地點</label> <input type="text"> -->
					<!-- 					</div> -->
					<div>
						<label>活動時間</label> <input id="actTime" type="text">
					</div>
					<div>
						<label>備註事項</label>
						<textarea id="actNotes"></textarea>
					</div>
					<input id="savePinButton" class="genric-btn primary radius"
						type="button" value="儲存">
					<button class="genric-btn info radius" id="oneKey2" type="button">一鍵輸入</button>
				</div>
				<div>
					<p id="myJourneyResult"></p>
				</div>
			</div>
		</div>
	</div>

	<!-- 地圖以及資料顯示按鈕本體 -->
	<div class="container my-5 mapArea">
		<div id="artMap"></div>
	</div>
	<div style="clear: both;"></div>

	<script type="text/javascript">

	function getRandomInt(max) {
		return Math.floor(Math.random() * Math.floor(max));
	}
	
	let oneKey = document.getElementById("oneKey");
	
	oneKey.addEventListener("click", () => {
// 		if(getRandomInt(5)==0){
// 			document.getElementById("userLocation").value="台南";
// 			document.getElementById("userDistance").value="4";
// 		}else if(getRandomInt(5)==1) {
			document.getElementById("userLocation").value="台北車站";
			document.getElementById("userDistance").value="3";
// 		}else if(getRandomInt(5)==2){
// 			document.getElementById("userLocation").value="西門町";
// 			document.getElementById("userDistance").value="10";
// 		}else if(getRandomInt(5)==3){
// 			document.getElementById("userLocation").value="松山車站";
// 			document.getElementById("userDistance").value="5";
// 		}else if(getRandomInt(5)==4){
// 			document.getElementById("userLocation").value="板橋";
// 			document.getElementById("userDistance").value="8";
// 		}
	});

	let oneKey2 = document.getElementById("oneKey2");
	
	oneKey2.addEventListener("click", () => {
		if(getRandomInt(3)==0){
			document.getElementById("actName").value="七週年小驚喜";
			document.getElementById("actTime").value="2020/12/26";
			document.getElementById("actNotes").value="久違的與女友約會，這個活動種類看起來她會喜歡，到時候要記得搶票";
		}else if(getRandomInt(3)==1) {
			document.getElementById("actName").value="這是一個很酷的活動";
			document.getElementById("actTime").value="2020/12/31";
			document.getElementById("actNotes").value="新北塞車城，有喜歡的歌手會來，必去！";
		}else {
			document.getElementById("actName").value="鐵道部歷史展覽";
			document.getElementById("actTime").value="2020/12/30";
			document.getElementById("actNotes").value="鐵道部終於整修完成了，就在台北車站旁邊而已！";
		}
	});
	

// 	初始化地圖參數，這個動作只要做一遍
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

    let getMyJourney = () => {
    	let url = "<c:url value='/35/myJourney' />";

         fetch(url, {
             method: "get"
         })
             .then(status)
             .then(json)
             .then(data => {
 				console.log(data);
//  				if (data.result=="successful"){
//  					editResult.innerText = "新增成功";
//  				}else {
//  					editResult.innerText = "新增失敗";
//  				}
             })

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
                lat: shape.geometry.coordinates[1],
                lon: shape.geometry.coordinates[0]
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
	let editResult = document.getElementById("myJourneyResult");
	let edit = document.getElementById("editPinButton");
	let save = document.getElementById("savePinButton");

	let name = document.getElementById("actName");
	let time = document.getElementById("actTime");
	let notes = document.getElementById("actNotes");

	let editSiteObj = () => {
		edit.style.display="none";
		editResult.style.display="none";
		myJourney.style.display="block";
		name.value="";
		time.value="";
		notes.value="";
	}
	
	edit.addEventListener("click", editSiteObj);

	let previousPin;
	let saveSiteObj = (e) => {
		edit.style.display="";
		myJourney.style.display="none";

        let url = "<c:url value='/35/myJourney' />";
		previousPin ={
				"name": name.value,
				"time": time.value,
				"notes": notes.value,
				"lat": siteObj.lat,
				"lon": siteObj.lon
				}
        fetch(url, {
            method: "post",
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: JSON.stringify(previousPin)
        })
            .then(status)
            .then(json)
            .then(data => {
				editResult.style.display = "block";
				if (data.result=="successful"){
					editResult.innerText = "新增成功";
				}else {
					editResult.innerText = "新增失敗";
				}
            })

        let positionArray =[]
       	positionArray[0]=previousPin.lat;
       	positionArray[1]=previousPin.lon;
//		設定地圖中心
    	LMap.setView(positionArray, 15);
//		繪製查詢中心點圖釘
        markerRed = L.marker(positionArray, {
            icon: redIcon
        })
        .bindPopup("<b>"+previousPin.name+"</b>"+
		"<br>詳細資訊: "+"<a href=\"https://www.google.com/search?q="+previousPin.name+"\" target=\"_blank\">點擊查看</a>"+
		"<br>文化部查詢相關活動: "+"<a href=\"https://www.moc.gov.tw/searchall_5.html?q="+previousPin.name+"\" target=\"_blank\">點擊查看</a>"+
		"<br>時間: "+previousPin.time+
		"<br>備註: "+previousPin.notes)
        .addTo(LMap);

//	    Popup直接顯示出來
	    markerRed.openPopup();
	}
	
	save.addEventListener("click", saveSiteObj);

	let showPins = document.getElementById("showPins");
	
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