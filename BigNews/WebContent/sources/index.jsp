<%@ page language="java" import="java.util.*" import="com.entity.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=request.getContextPath()%>/sources/">
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
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				if(${requestScope.success != null}){
					alert("注册成功！\n账号："+${sessionScope.user.id});
				}
			})
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
												<a href="../NewsServlet?news_id=1544328755">
													<img src="https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB16bRbU.img?h=746&w=1119&m=6&q=60&o=f&l=f" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:00:49</div>
													<div class="category"><a href="#">politics</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=1544328755">新冠初期的人类困惑</a></h2>
												<p>据Worldometer世界实时统计数据显示，截至北京时间7月1日6时，全球累计确诊已达1055万例，累计死亡超51.2万例。针对当前全球疫情的发展态势，当地时间6月28日，《纽约时报》报道指出，科学家们一直在努力发现证据并提出警示，但西方各国的卫生官员却一再继续推行存在误导和矛盾的政策，这导致新冠病毒在全球迅速且持续的蔓延。他们对于新证据的抗拒，致使多国在抗击新冠疫情的反应上有些迟缓。</p>
												<footer>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=1544328755">
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
												<a href="../NewsServlet?news_id=1965539502">
													<img src="https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB16bLZp.img?h=546&w=874&m=6&q=60&o=f&l=f&x=1999&y=318" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">2020-07-01 15:31:21</div>
													<div class="category"><a href="#">sports</a></div>
												</div>
												<h2><a href="../NewsServlet?news_id=1965539502">2020中超联赛将于7月25日开赛</a></h2>
												<p>新华社北京7月1日电（记者公兵、蔡拥军、王恒志）中国足协官网1日发布消息称，2020中国平安中超联赛将于7月25日开赛。</p>
												<footer>
													<a href="#" class="love"><i class="ion-android-favorite-outline"></i></a>
													<a class="btn btn-primary more" href="../NewsServlet?news_id=1965539502">
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
										<a href="../NewsServlet?news_id=1989369336">
											<img src="http://www.cnr.cn/newscenter/native/gd/20200131/W020200131538980817495.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">politics</a>
											</div>
											<div class="time">2020-07-01 16:10:02</div>
										</div>
										<h1><a href="../NewsServlet?news_id=1989369336">【央视快评】必须全面落实联防联控措施</a></h1>
										<p>
											“基层党组织和广大党员要发挥战斗堡垒作用和先锋模范作用，广泛动员群众、组织群众、凝聚群众，全面落实联防联控措施，构筑群防群治的严密防线。”习近平总书记日前作出的重要指示，对做好疫情防控工作再次提出明确要求，为我们坚定信心、群策群力打赢疫情防控阻击战指明了方向和路径。
										</p>
										<footer>
											<a class="btn btn-primary more" href="../NewsServlet?news_id=1989369336">
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
