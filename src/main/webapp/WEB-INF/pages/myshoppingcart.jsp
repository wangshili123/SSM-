<%@page import="com.wangshili.pojo.Commodity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>我的购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/cart/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/font/cart/iconfont.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script >
        $(function (){
            $("input[name='check']").click(function (){
               //先处理勾选问题
                if($(this).attr("class")=="checkAll"){
                    //如果点击的是全选框，让其他框同步状态就行
                    $("input[name='check']").attr("checked",$(this).prop('checked'));
                }else{
                    //把全选框搞到不勾选状态
                    $("input[class='checkAll']").attr("checked",false);
                }
                //先清零
                $money = $("span[class='money']");
                $money.text("0.00");
                //在处理总金额,遍历复选框,计算被选中的价格
                $("input[class='check']").each(
                    function (){
                        if($(this).prop('checked')){
                            //通过当前input找到总价total标签
                            //$(this).parent找到父元素
                            //.children(".total")找子元素类为total
                            $money.text(
                            +$money.text()+ +$(this).parent()
                            .children(".total").text())
                        }
                        
                    }
                );
            });     
           
        });

    </script>
</head>
<body>
    <div class="top">
        <div class="header">
            <div class="left">
                <img src="${pageContext.request.contextPath }/imgs/logo.jpg" alt="图标">
                <span>购物车</span>
            </div>
            <a class="exit" href="${pageContext.request.contextPath }/jingtaoindex">返回首页</a>
            <div class="right">
                <!-- 搜索框 -->
                <form name="form" action="${pageContext.request.contextPath }/commodity/cart">
	                <input  type="text" placeholder="搜索" name="description">
	                <span class="camera">
	                    <a href="#">
	                        <i class="iconfont icon-xiangji"></i>
	                    </a>
	                </span>
	                <a class="button" href="javascript:form.submit();">
	                    <i class="iconfont icon-sousuo"></i>
	                </a>
                </form>
            </div>
        </div>
    </div>
    <div class="title">
        <div class="left">
            <input name="check" class="checkAll" type="checkbox"><span class="checkAllspan">全选</span>
            <span class="shangpingxinxi">商品信息</span>
            <div class="right">
                <span>单价</span>
                <span>数量</span>
                <span>金额</span>
                <span>操作</span>
            </div>
        </div>
    </div>
    <form  class="item">
    	<!-- 遍历域中集合，生成 -->
   		<%
   			List<Commodity> list = (List<Commodity>)request.getAttribute("findAndCart");
   			for(Commodity c:list){
   				StringBuilder str = new StringBuilder
   						("<div class='item-2'>"
   						+"<div class='message'>"
   						+"<input name='check' class='check' type='checkbox'>"
   						+"<img src="+request.getContextPath()+"/imgs/"+c.getUrl()+" alt='图片'>"
   						+"<span class='explain'>"+c.getDescription()+"</span>"
   						+"<span class='fuhao-1' >￥</span>"
   						+"<span class='price'>"+c.getPrice()+"</span>"
   						+"<span class='number'>"+c.getNumber()+"</span>"
						+"<span class='fuhao-2' >￥</span>"
   						+"<span class='total'>"+c.getPrice()*c.getNumber()+"</span>"
   						+"<a href="+request.getContextPath()+"/commodity/deleteCart?productid="+c.getId()+" class='opeation'>删除</a></div></div>");
   				//打印
   				out.print(str);
   			}
   			
   		%>

  <%--       <div class="item-2">
            <div class="message">
                <input class="check" type="checkbox">
                <img src="${pageContext.request.contextPath }/imgs/1acfea8c6d4a1f87.jpg" alt="图片">
                <span class="explain">商品说明信息</span>
                <span class="fuhao" >￥</span>
                <span class="price">9.50</span>
                <span class="number">数量</span>
                 <span class="fuhao" >￥</span>
                <span class="total">33.50</span>
                <a href="" class="opeation">删除</a>
            </div>
        </div> --%>
    </form>
	 <!-- 结算 -->
    <div class="selt-a">
        <div class="selt">
            <div class="nei">
                <span class="heji">合计（不含运费）：</span>
				￥<span class="money">0.00</span>
                <a class="jiesuan" href="javascript:form.submit();">
                    <span>结算</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>