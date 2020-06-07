
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>京淘登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/sign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
		function submit(){
	        $.ajax({
	            type: "POST",
	            url:"${pageContext.request.contextPath }/login/valid",
	            data:{'username':$(".username").val()
	            ,'password':$(".password").val()},
	         	success:function(msg){
	            	 console.log(msg);
	          		if(msg=="error")
	                	$(".error").html("用户名或密码错误，请重新输入");
	          		else
	          			/* 转发页面 */
	          			$(window).attr("location",msg);
	          		}
	             
	        });
	    }
		
	  // 文档就绪
	    $(function(){
	    	//回车键也可以提交
	     	$(window).keydown(function(event){
	    		  if(event.keyCode==13) {
	    			  submit();
	    		  }
	    		}); 
			//
	     	$(".sign").click(submit); 
	    });
        
	    
    </script>
</head>
<body>
    <!-- 顶部 -->
    <div class="topframe">
        <img src="${pageContext.request.contextPath }/imgs/logo.jpg" alt="京淘">
        <span class="line"></span>
        <span class="font">欢迎登录</span>
    </div>
    <!-- 中间 -->
    <div class="middle">
        <img src="${pageContext.request.contextPath }/imgs/show.jpg" alt="中间展示">

        <form class="form" action="javascript:;">
            <h1>登录</h1>
            <br>
            <!-- autocomplete="off"关闭历史提示写入，不然样式会变 -->
            <input autocomplete="off" class="username" type="text" name="username" placeholder="用户名/已验证手机">
            <br>
            <input autocomplete="off" class="password" type="password" name="password" placeholder="密码">

            <br>
            <!-- <input class="sign" type="button" value="登录" ></input> -->
            <a class="sign" href="javascript:;" >登录</a>
            
            <!--验证错误  -->
            <span class="error"></span>
            <a class="fword" href="#">忘记密码？</a>
            <a class="fword" href="${pageContext.request.contextPath }/regist">立即注册</a>
        </form>
		
    </div>
    <!-- footer start -->
	<div id="footer">
		<p>
			关于我们 |
			联系我们 |
			人才招聘 |
			商家入驻 |
			营销中心 |
			手机京淘 |
			友情连接 |
			销售联盟 |
			京淘社区 |
			京淘公益 |
			English Site<br>
			Copyright © 2015 - 2019 京淘jingtao.com 版权所有
		</p>
	</div>
	<!-- footer end -->
</body>
</html>