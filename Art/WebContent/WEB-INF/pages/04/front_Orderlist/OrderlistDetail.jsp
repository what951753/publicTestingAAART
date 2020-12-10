<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<title>訂單</title>
<style type="text/css">
form {
	display: inline;
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
							<h1 class="text-white">
								AAART Ticket
							</h1>	
								<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="<c:url value='/04/SearchOrder.ctrl' />"> Orderlist</a> <span class="lnr lnr-arrow-right"></span>訂單編號${requestScope.orderlist.ORDERID}</p></p>
						</div>											
					</div>
				</div>
			</section>
	<!-- End banner Area -->

<div class="container">
 <br><br><H1>訂購人資訊</H1>
    <table class= "table table-bordered">
        <tr>
            <td>訂購人姓名
            </td>
            <td>${requestScope.orderlist.NAME}</td>
        </tr>
        <tr>
            <td>電子郵件
            </td>
            <td>
             ${requestScope.orderlist.EMAIL}
             </td>
        </tr>
        <tr>
            <td>電話
            </td>
            <td>
            
             ${requestScope.orderlist.TEL}
            </td>
        </tr>
        <tr>
            <td>地址
            </td>
            <td>
             ${requestScope.orderlist.ADDRESS}
            </td>
        </tr>
     </table><br><br> <br>  
     
	<H2>票券資訊</H2>
		<table class="table table-bordered">
		<tr> 
				<td>節目名稱</td>
				<td>票種</td>
				<td>座位</td>
				<td>票價</td>

			</tr>
			<p class="ticketcategry"  style="display:none">${requestScope.orderlist.TICKETCATEGORY}</p>
			<c:forEach items="${requestScope.orderlist.seats}" var="seat">
			<tr> 
				<td class="title">${requestScope.orderlist.TITLE}</td>
				<td >${requestScope.orderlist.TICKETCATEGORY}</td>
				<td >${seat}</td>
				<td class="price"></td>
				
			</tr>
			</c:forEach>
			<tr> 
				<td >總計:</td>
				<td ></td>
				<td ></td>
				<td >NT$${requestScope.orderlist.TOTALPRICE}</td>
			
			</tr>
			
		</table>	
<!-- 		修改訂單將建立一筆通知存入DB 通知管理員修改 -->
		<form name="order" action="<c:url value='/04/UpdateOrderlist.ctrl'/> " method="get"> 						
			 <button type="submit" id="change" name="orderid"  value="${requestScope.orderlist.ORDERID}" class="genric-btn success-border radius" >修改訂單</button>
		</form> 
		<form name="order" action="<c:url value='/04/DeleteOrderlist.ctrl'/> " method="get"> 						
			 <button type="button" id="cancel" name="orderid"  value="${requestScope.orderlist.ORDERID}" class="genric-btn success-border radius" onclick="return del()">取消訂單</button>
		</form> 
</div>


	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous">
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




<script>
$(document).ready(		
			function() {
					console.log($(".ticketcategry").text());
					if($(".ticketcategry").text()== "全票"){
					$(".price").text("NT$2000")
					}else{
					$(".price").text("NT$1000")
					}					 
				});

//      function change() {
// 		var msg = "將通知管理員進行修改";
// 		if (confirm(msg) == true) {
// 			return true;
// 		} else {
// 			return false;
// 		}
// 	}
    

    function del() {
		var msg = "是否取消訂單";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
    
//     document.querySelector('#cancel').onclick = function(){
//     	swal({
//     		  title: "是否取消訂單?",
//     		  text: "訂單即將取消!",
//     		  icon: "warning",
//     		  buttons: true,
//     		  dangerMode: true,
//     		})
//     		.then((cancelOK) => {
//     			    $.ajax({
//     			           type: 'GET',
//     			           url: "<c:url value='/04/DeleteOrderlist.ctrl'/>",
//     			           data:  {
//     			        	   orderid: document.getElementById('cancel').value,   			             
//     			           },
//     			  if (cancelOK) {
//     			    swal("訂單已取消!", 
//     			    	{icon: "success",});
// //     		    	setTimeout(function(){window.location="<c:url value='/04/DeleteOrderlist.ctrl'/>" ; },2000);
//     			  } else {
//     			    swal("動作已取消!");
//     			  }
//     			});
//     };
	
    
    

 </script>	  
	  
	  
</body>

</html>