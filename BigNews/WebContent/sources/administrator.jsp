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
	
	<!-- js消去noticeBar空间 -->
	<script type="text/javascript">
		window.onload=function(){
			if("${applicationScope.notice}" == ""){
				document.getElementById("noticeBar").style.display="none";
			}
		}
	</script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
		function leave(){
			$.get("../leave");
			$("#regester").append("<li><a href=\"login.jsp\" id=\"login\"><i class=\"ion-person\"></i><div>登录</div></a></li>");
			$("#leave").remove();
			$("#seeuser").remove();
			alert("再见！");
		}
		</script>
</head>
<body>
	<header class="primary">
		<marquee id="noticeBar" behavior="scroll" direction="right" bgcolor="#FFD700" scrollamount="10">
			${applicationScope.notice}
		</marquee>
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
								<li><a href="register.jsp" id="regester"><i class="ion-person-add"></i><div>注册</div></a></li>
								<c:if test="${sessionScope.user.name != null}">
									<li><a href="userDisplay.jsp?in=yes" id="seeuser"><i class="ion-person"></i>
										<div>${sessionScope.user.name}</div></a>
									</li>
									<li><a href="javascript:;" onclick="leave()" id="leave"><i class="ion-person"></i>
										<div>注销</div></a>
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
	<section class="search">
		<div class="container">
			<div class="row">
			
				<!-- 侧边栏start -->
				<div class="col-md-3">
					<aside>
						<h1><a href="addNews.jsp" class="titlefont">>添加新闻</a></h1>
					</aside>
					<aside>
						<h1><a href="../record" class="titlefont">>查看日志</a></h1>
					</aside>
					<aside>
						<div class="aside-body">
							<form action="../addNotice" method="post">
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
							<form action="../secret" method="post">
								<input type="text" name="newskey" value="${sessionScope.newskey}" class="form-control" 
									style="width:75%;display:inline">
								<button class="btn btn-primary buttom"><i class="ion-search"></i></button>
							</form>
						</article>
						
						<!-- news列表循环start -->
						<c:forEach items="${sessionScope.cNewsList}" var="news">
						<article class="col-md-12 article-list">
							<div class="inner">
								<figure id="simplefigure">
									<a href="../NewsServlet?news_id=${news.id}">
										<img src="${news.pictureURL}" class="simpleimage">
									</a>
								</figure>
								<div class="details" id="simcontent">
									<div class="category">
										<a href="#">${news.type}</a>
									</div>
									<time>${news.time}</time>
									<h1><a href="../NewsServlet?news_id=${news.id}">${news.name}</a></h1>
									<div id="bottom">
										<a class="btn btn-primary more" href="../NewsServlet?news_id=${news.id}">
											<div>查看</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
										<a class="btn btn-primary more" href="../updateNews?id=${news.id}">
											<div>编辑</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
										<a class="btn btn-primary more" href="../deleteNews?id=${news.id}">
											<div>删除</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
									</div>
								</div>
							</div>
						</article>
						</c:forEach>
						<!-- 循环end -->
						
						
						<div class="col-md-12 text-center">
							<ul class="pagination" id="pages">
							
								<!--上一页-->
								<c:if test="${requestScope.newsPage >= 2}">
									<li class="prev">
										<a href="../secret?newspage=${requestScope.newsPage - 1}"><i class="ion-ios-arrow-left"></i></a>
									</li>
								</c:if>
								<c:if test="${requestScope.newsPage == 1}">
									<li class="prev">
										<a href="../secret?newspage=${requestScope.newsPage}"><i class="ion-ios-arrow-left"></i></a>
									</li>
								</c:if>
	
								<!-- 当前页 -->
								<c:if test="${requestScope.newsTotal <= 9 && requestScope.newsTotal>0}">
									<c:forEach var="x" begin="1" end="${requestScope.newsTotal}">
										<li><a href="../secret?newspage=${x}">${x}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${requestScope.newsTotal >= 10}">
									<li><a href="../secret?newspage=1">1</a></li>

									<c:if test="${requestScope.newsPage <=4}">
										<li><a href=""../secret?newspage=2">2</a></li>
										<li><a href=""../secret?newspage=3">3</a></li>
										<li><a href=""../secret?newspage=4">4</a></li>
										<li><a href=""../secret?newspage=5">5</a></li>
										<li><a href=""../secret?newspage=6">6</a></li>
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
									</c:if>

									<c:if
										test="${(requestScope.newsPage>=5)&&(requestScope.newsPage<=requestScope.newsTotal-6)}">
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
										<li><a
											href="../secret?newspage=${requestScope.newsPage-2}">${requestScope.newsPage-2}</a></li>
										<li><a
											href="../secret?newspage=${requestScope.newsPage-1}">${requestScope.newsPage-1}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsPage}">${requestScope.newsPage}</a></li>
										<li><a
											href="../secret?newspage=${requestScope.newsPage+1}">${requestScope.newsPage+1}</a></li>
										<li><a
											href="../secret?newspage=${requestScope.newsPage+2}">${requestScope.newsPage+2}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
									</c:if>

									<c:if test="${requestScope.newsPage >= requestScope.newsTotal-2}">
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
										<li><a href="../secret?newspage=${requestScope.newsPage}">...</a></li>
										<li><a href="../secret?newspage=${requestScope.newsTotal-5}">${requestScope.newsTotal-6}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsTotal-4}">${requestScope.newsTotal-5}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsTotal-3}">${requestScope.newsTotal-4}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsTotal-2}">${requestScope.newsTotal-3}</a></li>
										<li><a href="../secret?newspage=${requestScope.newsTotal-1}">${requestScope.newsTotal-2}</a></li>
									</c:if>

									<li><a href="../secret?newspage=${requestScope.newsTotal}">${requestScope.newsTotal}</a></li>
								</c:if>
								
								<!--下一页-->
								<c:if test="${requestScope.newsPage < requestScope.newsTotal}">
									<li class="next">
										<a href="../secret?newspage=${requestScope.newsPage + 1}"><i class="ion-ios-arrow-right"></i></a>
									</li>
								</c:if>
								<c:if test="${requestScope.newsPage == requestScope.newsTotal}">
									<li class="next">
										<a href="../secret?newspage=${requestScope.newsPage}"><i class="ion-ios-arrow-right"></i></a>
									</li>
								</c:if>
							
							</ul>
						</div>




					</div>
				</div>
				<!-- 新闻列表end -->
				
				
				<!-- 用户列表start -->
				<div class="col-md-3">
					<div class="row">
						
						<!-- user搜索框 -->
						<article class="col-md-12 article-list">
							<form action="../secret" method="post">
								<input type="text" name="userkey" value="${sessionScope.userkey}" class="form-control" style="width:75%;display:inline">
								<button class="btn btn-primary buttom"><i class="ion-search"></i></button>
							</form>
						</article>
						
						<!-- user列表循环start -->
						<c:forEach items="${sessionScope.cUserList}" var="user">
						<article class="col-md-12 article-list">
							<div class="inner">
								<div class="details" id="user">
									<a href="javascript:;" id="leftdiv">
										<div id="titlefont">${user.name}</div>
										<div id="titlefont">${user.id}</div>
									</a>
									<span id="rightdiv" style="bottom:0; right:0;position:absolute;">
										<a class="btn btn-primary more" href="../deleteUser?id=${user.id}">
											<div>删除</div>
											<div><i class="ion-ios-arrow-thin-right"></i></div>
										</a>
									<span>
								</div>
							</div>
						</article>
						</c:forEach>
						<!-- 循环end -->
						
						
						
						<div class="col-md-12 text-center">
							<ul class="pagination" id="pages">
							
								<!--上一页-->
								<c:if test="${requestScope.userPage >= 2}">
									<li class="prev">
										<a href="../secret?userpage=${requestScope.userPage - 1}"><i class="ion-ios-arrow-left"></i></a>
									</li>
								</c:if>
								<c:if test="${requestScope.userPage == 1}">
									<li class="prev">
										<a href="../secret?userpage=${requestScope.userPage}"><i class="ion-ios-arrow-left"></i></a>
									</li>
								</c:if>
	
								<!-- 当前页 -->
								<c:if test="${requestScope.userTotal <= 9}">
									<c:forEach var="x" begin="1" end="${requestScope.userTotal}">
										<li><a href="../secret?userpage=${x}">${x}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${requestScope.userTotal >= 10}">
									<li><a href="../secret?userpage=1">1</a></li>

									<c:if test="${requestScope.userPage <=4}">
										<li><a href=""../secret?userpage=2">2</a></li>
										<li><a href=""../secret?userpage=3">3</a></li>
										<li><a href=""../secret?userpage=4">4</a></li>
										<li><a href=""../secret?userpage=5">5</a></li>
										<li><a href=""../secret?userpage=6">6</a></li>
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
									</c:if>

									<c:if
										test="${(requestScope.userPage>=5)&&(requestScope.userPage<=requestScope.userTotal-6)}">
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
										<li><a
											href="../secret?userpage=${requestScope.userPage-2}">${requestScope.userPage-2}</a></li>
										<li><a
											href="../secret?userpage=${requestScope.userPage-1}">${requestScope.userPage-1}</a></li>
										<li><a href="../secret?userpage=${requestScope.userPage}">${requestScope.userPage}</a></li>
										<li><a
											href="../secret?userpage=${requestScope.userPage+1}">${requestScope.userPage+1}</a></li>
										<li><a
											href="../secret?userpage=${requestScope.userPage+2}">${requestScope.userPage+2}</a></li>
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
									</c:if>

									<c:if test="${requestScope.userPage >= requestScope.userTotal-3}">
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
										<li><a href="../secret?userpage=${requestScope.userPage}">...</a></li>
										<li><a href="../secret?userpage=${requestScope.userTotal-5}">${requestScope.userTotal-6}</a></li>
										<li><a href="../secret?userpage=${requestScope.userTotal-4}">${requestScope.userTotal-5}</a></li>
										<li><a href="../secret?userpage=${requestScope.userTotal-3}">${requestScope.userTotal-4}</a></li>
										<li><a href="../secret?userpage=${requestScope.userTotal-2}">${requestScope.userTotal-3}</a></li>
										<li><a href="../secret?userpage=${requestScope.userTotal-1}">${requestScope.userTotal-2}</a></li>
									</c:if>

									<li><a href="../secret?userpage=${requestScope.userTotal}">${requestScope.userTotal}</a></li>
								</c:if>
								
								<!--下一页-->
								<c:if test="${requestScope.userPage < requestScope.userTotal}">
									<li class="next">
										<a href="../secret?userpage=${requestScope.userPage + 1}"><i class="ion-ios-arrow-right"></i></a>
									</li>
								</c:if>
								<c:if test="${requestScope.userPage == requestScope.userTotal}">
									<li class="next">
										<a href="../secret?userpage=${requestScope.userPage}"><i class="ion-ios-arrow-right"></i></a>
									</li>
								</c:if>
							
							</ul>
						</div>
						
						
						
						
						
						
						
						
						
						
					</div>
				</div>
				<!-- 用户列表end -->
				
			</div>
		</div>
	</section>
</body>
</html>