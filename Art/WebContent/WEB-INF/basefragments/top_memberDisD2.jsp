<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.badge {
  padding-left: 9px;
  padding-right: 9px;
  -webkit-border-radius: 9px;
  -moz-border-radius: 9px;
  border-radius: 9px;
}

.label-warning[href],
.badge-warning[href] {
  background-color: #c67605;
}
#lblCartCount {
    font-size: 5px;
    background: #ff0000;
    color: #fff;
    padding: 0 3px;
    vertical-align: top;
    margin-left: -10px; 
}

</style>

<body>

<header id="header" id="home"
		style="font-family: cwTeXFangSong, serif;">

		<div class="container header-top">
			<div class="row">
				<div class="col-6 top-head-left">
					<ul>
					<li class="nav-item"><a class=""
						href="<c:url value='/35/personelInfoEntry.ctrl'/>"><img style='display:block; width:30px;height:20px;'
						src="data:image/jpg;base64, ${sessionScope.memberPic}" ></a></li>
						<li><a href="<c:url value='/adminEnterMemberArea'/>">你好！ ${sessionScope.member.getName()}</a></li>
						<li><a href="<c:url value='/userLeaveMemberArea'/>">離開會員專區</a></li>
						<li><a href="<c:url value='/35/logoutProcess'/>">登出</a></li>
					</ul>
				</div>
				<div class="col-6 top-head-right">
					<ul>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="<c:url value='/04/goshoppingcart.ctrl' />"><i class="fas fa-ticket-alt" style="font-size:13px"></i></a>
						<i class='badge badge-warning' id='lblCartCount'><%=pageContext.getSession().getAttribute("shoppingcartnum") %></i></li>
						<li><a href="<c:url value='/14/gotoCart.ctrl' />"><i class="fas fa-shopping-cart" style="font-size:13px"></i></a>
						<i class='badge badge-warning' id='lblCartCount'> <%=pageContext.getSession().getAttribute("carSize") %> </i></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="<c:url value='/index.html' />"><img
						src="<c:url value='/frontstyle/img/aaart.png'/>" alt="" title="" style='display:block; width:230px;height:40px;'/></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="#"><a href="index.html">首頁</a></li>
						<li><a href="<c:url value='/35/personelInfoEntry.ctrl' />">修改個人資訊</a></li>
						<li><a href="<c:url value='/04/SearchOrder.ctrl' />">票卷訂單紀錄</a></li>
						<li><a href="<c:url value='/14/showOrderList.ctrl' />">洋行購物紀錄</a></li>
						<li><a href="<c:url value='/03/front/reservation/myReservation.ctrl' />">商店預約紀錄</a></li>
						<li class="menu-has-children"><a href="">商店管理</a>
							<ul>
								<li><a href="<c:url value='/03/front/shop/myShop.ctrl' />">藝文商店管理</a></li>
								<li><a href="<c:url value='/03/front/calendar/myCalendar.ctrl' />">行事曆管理</a></li>
							</ul>
						</li>
						<li><a href="#">藝人聘用紀錄</a></li>
						<li><a href="#">課程購買紀錄</a></li>
						<li><a href="#">我設計的旅程</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	
	

</body>
