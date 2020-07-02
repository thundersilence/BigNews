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
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">

	$(function(){
		$.post("../StarServlet",{"action":"sel","user_id":${sessionScope.user.id},"news_id":${sessionScope.news.id}},function(data){
			//alert(data.start);//true/false
			if(data.start=="true"){
				$("#loveimgid").attr("src","images/hx.jpg");
				
			}else{
				$("#loveimgid").attr("src","images/hx2.jpg");
			}
			
		},"json");
		
	});
	
	$(function(){
		var list1=$(".replyform1");
		for(var i=0;i<list1.length;i++){
			list1[i].style.display = "none";
		}
		var list2=$(".replyform2");
		for(var i=0;i<list2.length;i++){
			list2[i].style.display = "none";
		}
	});
	

	//add
	function addLove(){
		$.post("../StarServlet",{"action":"add","user_id":${sessionScope.user.id},"news_id":${sessionScope.news.id}});
		//用dom操作向标签中添加红心
		$("#loveimgid").attr("src","images/hx.jpg");
	}
	//del
	function delLove(){
		$.post("../StarServlet",{"action":"del","user_id":${sessionScope.user.id},"news_id":${sessionScope.news.id}});
		//用dom操作向标签中添加黑心
		$("#loveimgid").attr("src","images/hx2.jpg");
		
	}
	
	//pageUserClick
	function checkClick(){
		var imgValue = $("#loveimgid").attr("src");
		if(imgValue=="images/hx.jpg"){
			delLove();
		}else{
			addLove();
		}
	}

</script>
<script type="text/javascript">
	 /*
	function star() {
		//alert("进入js函数");
		//alert(clist);
		var news_id = ${sessionScope.news.id};
		var user_id = ${sessionScope.user.id};
		//var user_id = 120;
		var status = ${sessionScope.status};
		alert("收藏状态status为 "+status);
		if(status==0){
			alert("新闻id：" + news_id + " 用户id：" + user_id);
			$.get("../StarServlet?caozuo=on", {
				"news_id" : news_id,
				"user_id" : user_id
			});
			alert("用户："+user_id+"成功添加收藏新闻："+nwes_id);
		}
		else if(status==1){
			alert("新闻id：" + news_id + " 用户id：" + user_id);
			$.get("../StarServlet?caozuo=off", {
				"news_id" : news_id,
				"user_id" : user_id
			});
			alert("用户："+user_id+"成功删除收藏新闻："+nwes_id);
		}

	}
	
	function cancelstar() {
		alert("进入js函数")
		var news_id = ${sessionScope.news.id};
		var user_id = ${sessionScope.user.id};
		//var user_id = 120;
		alert("新闻id：" + news_id + " 用户id：" + user_id);
		$.get("../StarServlet?caozuo=off", {
			"news_id" : news_id,
			"user_id" : user_id
		});

		alert("done");
	}
	*/
	function showreply1(index){
		//alert("comment_id:"+comment_id+"target_user_id:"+target_user_id+"target_reply_id:"+target_reply_id+"type:"+type);
		//console.log(user_id);
		var list=$(".replyform1");
		for(var i=0;i<list.length;i++){
			list[i].style.display = "none";
		}
		var list=$(".replyform1");
		list[index].style.display = "block";
	}
	function showreply2(index){
		//alert("comment_id:"+comment_id+"target_user_id:"+target_user_id+"target_reply_id:"+target_reply_id+"type:"+type);
		//console.log(user_id);
		var list=$(".replyform2");
		for(var i=0;i<list.length;i++){
			list[i].style.display = "none";
		}
		var list=$(".replyform2");
		list[index].style.display = "block";
	}
	
	
	
</script>
<body class="skin-orange">
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="index.jsp"> <img src="images/logo.png"
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
						</form>
					</div>
					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="register.jsp"><i class="ion-person-add"></i>
									<div>注册</div></a></li>
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
						<li><a href="index.jsp">主页</a></li>
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
						<li><a href="index.jsp">主页</a></li>
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
							<a href="javascript:;" onclick="checkClick()" class="love">
								<img alt="" src="images/hx2.jpg" id="loveimgid">
								</a>
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
							<c:forEach items="${sessionScope.commentList}" var="comment" varStatus="status1">
								<%--单个评论开始 --%>
								<div class="item">
									<div class="user">
										<figure>
											<%--根据user来找headimg ${comment.user.img}--%>
											<img src="${comment.user.img}">
										</figure>
										<div class="details">
											<h5 class="name">用户名: ${comment.user.name }</h5>
											<div class="description">评论${comment.content }</div>
											<a href="javascript:;" onclick="showreply1(${status1.index})">回复</a>
											<form action="../ReplyServlet?comment_id=${comment.id }&target_user_id=${comment.user.id }&target_reply_id=0&type=0" method="post"
												class="replyform1">
												<div class="col-md-12">
													<h3 class="title">回复：@${comment.user.name}</h3>
												</div>
												<div class="form-group col-md-12">
													<textarea class="form-control" name="reply_message"
														placeholder="书写回复..."></textarea>
												</div>
												<div class="form-group col-md-12">
													<button class="btn btn-primary" type="submit">发送回复</button>
												</div>
											</form>
										</div>
									</div>
									<div class="回复-list">
										<%--第一层回复，回复评论的 ,遍历replylist，判断元素reply中的type属性，为回复评论的则显示.begin="1" end="2"--%>
										<c:forEach items="${comment.replyList}" var="reply" varStatus="status2">
												<div class="item">
													<div class="user">
														<figure>
															<%--根据user来找headimg ${reply0.user.img}--%>
															<img src="${reply.user.img}">
														</figure>
														<div class="details">
															<h5 class="name">用户名:${reply.user.name }</h5>
															<div class="time">${reply.time }<span style="color:#F00;"> @${reply.user.name }</span></div>
															<div class="description">评论的回复${reply.content }</div>
													<a href="javascript:;" onclick="showreply2(${status2.index})">回复</a>
															<form action="../ReplyServlet?comment_id=${comment.id }&target_user_id=${reply.user.id }&target_reply_id=${reply.id }&type=1" method="post"
																class="replyform2">
																<div class="col-md-12">
																	<h3 class="title">回复：@${comment.user.name}</h3>
																</div>
																<div class="form-group col-md-12">
																	<textarea class="form-control" name="reply_message"
																		placeholder="书写回复..."></textarea>
																</div>
																<div class="form-group col-md-12">
																	<button class="btn btn-primary" type="submit">发送回复</button>
																</div>
															</form>
														</div>
													</div>
													<div class="回复-list">
													</div>
												</div>
										</c:forEach>
									</div>

								</div>
								<%--单个评论结束 --%>
							</c:forEach>
						</div>
						<!-- 用户登录时显示 /CommentServlet?news_id=${sessionScope.news.id }-->
						<c:if test="true">
							<form action="../CommentServlet?news_id=${sessionScope.news.id }"
								method="post">
								<div class="col-md-12">
									<h3 class="title">留下你的评论</h3>
								</div>
								<div class="form-group col-md-12">
									<label for="message">评论 <span class="required"></span></label>
									<textarea class="form-control" name="comment_message"
										placeholder="书写评论..."></textarea>
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-primary" type="submit">发送评论</button>
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
	<script src="js/e-magz.js"></script>
	<script>
	/*
	var list=$(".replyform");

	for(var i=0;i<list.length;i++){
		list[i].style.display = "none";
	}
	*/
	</script>
</body>
</html>
