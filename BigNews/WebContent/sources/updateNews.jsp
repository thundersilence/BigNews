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

	<title>编辑新闻</title>

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
							<a href="index.jsp">
								<img src="images/logo.png" alt="Magz Logo">
							</a>
						</div>						
					</div>
					<div class="col-md-6 col-sm-12">
						<form class="search" autocomplete="off" action="../search" method="post">
								<div class="form-group">
									<div class="input-group">
										<input type="text" name="key" class="form-control" placeholder="输入文字">									
										<div class="input-group-btn">
											<button class="btn btn-primary"><i class="ion-search"></i></button>
										</div>
									</div>
								</div>
						</form>								
					</div>
					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="register.jsp"><i class="ion-person-add"></i><div>注册</div></a></li>
							<c:if test="${sessionScope.user.name != null}">
								<li><a href="userDisplay.jsp?in=yes"><i class="ion-person"></i>
									<div>${sessionScope.user.name}</div></a>
								</li>
							</c:if>
								<li><a href="login.jsp"><i class="ion-person"></i>
									<div>登录</div></a>
								</li>
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
						<li><a href="index.jsp">主页</a></li>
						<li><a href="../ClassifiedServlet?category=science">Science</a></li>
						<li><a href="../ClassifiedServlet?category=economics">Economics</a></li>
						<li><a href="../ClassifiedServlet?category=politics">Politics</a></li>
						<li><a href="../ClassifiedServlet?category=sports">Sports</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>

							
	<!-- 主要展示部分 -->
	<section class="login first grey">
		<div class="container">
			<h4>编辑新闻</h4>
			<form action="../updateNews?id=${param.id}" method="post">
				<div class="box box-border">
					<div class="box-body">
						<h6>标题</h6>
						<input type="text" name="title" class="form-control" value="${requestScope.news.name}">
						<h6>来源</h6>
						<input type="text" name="source" class="form-control" value="${requestScope.news.source}">
						<h6>作者</h6>
						<input type="text" name="author" class="form-control" value="${requestScope.news.author}">
						<h6>新闻类别</h6>
						<span><input type="radio" name="category" value="science" checked>Science</span>
						<span><input type="radio" name="category" value="economics">Economics</span>
						<span><input type="radio" name="category" value="politics">Politics</span>
						<span><input type="radio" name="category" value="sports">Sports</span>
						<h6>缩略图(url)</h6>
						<input type="text" name="newsimage" class="form-control" value="${requestScope.news.pictureURL}">
						<h6>新闻简介</h6>
						<textarea class="form-control" name="simple" style="resize:none">${requestScope.news.simple}</textarea>
					</div>
				</div>
				
				<div class="box-body">
					<textarea id="content" name="content"></textarea>						
					<script type="text/javascript">
						var obj = CKEDITOR.replace('content',{height:460});
						obj.setData("${requestScope.content}");
					</script>

					<button class="btn btn-primary btn-block">上传</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>