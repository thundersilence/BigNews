
<!-- jsp配置 -->

<%@ page language="java" import="java.util.*" import="com.entity.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
		ArrayList<News> newsList = (ArrayList<News>)session.getAttribute("newsList");
		int totalnum = newsList.size();
		int pagesize = 2;
		int currentpage = Integer.parseInt(session.getAttribute("currentpage").toString());
		if(request.getParameter("currentpage")!=null){
			currentpage =Integer.parseInt(request.getParameter("currentpage"));
		}
		int totalpage = totalnum % pagesize == 0 ?(totalnum/pagesize):(totalnum/pagesize+1);
		ArrayList<News> currentlist = new ArrayList<News>();
		if(totalnum>=pagesize){
			for(int i=0;i<pagesize;i++){
				int index =(currentpage-1)*pagesize+i;
				currentlist.add(newsList.get(index));
			}
		}
		else{
			currentlist = newsList;
		}

		session.setAttribute("currentlist", currentlist);
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

<body class="skin-orange" onload="showcurrent()">
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
							<li><a href="register.jsp"><i class="ion-person-add"></i>
									<div>注册</div></a></li>
							<li><a href="login.jsp"><i class="ion-person"></i>
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
	<!--分类页面开始  -->
	<section class="category">
		<div class="container">
			<div class="row">
				<div class="col-md-8 text-left">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><a href="index.html">主页</a></li>
								<li class="active">${sessionScope.category}</li>
							</ol>
							<h1 class="page-title">分类: ${sessionScope.category}</h1>
							<p class="page-subtitle">
								展示所有的 <i>${sessionScope.category}</i> 新闻
							</p>
						</div>
					</div>
					<div class="line"></div>
					<div class="row">
					
						<!-- 循环start -->
						<c:forEach items="${sessionScope.currentlist}" var="news">
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<!--图片包含具体新闻链接,${news.content} ../NewsServlet?news_id=${news.id}-->
										<a href="../NewsServlet?news_id=${news.id}"> <!--里面放url，暂时为网上非本地 ${news.pictureURL}-->
											<img src="${news.pictureURL}">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<!--跳到分类链接，给参数 -->
												<a
													href="../ClassifiedServlet?category=${sessionScope.category}">${sessionScope.category}</a>
											</div>
											<!--新闻时间，是news属性 -->
											<div class="time">${news.time}</div>
										</div>
										<!--跳转至具体展示页面，链接需要传参数新闻id属性，内容填充新闻name -->
										<!--图片包含具体新闻链接,${news.content} ../NewsServlet?news_id=${news.id}-->
										<h1>
											<a href="../NewsServlet?news_id=${news.id}">${news.name}</a>
										</h1>
										<!--显示新闻概要内容，news属性填充 -->
										<p>${news.simple}</p>
										<!-- 收藏按钮之后实现，可以保持用户点击收藏变色，并存入数据库，登录时若收藏有则显示收藏的状态 -->
										<footer>
											<a href="#" class="love"><i
												class="ion-android-favorite-outline"></i>
												<div>237</div></a>
											<!-- 更多按钮跳转至具体新闻页面，链接要带news的id属性 ../NewsServlet?news_id=${news.id} -->
											<a class="btn btn-primary more"
												href="../NewsServlet?news_id=${news.id}">
												<div>更多</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</footer>
									</div>
								</div>
							</article>
						</c:forEach>
						<!-- 循环end -->
						
						<!--分页开始-->
						<div class="col-md-12 text-center">
							<ul class="pagination" id="pages">

								<!--上一页-->
								<c:if test="<%=currentpage>=2 %>">
									<li class="prev"><a
										href="category.jsp?currentpage=<%=currentpage -1 %>"><i
											class="ion-ios-arrow-left"></i></a></li>
								</c:if>
								<c:if test="<%=currentpage==1 %>">
									<li class="prev"><a href="#"><i
											class="ion-ios-arrow-left"></i></a></li>
								</c:if>

								<!--当前页，转移属性-->
								<!-- <li class="active"><a href="category.jsp?currentpage=">${sessionScope.currentpage}</a></li> -->
								<!--自动计算总页数-->
								<c:if test="<%=totalpage <= 8%>">
									<c:forEach var="x" begin="1" end="<%=totalpage%>">
										<li><a href="category.jsp?currentpage=${x}">${x}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="<%=totalpage >= 9%>">
									<li><a href="category.jsp?currentpage=1">1</a></li>

									<c:if test="<%=currentpage <= 4%>">
										<li><a href="category.jsp?currentpage=2">2</a></li>
										<li><a href="category.jsp?currentpage=3">3</a></li>
										<li><a href="category.jsp?currentpage=4">4</a></li>
										<li><a href="category.jsp?currentpage=5">5</a></li>
										<li><a href="category.jsp?currentpage=6">6</a></li>
										<li><a href="#">...</a></li>
										<li><a href="#">...</a></li>
									</c:if>

									<c:if
										test="<%=(currentpage >=5) && (currentpage <= totalpage - 4)%>">
										<li><a href="#">...</a></li>
										<li><a
											href="category.jsp?currentpage=<%=currentpage -2 %>"><%=currentpage -2 %></a></li>
										<li><a
											href="category.jsp?currentpage=<%=currentpage -1 %>"><%=currentpage -1 %></a></li>
										<li><a href="category.jsp?currentpage=<%=currentpage  %>"><%=currentpage  %></a></li>
										<li><a
											href="category.jsp?currentpage=<%=currentpage +1 %>"><%=currentpage +1 %></a></li>
										<li><a
											href="category.jsp?currentpage=<%=currentpage +2 %>"><%=currentpage +2 %></a></li>
										<li><a href="#">...</a></li>
									</c:if>

									<c:if test="<%=currentpage >= totalpage - 3%>">
										<li><a href="#">...</a></li>
										<li><a href="#">...</a></li>
										<li><a href="category.jsp?currentpage=<%=totalpage - 5%>"><%=totalpage - 5%></a></li>
										<li><a href="category.jsp?currentpage=<%=totalpage - 4%>"><%=totalpage - 4%></a></li>
										<li><a href="category.jsp?currentpage=<%=totalpage - 3%>"><%=totalpage - 3%></a></li>
										<li><a href="category.jsp?currentpage=<%=totalpage - 2%>"><%=totalpage - 2%></a></li>
										<li><a href="category.jsp?currentpage=<%=totalpage - 1%>"><%=totalpage - 1%></a></li>
									</c:if>

									<li><a href="category.jsp?currentpage=<%=totalpage%>"><%=totalpage%></a></li>

								</c:if>

								<!--下一页-->
								<c:if test="<%=currentpage < totalpage %>">
									<li class="next"><a
										href="category.jsp?currentpage=<%=currentpage +1 %>"><i
											class="ion-ios-arrow-right"></i></a></li>
								</c:if>
								<c:if test="<%=currentpage == totalpage %>">
									<li class="next"><a href="#"><i
											class="ion-ios-arrow-right"></i></a></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Footer -->
	<script>
	 function showcurrent(){
		var currentpage = <%= currentpage%>;
	    var obj_lis = document.getElementById("pages").getElementsByTagName("li");
	    for(i=0;i<obj_lis.length;i++){
	    	console.log(this.innerHTML);
	            if(this.innerHTML==currentpage){
	            	this.addClass('active');
	            }
	    }
	}
	</script>

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
