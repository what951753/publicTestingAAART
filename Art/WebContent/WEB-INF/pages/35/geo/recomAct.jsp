<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢離我最近的活動</title>
<style>
body {
	font-size: 26px;
	color: black;
}

.content {
	text-align: center;
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
					<h1 class="text-white">離我最近的活動</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/35/randomRecom.ctrl' />">離我最近的活動</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<br>
	<div class="content">
		<h1>我目前的位置</h1>
		<br>
		<form action="<c:url value='/35/findNear.ctrl'/> " method="get">
			<div class="searchBox">
				<input id="userLocation" type="text" name="userLocation" value="">
			</div>
			<BR>
			<div class="submitButton">
				<input class="genric-btn primary radius" type="submit" name="submit"
					value="確認送出">
				<button class="genric-btn info radius" id="oneKey" type="button">一鍵輸入</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<div class="content">
		<h1>猜您喜歡</h1>
	</div>
	<br>
	<div class="content">
		<c:forEach var="recommend" items="${recommend}">
			<c:set var="addr"
				value="${recommend.city.concat(recommend.district).concat(recommend.address)}" />
			<h3>${recommend.title}</h3>
			<h5>時間: ${recommend.time}</h5>
			<iframe width="100%" height="280" frameborder="0"
				src="https://www.google.com/maps?q=${addr}&output=embed"></iframe>
			<%-- 		${addr}前兩條斜線，中間是使用者位置 --%>
			<%-- 		<a href="https://www.google.com.tw/maps/dir//${addr}">導航網頁版</a> --%>
			<input class="genric-btn primary radius" type="button"
				onclick="navigate(this.id)" id="${addr}" value="幫我導航">
			<div>
				<br>
			</div>
		</c:forEach>
	</div>
	<br>
	<div class="content">
		<h1>台灣孩童的藝文指數</h1>
		<br>
		<form action="<c:url value='/35/founding.ctrl'/> " method="get">
			<div class="searchBox">
				<input type="text" class="" name="kidsLocation" value="">
			</div>
			<br>
			<div class="submitButton">
				<input class="genric-btn primary radius" type="submit" name="submit"
					value="好奇嗎？點下去就對了">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function getRandomInt(max) {
			return Math.floor(Math.random() * Math.floor(max));
		}
		
		let oneKey = document.getElementById("oneKey");
		
		oneKey.addEventListener("click", () => {
			if(getRandomInt(3)==0){
				document.getElementById("userLocation").value="台南";
			}else if(getRandomInt(3)==1) {
				document.getElementById("userLocation").value="資策會";
			}else {
				document.getElementById("userLocation").value="西門町";
			}
		});

// 	宣告一個名為navigete的箭頭函式，傳入參數是addr
// 	let navigate命名是為了button onclick 要有function名稱
// 	若箭頭函式只有單一參數，參數的括號可省略
	let navigate = addr => {
// 		fetch()回傳的是promise物件，下面寫一個promise物件範例
// 		let p = new Promise((resolve, reject) => {
// 			let a = 2;
// 			if(a==2){
// 				傳入的resolve是函示名
// 				resolve()
// 			}else {
// 				傳入的reject是函示名
// 				reject()
// 			}			
// 		});
		fetch("<c:url value='/35/navigate/' />"+addr, {
			method: 'GET'}
// 		then()框框內的參數response是上一步fetch()執行之回傳值
// 		response帶入成為then()中箭頭函式之參數
// 		橫槓內代表成功時之處理
// 		----------------------------------------
		).then(response => {
// 			因為fetch就算不是200也會回傳成功的結果，所以要加這步驟判斷
// 			等同response==200
			if (response.ok){
// 				response回傳的是stream物件，所以需要.text()/.json()/.blob()方法取資料
// 				response.header可以取header內容
// 				response.text()回傳的是promise物件，所以要再.then()一次處理成功時回傳的值
// 				message帶入成為then()中箭頭函式之參數
				response.text().then(message => {	
// 					message就是回傳後轉形成text的回應內容，這時候創元素變數名稱
					let navigateButton = document.getElementById(addr);
					let navigateImg = document.createElement('img');
// 					Button後方插入元素
					navigateButton.insertAdjacentElement("afterend", navigateImg);
// 					插入圖片屬性
					navigateImg.src="data:image/png;base64, " + message;
					navigateImg.style.margin="0 auto";
					navigateImg.style.display = "block";
					navigateImg.style.width = "400px";
					navigateImg.style.height = "400px";	
//			 	第二層.then()沒回傳promise物件成功的結果時，會跳到此catch						
				}).catch();	
			}
// 		第一層.then()沒回傳promise物件成功的結果時，會跳到此catch
		}).catch();
	}

	</script>
</body>
</html>