
<!-- jsp配置 -->

<%@ page language="java" import = "java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
		List<String> newsList = new ArrayList<String>();;
		newsList.add("123");
		newsList.add("123");
		newsList.add("123");
		newsList.add("123");
		//session.setAttribute("newsList", newsList);
		//${sessionScope.newsList}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		
		
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
	</head>

	<body class="skin-orange">
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
								<li><a href="register.html"><i class="ion-person-add"></i><div>注册</div></a></li>
								<li><a href="login.html"><i class="ion-person"></i><div>登录</div></a></li>
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
					<!-- 修改tab栏 -->
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
		<!--分类页面开始  -->
		<section class="category">
		  <div class="container">
		    <div class="row">
		      <div class="col-md-8 text-left">
		        <div class="row">
		          <div class="col-md-12">        
		            <ol class="breadcrumb">
		            <!-- 跳回主页，登录状态会用session属性 -->
		              <li><a href="index.html">主页</a></li>
		              <!-- 分类名，news属性填充 -->
		              <li class="active">${sessionScope.category}</li>
		            </ol>
		            <!-- 分类名，news属性填充 -->
		            <h1 class="page-title">分类: ${sessionScope.category}</h1>
		            <p class="page-subtitle">展示该类上的所有 <i>${sessionScope.category}</i></p>
		          </div>
		        </div>
		        <div class="line"></div>
		        <div class="row">
		        
		        <c:forEach items="${sessionScope.newsList}" var="news">
		        <!-- 每个简要新闻的展示在一个artical中 news为单个新闻对象-->
		          <article class="col-md-12 article-list">
		            <div class="inner">
		              <figure>
		              <!--图片包含具体新闻链接,${news.content} -->
			              <a href="single.html">
			              <!--里面放url，暂时为网上非本地 ${news.pictureURL}-->
			                <img src="images/news/img01.jpg">
		                </a>
		              </figure>
		              <div class="details">
		                <div class="detail">
		                  <div class="category">
		                  <!--跳到分类链接，给参数 -->
		                   <a href="../ClassifiedServlet?category=${sessionScope.category}">${sessionScope.category}</a>
		                  </div>
		                  <!--新闻时间，是news属性 -->
		                  <div class="time">${news.time}</div>
		                </div>
		                <!--跳转至具体展示页面，链接需要传参数新闻id属性，内容填充新闻name -->
		                <h1><a href="single.html">${news.name}</a></h1>
		                <!--显示新闻概要内容，news属性填充 -->
		                <p>
		                	${news.simple}
		                </p>
		                <!-- 收藏按钮之后实现，可以保持用户点击收藏变色，并存入数据库，登录时若收藏有则显示收藏的状态 -->
		                <footer>
		                  <a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>237</div></a>
		                  <!-- 更多按钮跳转至具体新闻页面，链接要带news的id属性 ../NewsServlet?newsid=${news.id} -->
		                  <a class="btn btn-primary more" href="single.html">
		                    <div>更多</div>
		                    <div><i class="ion-ios-arrow-thin-right"></i></div>
		                  </a>
		                </footer>
		              </div>
		            </div>
		          </article>
		          <!--一个新闻列表项完毕 -->
		          </c:forEach>
		          
		          <div class="col-md-12 text-center">
		            <ul class="pagination">
		              <li class="prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
		              <li class="active"><a href="#">1</a></li>
		              <li><a href="#">2</a></li>
		              <li><a href="#">3</a></li>
		              <li><a href="#">...</a></li>
		              <li><a href="#">97</a></li>
		              <li class="next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
		            </ul>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		<!-- End Footer -->

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
	</body>
</html>