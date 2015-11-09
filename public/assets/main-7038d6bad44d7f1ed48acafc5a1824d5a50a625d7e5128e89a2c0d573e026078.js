$(function(){
	var w_height = $(window).height();
	//$("body").css({height:$("body").height() > w_height ? $("body").height() : w_height});
	$("#shortcutBtn").css({top:w_height-346});
	$('#shortcutBtn').affix({
	  offset: {
		top: w_height-346
	  }
	});
	//视频轮播右侧
	function vedioRightSlide(){
		var con_height = $(".right-bar .right-bar-con .con").height();
		$(".right-bar .right-bar-con").css({height:(con_height+10)*2});
	}
	var ri = 0;
	$(".right-bar .right-bar-move .con").click(function(){
		$(this).addClass("on").siblings().removeClass("on");
	});
	$(".right-bar .top").click(function(){
		if(ri <= 0) return;
		ri--;
		var con_height = $(".right-bar .con").height() + 10;
		$(".right-bar .right-bar-move").animate({marginTop:-con_height*ri})
	});
	$(".right-bar .bottom").click(function(){
		if(ri > $(".right-bar .con").size()-3) return;
		ri++;
		var con_height = $(".right-bar .con").height() + 10;
		$(".right-bar .right-bar-move").animate({marginTop:-con_height*ri})
	});
	//视频轮播下
	function vedioSlideInit(){
		var bar_width = $(".vedio-slide .vedio-bar").width();
		var con_size = $(".vedio-slide .vedio-bar .con").size();
		if($('body').width() > 768){
			$(".vedio-slide .bar-move .con").css({width:(bar_width/4-20)});
			$(".vedio-slide .bar-move").css({width:con_size*bar_width/4});
		}else{
			$(".vedio-slide .bar-move .con").css({width:(bar_width/2-10)});
			$(".vedio-slide .bar-move").css({width:con_size*bar_width/2});
		}
		$(".vedio-slide .vedio-bar").css({height:$(".vedio-bar .con").height()});
	}
	$(".vedio-slide .bar-move .con").click(function(){
		$(this).addClass("on").siblings().removeClass("on")
	});
	var i = 0;
	$(".vedio-slide .prev").click(function(){
		if(i <= 0) return;
		i--;
		var bar_width = $(".vedio-slide .bar-move").width();
		var con_width = $('body').width() > 768 ? ($(".vedio-slide .bar-move .con").width()+20) : ($(".vedio-slide .bar-move .con").width()+10);
		$(".vedio-slide .bar-move").animate({marginLeft:-con_width*i})
	});
	$(".vedio-slide .next").click(function(){
		if($('body').width() > 768){
			if(i > $(".vedio-slide .vedio-bar .con").size()-5) return;
		}else{
			if(i > $(".vedio-slide .vedio-bar .con").size()-3) return;
		}
		i++;
		var bar_width = $(".vedio-slide .bar-move").width();
		var con_width = $('body').width() > 768 ? ($(".vedio-slide .bar-move .con").width()+20) : ($(".vedio-slide .bar-move .con").width()+10);
		$(".vedio-slide .bar-move").animate({marginLeft:-con_width*i})
	});
	//效果体验
	function tiyanSlideInit(){
		var bar_width = $(".tiyan-slide .tiyan-bar").width();
		var con_size = $(".tiyan-slide .tiyan-bar .con").size();
		if($('body').width() > 768){
			$(".tiyan-slide .bar-move .con").css({width:(bar_width/5-20)});
			$(".tiyan-slide .bar-move").css({width:con_size*bar_width/5});
		}else{
			$(".tiyan-slide .bar-move .con").css({width:(bar_width/2-10)});
			$(".tiyan-slide .bar-move").css({width:con_size*bar_width/2});
		}
		$(".tiyan-slide .tiyan-bar").css({height:$(".tiyan-bar .con").height()});
	}
	$(".tiyan-slide .bar-move .con").click(function(){
		$(this).addClass("on").siblings().removeClass("on")
	});
	var si = 0;
	$(".tiyan-slide .prev").click(function(){
		if(si <= 0) return;
		si--;
		var bar_width = $(".tiyan-slide .bar-move").width();
		var con_width = $('body').width() > 768 ? ($(".tiyan-slide .bar-move .con").width()+20) : ($(".tiyan-slide .bar-move .con").width()+10);
		$(".tiyan-slide .bar-move").animate({marginLeft:-con_width*si})
	});
	$(".tiyan-slide .next").click(function(){
		if($('body').width() > 768){
			if(si > $(".tiyan-slide .tiyan-bar .con").size()-6) return;
		}else{
			if(si > $(".tiyan-slide .tiyan-bar .con").size()-3) return;
		}
		si++;
		var bar_width = $(".tiyan-slide .bar-move").width();
		var con_width = $('body').width() > 768 ? ($(".tiyan-slide .bar-move .con").width()+20) : ($(".tiyan-slide .bar-move .con").width()+10);
		$(".tiyan-slide .bar-move").animate({marginLeft:-con_width*si})
	});
	//体验轮播右侧
	function tiyanRightSlide(){
		var con_height = $(".tiyan-right-bar .right-bar-con .con").height();
		$(".tiyan-right-bar .right-bar-con").css({height:(con_height)*4});
	}
	var ai = 0;
	$(".tiyan-right-bar .right-bar-move .con").click(function(){
		$(this).addClass("on").siblings().removeClass("on");
	});
	$(".tiyan-right-bar .top").click(function(){
		if(ai <= 0) return;
		ai--;
		var con_height = $(".tiyan-right-bar .con").height();
		$(".right-bar-move").animate({marginTop:-con_height*ai})
	});
	$(".tiyan-right-bar .bottom").click(function(){
		if(ai > $(".tiyan-right-bar  .con").size()-5) return;
		ai++;
		var con_height = $(".tiyan-right-bar  .con").height();
		$(".tiyan-right-bar  .right-bar-move").animate({marginTop:-con_height*ai})
	});
	function liHeight(){
		if($(window).width() >= 992){
			$(".identify-list li").each(function(){
				var h = $(this).height();
				$(this).find(".title").css({height:h});
			});
		}
	}
	//页面初始resize判断
	$(window).on("resize", function (e) {
		if($(window).width()>992){
			$("body").addClass("ok");
		}else{
			$("body").removeClass("ok");
		}
		$("#index-banner .item").css("background-image", function (i, v) {
			var url = $(window).width() >= 768 ? $(this).attr("data-big-img") : $(this).attr("data-small-img");
			return "url(" + url + ")";
		});
		$("#second-banner").css("background-image", function (i, v) {
			var url = $(window).width() >= 768 ? $(this).attr("data-big-img") : $(this).attr("data-small-img");
			return "url(" + url + ")";
		});
		liHeight();
		vedioSlideInit();
		vedioRightSlide();
		tiyanSlideInit();
		tiyanRightSlide();
	}).trigger("resize");
	/*
	*页面事件
	*如需添加事件请按照下列代码规范，包装代码清晰整洁
	*/
	$(document)
	//首页轮播图
	.on("swipeleft", "#index-banner", function (e) {
		$(this).carousel('next');
		return false;
	})
	.on("swiperight", "#index-banner", function (e) {
		$(this).carousel('prev');
		return false;
	})
	//热点新闻轮播图
	.on("swipeleft", "#carousel-slide", function (e) {
		$(this).carousel('next');
		return false;
	})
	.on("swiperight", "#carousel-slide", function (e) {
		$(this).carousel('prev');
		return false;
	})
	//回到顶部
	.on("click","#go-top",function(){
		$('body,html').animate({scrollTop:0},500);
		return false; 
	})
	//意见反馈
	.on('click',".type li",function(){
		$(this).addClass("on").siblings().removeClass("on");
	})
	//搜索弹层
	.on('click','.searchBtn',function(){
		if($("body").hasClass('ok')){
			$("#shortcutBtn .menu-search").click();
		}else{
			$(this).toggleClass("on");
			$("#search-con").slideToggle();
		}
	})
	//wap导航展开
	.on("touchstart",".nav-link > li > a",function(){
		if($(this).has('dl')){
			$(this).toggleClass("on");
			$(this).next('dl').slideToggle();
		}
	})
	//wap导航打开
	.on("click",".top-link .wap-menu",function(){
		$("body").addClass("slide-show");
		$(".pop-bg").css({"z-index":1001}).show();
	})
	//wap导航关闭
	.on("touchstart","#slide-nav .menu-close",function(){
		$("body").removeClass("slide-show");
		$(".pop-bg").hide();
	})
	//右侧快捷功能打开
	.on("click","#shortcutBtn .menu a",function(){
		var i = $(this).index();
		$("#shortcutBtn").css({"z-index":2000,"height":600});
		$(".pop-bg").css({"z-index":1001}).show();
		$(this).addClass("on").siblings().removeClass("on");
		$("#shortcutBtn").stop().animate({right:0});
		$("#shortcutBtn .main .con").eq(i).stop().animate({left:0}).siblings().stop().animate({left:'100%'});
	})
	//右侧快捷功能关闭
	.on("click","#shortcutBtn .main .close",function(){
		$("#shortcutBtn .main .con").stop().animate({left:'100%'});
		$("#shortcutBtn").stop().animate({right:'-420px'},function(){
			$("#shortcutBtn").css({"height":146});
		});
		$(".pop-bg").hide();
		$("#shortcutBtn .menu a").removeClass("on");
	})
	//右侧搜索选项切换
	.on("click","#shortcutBtn .choose",function(){
		var data = $(this).attr('data');
		if(data == 'cp'){
			$(this).find(".cp").fadeOut();
			$(this).find(".xw").fadeIn();
			$(this).find("i").css({left:8,'background-color':'#2181da'});
			$(this).attr({data:'xw'});
			$(this).css({'background-color':'#4aa8ff '})
		}else if(data == 'xw'){
			$(this).find(".cp").fadeIn();
			$(this).find(".xw").fadeOut();
			$(this).find("i").css({left:63,'background-color':'#4aa8ff'});
			$(this).attr({data:'cp'});
			$(this).css({'background-color':'#2181da '})
		}
	})
	//事业部首页触摸效果
	.on("mouseenter",".in-con .img",function(){
		$(this).find(".icon").stop().fadeIn();
	})
	.on("mouseleave",".in-con .img",function(){
		$(this).find(".icon").stop().fadeOut();
	})
	//首页企业触摸效果
	.on("mouseenter ","#company .clink",function(){
		$(this).find(".chover").stop().fadeIn();
	})
	.on("mouseleave","#company .clink",function(){
		$(this).find(".chover").stop().fadeOut();
	})
	//导航二分类
	.on("mouseenter",".screen-list li",function(){
		var i = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$(this).parents(".screen-list").find(".screen-slide").eq(i).show().siblings(".screen-slide").hide();
	})
	//分类导航
	.on("mouseenter",".nav-classify > li",function(){
		$(".pop-bg").css({"z-index":100});
		$("#shortcutBtn").css({"z-index":99});
		if($("body").hasClass("ok")){
			$(this).addClass("active").siblings().removeClass("on");
			$(".pop-bg").show();
			$(this).find(".classify-con").slideDown();
		}
	})
	.on("mouseleave ",".nav-classify > li",function(){
		if($("body").hasClass("ok")){
			$(this).removeClass("active");
			$(".pop-bg").hide();
			$(this).find(".classify-con").hide();
		}
	})
	//视频轮播手势
	.on("swipeleft", ".vedio-slide", function (e) {
		$(".vedio-slide .next").click();
		return false;
	})
	.on("swiperight", ".vedio-slide", function (e) {
		$(".vedio-slide .prev").click();
		return false;
	})
	//企业文化轮播
	.on("swipeleft", "#culture-item-slide", function (e) {
		$(this).carousel('next');
		return false;
	})
	.on("swiperight", "#culture-item-slide", function (e) {
		$(this).carousel('prev');
		return false;
	})
	//招商加盟
	.on('click',".zs-group h3.t",function(){
		$(this).toggleClass("on");
		$(this).next(".zs-con").slideToggle();
	})
	//装修面积
	.on('click','.type-tab li',function(){
		var i =$(this).index();
		$(".tab-con li").eq(i).addClass("on").siblings().removeClass("on");
	})
	//体验上
	.on("swipeleft", ".tiyan-slide", function (e) {
		$(".tiyan-slide .next").click();
		return false;
	})
	.on("swiperight", ".tiyan-slide", function (e) {
		$(".tiyan-slide .prev").click();
		return false;
	})
})
