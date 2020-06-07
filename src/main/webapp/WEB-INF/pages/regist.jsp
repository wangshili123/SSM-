<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>注册页面</title>
	<!-- 引入CSS样式 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/regist.css"/>
	<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
	<script>
	//点击用户名框后清除报错信息
        $(function(){
            $(".username").click(function(){
                $(".err-regist").text("");
            });
            //注册按键被点击
            $(".submit").click(function(){
            	//先判断两次输入的密码是否一致
            	if($("input[name='password']").val()==$("input[name='repassword']").val())
            	{
            		$.ajax({
        	            type: "POST",
        	            url:"${pageContext.request.contextPath }/login/userRegist",
        	            data:{'username':$(".username").val()
        	            ,'password':$(".password").val()},
        	            scriptCharset: 'utf-8',
        	         	success:function(msg){
        	            	 console.log(msg);
        	            	 $(".err-regist").text(msg);
        	        	}
       	       		});
            	}else{//密码不一致
            		$(".err-regist").text("两次输入的密码不一致");
            	}
                
            });
        });

    </script>
</head>
<body>
	<!-- header-start -->
	<div id="header">
		<div id="line1">
			<image class="logo" src="${pageContext.request.contextPath }/imgs/regist-image/logo_jt.jpg" />
			<span class="line"></span>
			<span class="wel_reg">欢迎注册</span>
		</div>
		<div id="line2">
			<span>已有账号？</span>
			<a  href="index">
				<span class="goindex">请登陆</span>
			</a>
		</div>
	</div>
	<!-- header-end -->

	
	<!-- body-start -->
	<div id="middle">
		<form action="#" method="POST">
		<span class="err-regist"><!-- 用户已存在，请重写尝试其他的用户名 --></span>
			<table id="form_tab">
				<tr>
					<td>
						<input autocomplete="off" class="username" type="text" name="username" placeholder="用户名"/>
						
					</td>
				</tr>
				<tr>
					<td class="err_msg">
						支持中文、字母、数字、“-”、“_”的组合，4-20个字母
					</td>
				</tr>
				<tr>
					<td>
						<input autocomplete="off" class="password" type="text" name="password" placeholder="设置密码"/>
					</td>
				</tr>
				<tr>
					<td class="err_msg">
						建议使用数字、字母和符号两种以上的组合，6-20个字符
					</td>
				</tr>
				<tr>
					<td>
						<input autocomplete="off" class="password" type="text" name="repassword" placeholder="确认密码"/>
					</td>
				</tr>
				<tr>
					<td class="err_msg_alter">
						<!-- 两次密码输入不一致 -->
					</td>
				</tr>
				<tr>
					<td>
						<input autocomplete="off" class="phone" type="text" name="phone" placeholder="验证手机"/>
						<span class="ck_email">
							&nbsp;或&nbsp;
							<a href="#">验证邮箱</a>
						</span>
					</td>
				</tr>
				<tr>
					<td class="protocol">
						我已阅读并同意
						<a href="#">
							《京淘用户注册协议》
						</a>
					</td>
				</tr>
				<tr >
					<td>
						<input class="submit" type="button" value="立即注册"/>
					</td>
				</tr>
				
			</table>
			
		</form>
		<div>
			<image src="${pageContext.request.contextPath }/imgs/regist-image/msg.jpg"/>
		</div>
	</div>
	<!-- body-end -->

	
	<!-- footer-start -->
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
	<!-- footer-end -->

</body>
</html>