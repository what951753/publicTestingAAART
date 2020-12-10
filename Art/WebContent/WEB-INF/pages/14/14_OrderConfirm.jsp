<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='/14/productListDelet.ctrl?productIdAP=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}

function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		console.log("key= "+key);
		document.forms[0].action="<c:url value='/14/productListModify.ctrl?productIdAP=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}


function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}

// function Abort() {
// 	if (confirm("確定清空購物車? ") ) {
// 		return true;
// 	} else {
// 		return false;
// 	}
// }


function Abort() {
swal({
	  title: "你確定嗎？",
	  text: "你確定要將購物車中的商品全部刪除嗎？",
	  icon: "warning",
	  buttons: true,
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
	    swal("你已將購物車中商品全數刪除")
	      
	      setTimeout(function(){window.location.href="<c:url value='/14/AbortCart.ctrl' />" ;},2000);

	    
	  } else {
	    swal("購物車商品未被刪除");
	  }
	});
}

</script>
</head>
<body>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">AAART Shop</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/14/shopListController.ctrl' />"> Shop</a>
						<span class="lnr lnr-arrow-right"></span> <span>結帳頁面</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<div class="section-top-border" style="text-align: center;">
			<h3 class="mb-30">Table</h3>
			<div class="">
				<div class="progress-table" style="text-align: center;">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="country">圖示</div>
						<div class="visit">名稱</div>
						<div class="visit">數量</div>
						<div class="visit">價格</div>
						<div class="visit">小計</div>
						<div class="visit">編輯</div>
					</div>
					<c:forEach varStatus="vs" var="anEntry" items="${carList.cartAP}">
						<div class="table-row" style="text-align: center;">
							<div class="serial" style="text-align: center;">${vs.count}</div>
							<div class="" style="text-align: center;">
								<img
									src="${pageContext.servletContext.contextPath}/14/getBlobImage/${anEntry.value.productId}.ctrl"
									width="100" height="100" title="圖片提示文字" alt="...">
							</div>
							<div class="visit">${anEntry.value.productTitle}</div>
							<div class="" style="text-align: center;">
								<input id="newQty${vs.index}" name="newQty" type="number"
									value="${anEntry.value.productNum}" min="1" name="qty"
									style="width: 54px; text-align: center;" onchange="modify(${anEntry.key}, ${anEntry.value.productNum}, ${vs.index})">
							</div>
							<div class="visit">
								<fmt:formatNumber value="${anEntry.value.productPrice}"
									type="number" />元
							</div>
							<div class="visit">
								<fmt:formatNumber
									value="${anEntry.value.productPrice * anEntry.value.productNum}"
									type="number" />元
							</div>
							<div class="visit">
								<input type="button" value="刪除此項商品" class="genric-btn success small"
									onclick="confirmDelete(${anEntry.value.productId})">
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</body>
</html>