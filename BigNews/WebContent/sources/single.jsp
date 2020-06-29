<%@ page language="java" import="java.util.*" import="com.dao.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	//取评论列表
//ArrayList<Comment> commentList = (ArrayList<Comment>)session.getAttribute("commentList");
//取若干个回复列表
//ArrayList<Reply> replyList = (ArrayList<Reply>)session.getAttribute("replyList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">


<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine
	Template</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="scripts/magnific-popup/dist/magnific-popup.css">
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
							<a href="index.html"> <img src="images/logo.png"
								alt="Magz Logo">
							</a>
						</div>
					</div>
					<div class="col-md-6 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control"
										placeholder="输入文字">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
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
							<li><a href="register.html"><i class="ion-person-add"></i>
									<div>注册</div></a></li>
							<li><a href="login.html"><i class="ion-person"></i>
									<div>登录</div></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu">
			<div class="container">
				<div class="brand">
					<a href="#"> <img src="images/logo.png" alt="Magz Logo">
					</a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
				<!-- 修改tab栏 -->
				<div id="menu-list">
					<ul class="nav-list">
						<li><a href="index.html">主页</a></li>
						<!-- 新闻类别的参数category 	..为上一级目录		-->
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

	<section class="single">
		<div class="container">
			<!-- 具体新闻内容开始 -->
			<div class="row">
				<div class="col-md-8">
					<ol class="breadcrumb">
						<!--  -->
						<li><a href="index.html">主页</a></li>
						<!-- 新闻分类名 -->
						<li class="active">${sessionScope.news.type}</li>
					</ol>
					<article class="article main-article">
						<header>
							<h1>${sessionScope.news.name}</h1>
							<ul class="details">
								<li>发表于 ${sessionScope.news.time}</li>
								<li><a>${sessionScope.news.type}</a></li>
								<li>作者 <a href="#">${sessionScope.news.author}</a></li>
							</ul>
						</header>
						<!-- 新闻文本开始，来源为本地的txt文件，输出为html格式 -->
						<div class="main">
							<c:out value="${sessionScope.news_content}" default="无"
								escapeXml="false" />
						</div>
						<footer>
							<!-- 
								<div class="col" align="center">
									<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>1220</div></a>
								</div>
								-->
						</footer>
					</article>
					<div class="line thin"></div>
					<!-- 评论开始-->
					<div class="comments">
						<h2 class="title">
							${sessionScope.commentList.size()} 评论 <a href="#">书写评论</a>
						</h2>
						<!-- 评论列表-->
						<div class="comment-list">
							<!-- 单个评论 items="${sessionScope.commentList}"begin="1" end="3"-->
							<c:forEach items="${sessionScope.commentList}" var="comment">
								<%--单个评论开始 --%>
								<div class="item">
									<div class="user">
										<figure>
											<%--根据user来找headimg ${comment.user.img}--%>
											<img src="images/img01.jpg">
										</figure>
										<div class="details">
											<h5 class="name">用户名: ${comment.user.name }</h5>
											<div class="description">评论${comment.content }</div>
											<footer>
												<a href="#"<%-- --%>>回复</a>
											</footer>
										</div>
									</div>
									<div class="回复-list">
										<%--第一层回复，回复评论的 ,遍历replylist，判断元素reply中的type属性，为回复评论的则显示.begin="1" end="2"--%>
										<c:forEach items="${comment.replyList}" var="reply0">
											<c:if test="${reply0.type==0}">
												<div class="item">
													<div class="user">
														<figure>
															<%--根据user来找headimg ${reply0.user.img}--%>
															<img src="images/img01.jpg">
														</figure>
														<div class="details">
															<h5 class="name">用户名:${reply0.user.name }</h5>
															<div class="time">24 Hours:${reply0.time }</div>
															<div class="description">评论的回复${reply0.content }</div>
															<footer>
																<a href="#">回复</a>
															</footer>
														</div>
													</div>
													<div class="回复-list">
														<%--第二层回复，回复回复的 --%>
														<c:forEach items="${comment.replyList}" var="reply1">
															<!-- 咋写在一个if标签中？ <c:if test="((${reply1.type}==1)&&(${reply1.target_reply_id}==${ reply0.id}))"> </c:if>-->
															<c:if test="${reply1.type==1}">
																<c:if test="${reply0.id==reply1.target_reply_id}">
																	<div class="item">
																		<div class="user">
																			<figure>
																				<%--根据user来找headimg ${reply1.user.img}--%>
																				<img src="images/img01.jpg">
																			</figure>
																			<div class="details">
																				<h5 class="name">用户名:${reply1.user.name }</h5>
																				<div class="time">24 Hours:${reply1.time }</div>
																				<div class="description">回复的回复${reply1.content }</div>
																				<footer>
																					<a href="#">回复</a>
																				</footer>
																			</div>
																		</div>
																	</div>
																</c:if>
															</c:if>
														</c:forEach>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>

								</div>
								<%--单个评论结束 --%>
							</c:forEach>
						</div>
						<!-- 用户登录时显示 -->
						<c:if test="true">
							<form class="row" >
								<div class="col-md-12">
									<h3 class="title">留下你的评论</h3>
								</div>
								<!-- 							
							<div class="form-group col-md-4">
								<label for="name">姓名 <span class="required"></span></label> <input
									type="text" id="name" name="" class="form-control">
							</div>
							<div class="form-group col-md-4">
								<label for="email">邮箱 <span class="required"></span></label> <input
									type="email" id="email" name="" class="form-control">
							</div>
							<div class="form-group col-md-4">
								<label for="website">网站</label> <input type="url" id="website"
									name="" class="form-control">
							</div> 
							-->
								<div class="form-group col-md-12">
									<label for="message">评论 <span class="required"></span></label>
									<textarea class="form-control" name="message"
										placeholder="书写评论..."></textarea>
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-primary">发送评论</button>
								</div>
							</form>
						</c:if>

					</div>
					<!-- 评论结束 -->
				</div>
			</div>
		</div>
	</section>

	<!-- Start footer -->
	<!-- End Footer -->

	<!-- JS -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.migrate.js"></script>
	<script src="scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
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
