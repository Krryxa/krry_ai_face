<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>人脸识别-深度学习技术实战应用 - krry</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">

		<style type="text/css">
			*{margin:0;padding:0;}
			body{font-size:12px;font-family:"微软雅黑";color:#666;}
			img{border:none;}

			/*top start*/
			.top{width:100%;height:59px;background:#000;}
			.top .t-header{width:90%;height:59px;margin:0 auto;}
			.top .t-header .t-logo{float:left;margin-top:15px;}
			.top .t-header .t-desc{float:right;line-height:59px;font-size:18px;color:#FFF;}
			/*end top*/

			/*banner start*/
			.banner{width:100%;height:315px;background:url("images/banner.png");background-size:cover;padding-top:35px;}
			.banner .b-box{width:980px;height:285px;margin:0 auto;}
			.banner .b-box .b-view{margin-right: 35px;float:left;position:relative;overflow:hidden;border-radius:15px;}
			.banner .b-box .b-now{width:345px;height:282px;float:right;border-radius:15px;position:relative;background:#fff;}
			.banner .b-box .b-now h2{font-size:22px;font-weight:300;text-align:center;line-height:100px;}
			.banner .b-box .b-now .b-desc{font-size:40px;text-align:center;padding-top:40px;color:red;}
			/*end banner*/

			/*footer start*/
			.footer{width:100%;height:332px;background:url("images/footer.png");background-size:cover;}
			.footer .f-box{width:980px;height:332px;margin:0 auto;}
			.footer .f-box h1{font-size:30px;font-weight:300;padding: 100px 0 20px 100px;}
			.footer .f-box p{font-size:16px;padding-left:100px;line-height:30px;}
			/*end footer*/

			.banner .b-box .b-view .b-scan{width:100%;height:100%;background:url("images/intro.png");position:absolute;background-size:cover;}

		</style>

	</head>
<body>

	<!--top start-->
	<div class="top">
		<div class="t-header">
			<div class="t-logo">
				<a href="#">
					<img src="images/logo.png" alt="百度AI" width="173" height="25" />
				</a>
			</div>
			<div class="t-desc">人脸识别-深度学习技术实战应用</div>
		</div>
	</div>
	<!--end top-->

	<!--banner start-->
	<div class="banner">
		<div class="b-box">
			<div class="b-view b1">
				<img src="images/2.jpg" alt="示例图" width="253" id="b_img1" />
				<div class="b-scan bb1"></div>
			</div>
			<div class="b-view b2">
				<img src="images/22.jpg" alt="示例图" width="253" id="b_img2" />
				<div class="b-scan bb2"></div>
			</div>
			<div class="b-now">
				<h2>百度大脑智能鉴别结果：</h2>
				<p class="b-desc"></p>
			</div>
		</div>
	</div>
	<!--end banner-->
	
	<!--footer start-->
	<div class="footer">
		<div class="f-box">
			<h1>色情识别</h1>
			<p>依托全网海量优质数据和深度神经网络技术，<br />智能鉴别色情图片内容，为您的产品保驾护航，远离违规风险</p>
		</div>
	</div>
	<!--end footer-->


<!--引入jQuery官方类库-->
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		 // 初始化扫一扫
		 scan();
		 
		 query();
	
	});
	
	// 请求数据
	function query(){
		var src1 = $("#b_img1").attr("src");
		var src2 = $("#b_img2").attr("src");
		$.ajax({
			type:"post",
			url:"data.jsp",
			data:{"path1":src1,"path2":src2},
			success:function(data){
				$(".b-desc").text(data);
			}
		});
		
	}

	// 图像扫描
	function scan(){
		var box1 = $(".b1");
		$(".bb1").css({"bottom":box1.height()}).animate({bottom:0},2000,function(){
			$(this).css({"bottom":box1.height()});
		});
		var box2 = $(".b2");
		$(".bb2").css({"bottom":box2.height()}).animate({bottom:0},2000,function(){
			$(this).css({"bottom":box2.height()});
		});
	}



</script>

</body>
</html>