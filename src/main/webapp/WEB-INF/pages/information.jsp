<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/commodity/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/font/font_iyal99atchp/iconfont.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <!--对+-按键的处理  -->
    <script>
        //取input值
        function getval(){
            return $(".set input").val();
            }
        //设置input值
        function setval(val){
            $(".set input").attr("value",val);
        }
        //文档就绪事件
        $(
            //减号按键触发事件
            function(){
                $(".set .icon-jian").click(function(){
                //取到input框的值
                    var val = getval();
                    console.log("触发"+val);
                    //判断是否为1,1不减
                    if(val!=1){
                        val--;
                        setval(val);
                    }
                })
                //加号按键触发事件
                $(".set .icon-jiahaozhankai").click(function () {
                    var val = getval();
                    val++;
                    setval(val);
                })
            }                                              
        );
        
    </script>
	<!-- 提示信息 -->
	<script type="text/javascript">
		$(function () {
			<%
				Object commodity = session.getAttribute("commodity");//取出商品信息
				if(commodity==null)//如果图片资源为空，去首页重新进吧
					response.sendRedirect("jingtaoindex");
				//获取提示信息
				Object messsge = session.getAttribute("message");//取出提示信息
			%>
			if("<%=messsge%>"!="null"){
				alert("<%=messsge%>");
				<%
					//清除记录
					session.removeAttribute("message");
				%>
			}				
		});
	</script>
</head>
<body>

    <div class="all">
		<div class="wenzi">
			<div>
			<a href="${pageContext.request.contextPath }/jingtaoindex" class="out">返回首页</a>
				<span>商品信息</span> 
				
			</div>
		</div>
		<div class="img">
            <img src="${pageContext.request.contextPath }/imgs/${commodity.url}" alt="">
        </div>
        <div class="item">
            <div class="desripation">${commodity.description}</div>
            <div class="price">
                <div class="yuanjia">
                    <span >原价</span>
                    <div class="number">
                        <span>￥</span>
                        <!--  s标签自动加下划线-->
                        <s>9999.00</s>
                    </div>
                </div>
                <span class="price-name">京淘价</span>
                <span class="price-a">￥${commodity.price}</span>
                <div class="pinglun">
                    <div class="number">
                        <span>9999</span>
                        <span>9999</span> 
                    </div>
                    <div class="span">
                        <span>累计评论</span>
                        <span>交易成功</span>
                    </div>
                    
                </div>
            </div>
            <form name="form" class="setnumber" action="${pageContext.request.contextPath }/commodity/addCart">
                <span class="span">数量</span>
                <div class="set">
                    <a class="iconfont icon-jian" href="javascript:void(0);"></a>
                    <input type="text" name="number" value="1">
                    <a class="iconfont icon-jiahaozhankai" href="javascript:void(0);"></a>
                </div>
                <a  class="addButton" href="javascript:form.submit();" title="加入购物车">
                    <i class="iconfont icon-gouwuche"></i>
                    <span>加入购物车</span>
                </a>
            </form>  
        </div>
    </div>
</body>
</html>