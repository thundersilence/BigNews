<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.dao.NewsDao" %>
<%@ page import = "com.entity.*" %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=request.getContextPath()%>/sources/">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">

	<title>Big-News 后台</title>

	<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
	<!-- Toast -->
	<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
	<!-- OwlCarousel -->
	<link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="scripts/magnific-popup/dist/magnific-popup.css">
	<link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
	<!-- Custom style -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/skins/all.css">
	<link rel="stylesheet" href="css/demo.css">
	
	<link rel="stylesheet" type="text/css" href="css/project.css">
	
	<!-- JS -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.migrate.js"></script>
	<script src="scripts/bootstrap/bootstrap.min.js"></script>
	<script>var $target_end=$(".best-of-the-week");</script>
	<script src="scripts/jquery-number/jquery.number.min.js"></script>
	<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="scripts/toast/jquery.toast.min.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/e-magz.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>
<body>
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="index.html">
								<img src="images/logo.png" alt="Magz Logo">
							</a>
						</div>						
					</div>
					<div class="col-md-6 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control" placeholder="输入文字">									
									<div class="input-group-btn">
										<button class="btn btn-primary"><i class="ion-search"></i></button>
									</div>
								</div>
							</div>
							<div class="help-block">
								<div>热点标签：</div>
								<ul>
									<li><a href="#">标签1</a></li>
									<li><a href="#">标签2</a></li>
									<li><a href="#">标签3</a></li>
									<li><a href="#">标签4</a></li>
									<li><a href="#">标签5</a></li>
								</ul>
							</div>
						</form>								
					</div>
					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="register.jsp"><i class="ion-person-add"></i><div>注册</div></a></li>
							<li><a href="login.jsp"><i class="ion-person"></i><div>登录</div></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu">
			<div class="container">
				<div class="brand">
					<a href="#">
						<img src="images/logo.png" alt="Magz Logo">
					</a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
				</div>
				<div id="menu-list">
					<ul class="nav-list">
						<li><a href="index.html">主页</a></li>
						<li><a href="category.html">分类1</a></li>
						<li><a href="category.html">分类2</a></li>
						<li><a href="category.html">分类3</a></li>
						<li><a href="category.html">分类4</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>

		
	<!-- 主要展示部分 -->
	<section class="search">
		<div class="container">
			<div class="row">
			
				<!-- 侧边栏start -->
				<div class="col-md-3">
					<aside>
						<h1><a href="addNews.html" class="titlefont">>增加新闻</a></h1>
					</aside>
					<aside>
						<h1><a href="#" class="titlefont">>查看日志</a></h1>
					</aside>
					<aside>
						<div class="aside-body">
							<form action="#">
								<textarea name="notice" style="height:100px; width:100%;resize:none;"></textarea>
								<button class="btn btn-primary" style="margin-top:-4px">发布公告</button>
							</form>
						</div>
					</aside>
				</div>
				<!-- 侧边栏end -->
				
				<!-- 新闻列表start -->
				<div class="col-md-6">
					<div class="row">
						<!-- news搜索框 -->
						<article class="col-md-12 article-list">
							<form action="#">
								<input type="text" name="newskey" class="form-control" style="width:75%;display:inline">
								<button class="btn btn-primary buttom"><i class="ion-search"></i></button>
							</form>
						</article>
						
						<!-- news列表循环start -->
						<c:forEach items="${sessionScope.newsList}" var="news">
						<article class="col-md-12 article-list">
							<div class="inner">
								<figure id="simplefigure">
									<a href="single.html">
										<img src="${news.pictureURL}" class="simpleimage">
									</a>
								</figure>
								<div class="details" id="simcontent">
									<div class="category">
										<a href="#">${news.type}</a>
									</div>
									<time>${news.time}</time>
									<h1><a href="single.html">${news.name}</a></h1>
									<div id="bottom">
										<a class="btn btn-primary more" href="single.html">
											<div>查看</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
										<a class="btn btn-primary more" href="#">
											<div>编辑</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
										<a class="btn btn-primary more" href="../secret?action=delete&id=${news.id}">
											<div>删除</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
									</div>
								</div>
							</div>
						</article>
						</c:forEach>
						<!-- 循环end -->

					</div>
				</div>
				<!-- 新闻列表end -->
				
				
				<!-- 用户列表start -->
				<div class="col-md-3">
					<div class="row">
						
						<!-- user搜索框 -->
						<article class="col-md-12 article-list">
							<form action="#">
								<input type="text" name="userkey" class="form-control" style="width:75%;display:inline">
								<button class="btn btn-primary buttom"><i class="ion-search"></i></button>
							</form>
						</article>
						
						<!-- user列表循环start -->
						<c:forEach items="${sessionScope.userList}" var="user">
						<article class="col-md-12 article-list">
							<div class="inner">
								<div class="details" id="user">
									<a href="single.html" id="leftdiv">
										<div id="titlefont">${user.name}</div>
										<div id="titlefont">${user.id}</div>
									</a>
									<span id="rightdiv" style="bottom:0; right:0;position:absolute;">
										<a class="btn btn-primary more" href="#">
											<div>删除</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
									<span>
								</div>
							</div>
						</article>
						</c:forEach>
						<!-- 循环end -->
						
					</div>
				</div>
				<!-- 用户列表end -->
				
			</div>
		</div>
	</section>
</body>
</html>