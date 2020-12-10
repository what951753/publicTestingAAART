<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">確認您購買的商品</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a>
				    <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a>
					<span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/toCoCart.ctrl' />">購物車</a>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->

<script>
function confirmDelete(n) {  //n=${orderCo.value.coId}
	if (confirm("您確定要刪除 ? ") ) {
		document.forms[0].action="<c:url value='/18/deleteCartList.ctrl?coId=" + n +"' />"  
		//獲取當前頁面第一個表單
		document.forms[0].method="POST";
		document.forms[0].submit();  //提交
	} else {
	
	}
}

</script>

<table id="cTableF" class="table table-bordered" width="100%"
	cellspacing="0">

	<tr>
		<th>課程編號</th>
		<th>課程圖片</th>
		<th>課程名稱</th>
		<th>數量</th>
		<th>售價</th>
		<th>小計</th>
		<th>刪除課程？</th>
	</tr>
<!--
varStatus是c:forEach，jstl循環標簽的一個屬性，varStatus屬性。
就拿varStatus=“status”來說，事實上定義了一個status名的對象作為varStatus的綁定值。
該綁定值也就是status封裝了當前遍歷的狀態，比如，可以從該對象上查看是遍歷到了第幾個元素：${status.count}，
status.index 輸出行號，從0開始。

var:String型別，用來指定一個變數的名稱，此變數將用來表示某個元素(字串.JavaBean.Key+Value組成的Entry等，或是註標的值
varStatus:定義一個變數，此變數本身為一個JSP準備的物件具有四個屬性，可表示迴圈執行的狀態
items:Object型別、多元素的集合，數據來源-->

	<c:forEach var="orderCo" varStatus="stat" items="${ccc.cartCo}">
	
		<tr>
		<!--如果是HashMap，var後需要加上  .value 。List則不用-->
			<td>${orderCo.value.coId}</td>
			<td><img style='display: block; width: 64px; height: 36px;'
				src="data:image/jpg;base64, ${orderCo.value.coAct_ImageStr}"></td>
			<td>${orderCo.value.coTitle}</td>
			<td>${orderCo.value.coNum}</td>
			<td><fmt:formatNumber value="${orderCo.value.coPrice}" type="number" />元</td>
			<!-- fmt:formatNumber日期、 數字、貨幣格式化
				type:參數有三種，分別是number(數字)，currency(貨幣)及percent(百分比) -->
			<td><fmt:formatNumber value="${orderCo.value.coNum * orderCo.value.coPrice}"
					type="number" />元</td>
			<td><input type="button" value="刪除本課程"
				onclick="confirmDelete(${orderCo.value.coId})"></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="4"></td>
		<td colspan="3">總計：<fmt:formatNumber value="${ccc.total}"
				type="number" />元
		</td>
		<td colspan="3"><a
				href="<c:url value='/18/SubmitCartCo.ctrl' />"
				onClick="return Checkout(${carList.subtotal});">送出訂單</a></td>
		
	</tr>
	
</table>
