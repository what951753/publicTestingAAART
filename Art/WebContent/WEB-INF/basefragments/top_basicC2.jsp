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
						<li><a href="<c:url value='/adminEnterMemberArea'/>">會員專區</a></li>
						<li><a href="<c:url value='/adminEnterBackstage'/>">後台資料管理</a></li>
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
						<li class="#"><a href="<c:url value='/index.html' />">首頁</a></li>
						<li><a href="<c:url value='/14/shopListController.ctrl' />">得意洋行</a></li>
						<li><a href="<c:url value='/03/index/shop/index.ctrl' />">找商店</a></li>
						<li><a href="<c:url value='/userStreetArtistPage.ctrl' />">找藝人</a></li>
						<li><a href="<c:url value='/18/cSelectAllFront.ctrl' />">找課程</a></li>
						<li><a href="<c:url value='/35/routePlanningEntry' />">藝同去郊遊</a></li>
						<li><a href="<c:url value='/35/randomRecom.ctrl' />">離我最近的活動</a></li>
<!-- 						<li class="menu-has-children"><a href="">Pages</a> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#">Blog Single</a></li> -->
<!-- 								<li><a href="#">Category</a></li> -->
<!-- 								<li><a href="#">Elements</a></li> -->
<!-- 							</ul></li> -->
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	
	
</body>