<%@ page language="java" import="java.util.*" import="com.entity.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<script type="text/javascript">
		window.onload=function(){
			if("${applicationScope.notice}" == ""){
				document.getElementById("noticeBar").style.display="none";
			}
		}
	</script>
	</head>

	<body class="skin-orange">
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
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
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
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
				</div>
			</nav>
			<!-- End nav -->
		</header>

		<section class="home">
			<div class="container">
				<div class="row">
					
					<div class="col-md-8 col-sm-12 col-xs-12">
					<!--
						<div class="headline">
							
							<div class="nav" id="headline-nav">
								<a class="left carousel-control" role="button" data-slide="prev">
									<span class="ion-ios-arrow-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" role="button" data-slide="next">
									<span class="ion-ios-arrow-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
							<div class="owl-carousel owl-theme" id="headline">							
								<div class="item">
									<a href="#"><div class="badge">Tip!</div> Vestibulum ante ipsum primis in faucibus orci</a>
								</div>
								<div class="item">
									<a href="#">Ut rutrum sodales mauris ut suscipit</a>
								</div>
							</div>
						</div>
					-->
						<div class="owl-carousel owl-theme slide" id="featured">
							<div class="item">
								<article class="featured">
									<div class="overlay"></div>
									<figure>
										<img src="https://c2.hoopchina.com.cn/uploads/star/event/images/200701/077731eca4d49e724433c7e186a70fb68256713f.jpg?x-oss-process=image/resize,w_800/format,webp" alt="Sample Article">
									</figure>
									<div class="details">
										<h1><a href="../NewsServlet?news_id=156857941">丹尼-格林：我期待迎接挑战，成为球队中主要的防守者</a></h1>
										<div class="time">2020-07-01 12:04:08</div>
									</div>
								</article>
							</div>
						</div>
						<div class="line">
							<div>Latest News</div>
						</div>
						
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="row">
									<article class="article col-md-12">
										<div class="inner">
											<figure>
												<a href="../NewsServlet?news_id=128814007">
													<img src="images/news/img10.jpg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:00:49</div>
													<div class="category"><a href="#">science</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=128814007">人工智能AI可帮助人类发挥“群体智慧”</a></h2>
												<p>伍莱说：“我们可以让一些非常聪明的人单独研究问题的不同方面，但是如果我们不协力合作，没有集思广益，就很难取得任何进展。我认为，关键之处是要让人工智能帮助这些单打独斗的工作实现集群化，这样才能解决需要全球集体行动以面对的问题。”</p>
												<footer>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=128814007">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
									<article class="article col-md-12">
										<div class="inner">
											<figure>
												<a href="../NewsServlet?news_id=26779609">
													<img src="http://img3.chinadaily.com.cn/images/202006/28/5ef7d34ea310a85979129523.jpeg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:31:21</div>
													<div class="category"><a href="#">Healthy</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=26779609">所有高考生需做核酸检测吗？北京市教委权威解答来了</a></h2>
												<p>中新网7月1日电 据北京市教育委员会官方微博消息，在6月29日举行的北京市新冠肺炎疫情防控工作新闻发布会上，北京市委教育工委副书记、市教委新闻发言人李奕针对广大师生家长们关心的高考疫情防控工作相关问题进行了逐一解答。</p>
												<footer>
													<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>327</div></a>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=26779609">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="row">
									<article class="article col-md-12">
										<div class="inner">
											<figure>                                
												<a href="../NewsServlet?news_id=184241534">
													<img src="https://static01.nyt.com/images/2020/06/15/business/15ALTJPchina-reliance1-print/merlin_172059801_3c4fd5de-da7d-4baf-910e-874f248ed4e4-master1050.jpg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:20:11</div>
													<div class="category"><a href="#">economics</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=184241534">世界与北京“脱钩”不易，全球经济戒中国之瘾恐代价高昂</a></h2>
												<p>中国市场目前也很重要：国际货币基金组织的报告说，中国将是少数几个在2020年实现经济增长的国家之一，而美国经济预计今年将收缩约6%，欧元区将收缩7.5%。高盛(Goldman Sachs)驻东京的首席日本股票策略师凯希·松井(Kathy Matsui)说，在经济面临巨大压力的时候，即便是那些反对中国政治的人也感到，他们需要中国经济来维持繁荣</p>
												<footer>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=184241534">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
									<article class="article col-md-12">
										<div class="inner">
											<figure>
												<a href="../NewsServlet?news_id=248109765">
													<img src="http://img3.chinadaily.com.cn/images/202006/23/5ef14a5ba310a859791256fc.jpeg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:35:10</div>
													<div class="category"><a href="#">politics</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=248109765">我国北斗三号全球卫星导航系统最后一颗组网卫星发射窗口重新确定</a></h2>
												<p>我国北斗三号全球卫星导航系统最后一颗组网卫星发射任务推迟后，发射窗口重新确定为6月23日9时43分。</p>
												<footer>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=248109765">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="body-col vertical-slider" data-max="4" data-nav="#hot-news-nav" data-item="article">
								</div>
							</div>
						</div>

						<div class="line top">
							<div>Just Another News</div>
						</div>
						<div class="row">
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="../NewsServlet?news_id=723588684">
											<img src="https://n.sinaimg.cn/sports/transform/662/w650h812/20200701/a9ae-ivrxcex8766709.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">sports</a>
											</div>
											<div class="time">2020-07-01 15:41:59</div>
										</div>
										<h1><a href="../NewsServlet?news_id=723588684">双骄！现役仅梅罗2人达此恐怖成就 梅西效率稍高</a></h1>
										<p>在现役球员中，他是第二位实现这一成就的球员，第一位是C罗。2019年10月，C罗在葡萄牙对阵乌克兰的欧洲杯预选赛中率先达到了700球里程碑
										</p>
										<footer>
											<a class="btn btn-primary more" href="../NewsServlet?news_id=723588684">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="../NewsServlet?news_id=828732369">
											<img src="https://n.sinaimg.cn/sports/transform/283/w650h433/20200630/04e0-ivrxcex8120720.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">sports</a>
											</div>
											<div class="time">2020-07-01 16:10:02</div>
										</div>
										<h1><a href="../NewsServlet?news_id=828732369">郭艾伦31+9+7乔杨空砍60分 辽篮大胜同曦2连胜</a></h1>
										<p>
											6月30日，复赛后的CBA常规赛进入到第36轮的较量，同曦迎战辽宁队。此役，辽宁打的顺风顺水，节节领先，郭艾伦、梅奥合砍61分，帮助辽宁队120-107击败同曦，夺得换帅后的两连胜。
										</p>
										<footer>
											<a class="btn btn-primary more" href="../NewsServlet?news_id=828732369">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="../NewsServlet?news_id=895470107">
											<img src="https://ichef.bbci.co.uk/news/660/cpsprodpb/D999/production/_113050755_53155657.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
											<a href="#">science</a>
											</div>
											<div class="time">2020-07-01 15:03:05</div>
										</div>
										<h1><a href="../NewsServlet?news_id=895470107">环保知识：绿化并非都好 造林不当“有害”</a></h1>
										<p>
											美国两项最新环保科研结果称，大规模植树造林如果实施不当，不但不能保护环境，反而会带来更多害处。研究项目中包括有中国北部沙漠地带植树工程。
										</p>
										<footer>
											<a class="btn btn-primary more" href="../NewsServlet?news_id=895470107">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="../NewsServlet?news_id=980891735">
											<img src="https://ichef.bbci.co.uk/news/660/cpsprodpb/1400E/production/_113043918_5ecfdaf6-0791-48bc-ad1b-b9ceb95f8e78.png" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">economics</a>
											</div>
											<div class="time">2020-07-01 15:15:59</div>
										</div>
										<h1><a href="../NewsServlet?news_id=980891735">苹果换“芯”：自制芯片全面取代英特尔处理器会带来什么变化</a></h1>
										<p>
											苹果（Apple）公司确认，它的Mac笔记本以及台式个人电脑将会改用苹果自家的ARM架构处理器
										</p>
										<footer>
											<a class="btn btn-primary more" href="../NewsServlet?news_id=980891735">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
						</div>
					</div>
					<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
						<aside>
							<h1 class="aside-title">热点</h1>
							<div class="aside-body">
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1021336708">
												<img src="https://ichef.bbci.co.uk/news/660/cpsprodpb/15B00/production/_113123888_463d65fc-2b41-4d17-98aa-cf437c130076.jpg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1021336708">两情相悦心理学：揭开性吸引的五个秘密</a></h1>
										</div>
									</div>
								</article>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1049627970">
												<img src="https://n.sinaimg.cn/sports/transform/252/w650h402/20200701/e7c5-ivrxcex8685194.jpg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1049627970">西甲-梅西700球 萨乌尔2球 巴萨2度领先2-2平马竞</a></h1>
										</div>
									</div>
								</article>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1115322582">
												<img src="https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-master1050.jpg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1115322582">中国广泛采集男性DNA用于监控</a></h1>
										</div>
									</div>
								</article>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1356863636">
												<img src="https://static01.nyt.com/images/2020/06/29/world/29india-chinese-apps/29india-chinese-apps-master1050-v2.jpg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1356863636">印度封禁TikTok等近60款中国应用程序</a></h1>
										</div>
									</div>
								</article>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1389512440">
												<img src="https://ichef.bbci.co.uk/news/320/cpsprodpb/D0E2/production/_113047435_hi062027247.jpg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1389512440">中印流血冲突会不会在印度引发抵制中国商品浪潮</a></h1>
										</div>
									</div>
								</article>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="../NewsServlet?news_id=1547349140">
												<img src="https://img3.chinadaily.com.cn/images/202007/01/5efbce2da310a8597912cd00.jpeg" alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1><a href="../NewsServlet?news_id=1547349140">《习近平谈治国理政》第三卷中英文版出版发行</a></h1>
										</div>
									</div>
								</article>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</section>

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