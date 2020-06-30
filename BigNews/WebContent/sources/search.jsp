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
		
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Expires"  content="0">
		
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
		<!-- iCheck -->
		<link rel="stylesheet" href="scripts/icheck/skins/all.css">
		<!-- Custom style -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/skins/all.css">
		<link rel="stylesheet" href="css/demo.css">
		
		<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	</head>
	
	<body class="skin-orange" onload="init()">
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
							<form class="search" autocomplete="off" action="../search" method="post">
								<div class="form-group">
									<div class="input-group">
										<input type="text" name="key" class="form-control" placeholder="输入文字">									
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
								<c:if test="${sessionScope.user.name != null}">
									<li><a href="userDisplay.jsp?in=yes"><i class="ion-person"></i>
										<div>${sessionScope.user.name}</div></a>
									</li>
								</c:if>
								<c:if test="${sessionScope.user.name == null}">
									<li><a href="login.jsp"><i class="ion-person"></i>
										<div>登录</div></a>
									</li>
								</c:if>
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

		<section class="search">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
					
					
					
						<!-- 在已搜索出的列表中再选取关键词筛选，此功能作为候选功能，暂未实现 -->
						<!-- <aside>
							<h2 class="aside-title">搜索</h2>
							<div class="aside-body">
								<p>用其他关键词或者过滤器来获得更精准的结果</p>
								<form>
									<div class="form-group">
										<div class="input-group">
											<input type="text" name="q" class="form-control" placeholder="输入关键词" value="">
											<div class="input-group-btn">
												<button class="btn btn-primary">
													<i class="ion-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</aside> -->
						
						
						
						<aside>
							<h2 class="aside-title">过滤器</h2>
							<div class="aside-body">
								<form class="checkbox-group" action="../SearchFilter" method="get">
								
									<!-- 按照时间过滤，暂未实现 -->
									<!-- <div class="group-title">时间</div>
									<div class="form-group">
										<label><input type="radio" name="date" checked> 任何时候</label>
									</div>
									<div class="form-group">
										<label onclick="click1()"><input type="radio" name="date"> 今日</label>
									</div>
									<div class="form-group">
										<label><input type="radio" name="date"> 上周</label>
									</div>
									<div class="form-group">
										<label><input type="radio" name="date"> 上月</label>
									</div>
									<br> -->
									
									
									<div class="group-title">分类</div>
									<div class="form-group">
										<label><input type="checkbox" name="category" value="science"> 科技</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category" value="politics"> 时政</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category" value="economics"> 财经</label>
									</div>
									<div class="form-group">
										<label><input type="checkbox" name="category" value="sports"> 体育</label>
									</div>
									
									<br>
									<button class="ion-refresh">确定</button>

								</form>
							</div>
						</aside>
					</div>
					<div class="col-md-9">
						<div class="nav-tabs-group">
							<h4>
								查询：${sessionScope.key}
								<c:if test="${sessionScope.key == \"\"}">所有</c:if>
								<c:if test="${sessionScope.categories != null}">
									<c:forEach items="${sessionScope.categories}" var="x">
										<span style="font-size:16px">[${x }]</span>
									</c:forEach>
								</c:if>
								<c:if test="${sessionScope.categories == null}">
									<span style="font-size:16px">[All]</span>
								</c:if>
								<span style="font-size:16px">#${requestScope.page}</span>
							</h4>
							<form action="../SearchPager">
							<button style="float: right;font-size: 20px;margin-left: 5px;">跳转</button>
							<div class="nav-tabs-right">
								<select class="form-control" id="selectbox"  name="select">
									
									<!-- 目录 -->
									<c:forEach begin="1" end="${requestScope.pageNum}" var="ep">
										<option value="${ep}">${ep}</option>
									</c:forEach>
									
									
								</select>
							</div>
							</form>
						</div>
						<div class="search-result">
						</div>
						<div class="row">
						
						
							<!-- 新闻列表循环 -->
							<c:forEach items="${ sessionScope.newsList}" var="news">
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="single.html">
											<img src="${ news.pictureURL }">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">${ news.type }</a>
											</div>
											<time>${ news.time }</time>
										</div>
										<h1><a href="../NewsServlet?news_id=${news.id}">${ news.name }</a></h1>
										<p>
										${news.simple }
										</p>
										<footer>
											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>${ news.stars }</div></a>
											<a class="btn btn-primary more" href="single.html">
												<div>更多</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							</c:forEach>
							

							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Footer -->

		<!-- JS -->
		<script type="text/javascript">
			function init(){
				$("#selectbox").children("option").each(function(){
					if($(this).text() == ${requestScope.page}){
						this.selected = "selected";
					}
				})
			}
			function bbb(){
				
			}
		</script>
		
		<script src="js/jquery.js"></script>
		<script src="js/jquery.migrate.js"></script>
		<script src="scripts/bootstrap/bootstrap.min.js"></script>
		<script>var $target_end=$(".best-of-the-week");</script>
		<script src="scripts/jquery-number/jquery.number.min.js"></script>
		<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
		<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
		<script src="scripts/easescroll/jquery.easeScroll.js"></script>
		<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
		<script src="scripts/icheck/icheck.min.js"></script>
		<script src="scripts/toast/jquery.toast.min.js"></script>
		<script src="js/demo.js"></script>
		<script>$("input").iCheck({
      checkboxClass: 'icheckbox_square-red',
      radioClass: 'iradio_square-red',
      cursor: true
		});</script>
		<script src="js/e-magz.js"></script>
	</body>
</html>