<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<title>訂單</title>
<style type="text/css">
.paystatus {
	width: 100px;
}
.do {
	width: 200px;
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
					<h1 class="text-white">AAART Ticket</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="<c:url value='/04/SearchOrder.ctrl' />"> Orderlist</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->


	<div class="container">
		<br>
		<br>
		<H1>所有訂單</H1>
		<table class="table table-bordered">
			<tr>
				<th class=""></th>
				<th class="">訂單編號</th>
				<th class="">節目名稱</th>
				<th class="">票券種類</th>
				<th class="">訂購數量</th>
				<th class="">總金額</th>
				<th class="paystatus">付款狀況</th>
				<th class="do">操作</th>
			</tr>

			<%--使用JSTL 執行for loop ${show.no}取map內value --%>
			<c:forEach items="${requestScope.list}" var="orderlist"
				varStatus="idx">
				<tr>
					<form name="order"
						action="<c:url value='/04/OrderlistDetail.ctrl'/> " method="get">
						<!-- 					傳送訂單資訊 -->
						<td><input type=SUBMIT value="訂單詳細"
							class="genric-btn success-border radius"></td> <Input
							type='hidden' name='orderid' value='${orderlist.ORDERID}'>
					</form>

					<td>${orderlist.ORDERID}</td>
					<td>${orderlist.TITLE}</td>
					<td>${orderlist.TICKETCATEGORY}</td>
					<td>${orderlist.TICKET_NUM}</td>
					<td>${orderlist.TOTALPRICE}</td>
					<td>已付款</td>
					<td>
						<form name="order"
							action="<c:url value='/04/DeleteOrderlist.ctrl'/> " method="get">
							<button type="submit" name="orderid" value="${orderlist.ORDERID}"
								class="genric-btn success-border radius" onclick="return del()">取消訂單</button>
						</form>
					</td>



				</tr>

			</c:forEach>


		</table>
		</form>
	</div>
	<!-- 	 <input type="submit" value="修改訂單" name="submit" class="btn btn-outline-info" id="update"  > -->

	<!-- 	  <input type="submit" value="刪除訂單" name="submit" class="btn btn-outline-info" id="delete"  > -->
	<%-- 	 <form name="order" action="<c:url value='/_04_Orderlist/OrIdDeleteServlet'/> " method="get"> --%>
	<!-- 	  </form> -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


	<script>
		function del() {
			var msg = "是否取消?";
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}
		
// 		 document.querySelector('#cancel').onclick = function(){
// 		    	swal({
// 		    		  title: "是否取消訂單?",
// 		    		  text: "訂單即將取消!",
// 		    		  icon: "warning",
// 		    		  buttons: true,
// 		    		  dangerMode: true,
// 		    		})
// 		    		.then((cancelOK) => {
// 		    			  if (cancelOK) {
// 		    			    swal("訂單已取消!", 
// 		    			    	{icon: "success",});
// 		    		    	setTimeout(function(){window.location="<c:url value='/04/DeleteOrderlist.ctrl'/>" ; },2000);
// 		    			  } else {
// 		    			    swal("動作已取消!");
// 		    			  }
// 		    			});
// 		    };
	</script>


</body>

</html>