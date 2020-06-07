<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >

<head>
    <meta charset="UTF-8">
    <!-- 设置元素不受窗口大小变化 -->
<!--     <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->

    <title>京淘主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/middle/css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/daohang/daohang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/font/font_rpun1aqcb5/iconfont.css">
    <style>
        body {
            background-color: #e3e4e5;
            /* 设置字体 */
            font: 12px/1.5 Microsoft YaHei, Heiti SC, tahoma, arial, Hiragino Sans GB, "\5B8B\4F53", sans-serif;
        }

        /* 解决塌陷问题 */
        .clearfix::before,
        .clearfix::after {
            content: '';
            display: table;
            clear: both;
        }
           /* 统一给超链接鼠标移入显示红色 */
        a:hover {
            color: red;
        }
    </style>
    <script type="text/javascript">
        // 使用window.onload文档就绪事件，必须要等页面加载完成才获取正确
        window.onload = function () {
            var e = document.getElementsByClassName("point1");//获取导航点的对象
            var imgCenter = document.getElementsByClassName("imgcenter");//获取图像li对象
            for (var i = 0; i < e.length; i++) { //根据导航点的数量分别设置鼠标事件
                e[i].index = i;//需要给index按照i赋值，不然index是null
                e[i].onmouseover = function () {
                    /*移入事件*/
                    switch (this.index) {
                        case 0:
                            {  //分别设置图片的层级等级，等级高的就会显示
                                imgCenter[0].style.cssText = "z-index: 1;";
                                imgCenter[1].style.cssText = "z-index: 0;";
                                imgCenter[2].style.cssText = "z-index: 0;";
                            } break;
                        case 1:
                            {
                                imgCenter[0].style.cssText = "z-index: 0;";
                                imgCenter[1].style.cssText = "z-index: 1;";
                                imgCenter[2].style.cssText = "z-index: 0;";
                            } break;
                        case 2:
                            {
                                imgCenter[0].style.cssText = "z-index: 0;";
                                imgCenter[1].style.cssText = "z-index: 0;";
                                imgCenter[2].style.cssText = "z-index: 1;";
                            } break;
                    }

                    this.onmouseout = function () {
                        // 移出事件
                    }
                }
            }
        } 
    </script>

</head>

<body>
	<%
	
		Object username = session.getAttribute("username");
		/* out.print(username); */
	%>
    <!-- 导航栏 -->
    <div class="navigation">
        <div class="navigation-bar">
            <!-- 当前地理位置 -->
            <div class="city-bar">
                <div class="city">
                    <a href="javascript:;">
                        <i></i>
                        <span>广东</span>
                    </a>
                </div>
                <div class="city-display"></div>
            </div>
            <ul>
                <li>
                    <span style="color: red;">
                    <%=username==null?"":username+" 欢迎您" %> 
                    </span>&nbsp;
                   
                    <a style="color: red;" href=<%=username==null?
                    		"index":request.getContextPath()+"/login/signout" %> >
					<%=username==null?"请登录":"注销" %> 
					</a>
                </li>
                <li>
                    <a href="">我的订单</a>
                </li>
                <li>
                    <div class="myjd-bar">
                        <div class="my-jingdong">
                            <a href="">我的京东</a>
                            <i class="xiala"></i>
                        </div>
                        <div class="myjingdong-display"></div>
                    </div>
                </li>
                <li>
                    <a href="#">京东会员</a>
                </li>
                <li>
                    <div class="company-purchase">
                        <a style="color: red;" href="">企业采购</a>
                        <i class="xiala"></i>
                    </div>

                </li>
                <li>
                    <div class="customer-service">
                        <span>客户服务</span>
                        <i class="xiala"></i>
                    </div>
                </li>
                <li>
                    <div class="website-navigation">
                        <span>网址导航</span>
                        <i class="xiala"></i>
                    </div>
                </li>
                <li>手机京东</li>
            </ul>

        </div>
    </div>
    <!-- 搜索栏 -->
    <div class="header">
        <div class="header_all">
            <!-- 图标+京淘两字 -->
            <div class="jd_ico">
                <i class="iconfont icon-jingdong"></i>
                <h1>京淘</h1>
            </div>
            <div class="search_all">
                <!-- 搜索框 -->
                <div class="search">
                    <input  type="text" placeholder="搜索">
                    <span class="camera">
                        <a href="#">
                            <i class="iconfont icon-xiangji"></i>
                        </a>
                    </span>
                    <a class="button" href="#">
                        <i class="iconfont icon-sousuo"></i>
                    </a>
                    
                </div>
                <!-- 我的购物车 -->
                <div class="myshop">
                    <i class="iconfont icon-gouwuche"></i>
                    <a href="${pageContext.request.contextPath }/commodity/cart">我的购物车</a>
                </div>
            </div>
            <div class="fast_1">
                <ul class="fast_1_ul">
                    <a href="#">抢购秒杀</a>
                    <a href="#">尖货手机</a>
                    <a href="#">iPhone11</a>
                    <a href="#">低至6.18</a>
                    <a href="#">品质生活</a>
                    <a href="#">美妆预售</a>
                    <a href="#">凉席蚊帐</a>
                    <a href="#">免息家电</a>
                    <a href="#">家装建材</a>
                </ul>
            </div>
            <div class="fast_2">
                <ul class="fast_2_ul">
                    <a href="#">秒杀</a>
                    <a href="#">优惠劵</a>
                    <a href="#">PLUS会员</a>
                    <a href="#">品牌闪购</a>
                    <a href="#">拍卖</a>
                    <a href="#">京东家电</a>
                    <a href="#">京东超市</a>
                    <a href="#">京东生鲜</a>
                    <a href="#">京东国际</a>
                    <a href="#">京东金融</a>
                </ul>
            </div>
        </div>
        
    </div>
    <!-- 主体 -->
    <div class="all_window">
        <nav class="mune">
            <div><a href="http://" target="_blank">家用电器</a></div>
            <div>
                <a href="http://" target="_blank">手机</a> /
                <a href="http://" target="_blank">运营商</a> /
                <a href="http://" target="_blank">数码</a>
            </div>
            <div>
                <a href="http://" target="_blank">电脑</a> /
                <a href="http://" target="_blank">办公</a>
            </div>
            <div>
                <a href="http://" target="_blank">家居</a> /
                <a href="http://" target="_blank">家具</a> /
                <a href="http://" target="_blank">家装</a> /
                <a href="http://" target="_blank">厨具</a>
            </div>
            <div>
                <a href="http://" target="_blank">男装</a> /
                <a href="http://" target="_blank">女装</a> /
                <a href="http://" target="_blank">童装</a> /
                <a href="http://" target="_blank">内衣</a>
            </div>
            <div>
                <a href="http://" target="_blank">美妆</a> /
                <a href="http://" target="_blank">个护清洁</a> /
                <a href="http://" target="_blank">宠物</a>
            </div>
            <div>
                <a href="http://" target="_blank">女鞋</a> /
                <a href="http://" target="_blank">箱包</a> /
                <a href="http://" target="_blank">钟表</a> /
                <a href="http://" target="_blank">珠宝</a>
            </div>
            <div>
                <a href="http://" target="_blank">男鞋</a> /
                <a href="http://" target="_blank">运动</a> /
                <a href="http://" target="_blank">户外</a> /
                <a href="http://" target="_blank">女鞋</a>
            </div>
            <div>
                <a href="http://" target="_blank">房产</a> /
                <a href="http://" target="_blank">汽车</a> /
                <a href="http://" target="_blank">汽车用品</a>
            </div>
            <div>
                <a href="http://" target="_blank">母婴</a> /
                <a href="http://" target="_blank">玩具</a> /
                <a href="http://" target="_blank">乐器</a> 
            </div>
            <div>
                <a href="http://" target="_blank">食品</a> /
                <a href="http://" target="_blank">酒类</a> /
                <a href="http://" target="_blank">生鲜</a> /
                <a href="http://" target="_blank">特产</a>
            </div>
        </nav>
        <ul class="center">
            <li class="imgcenter"><img src="${pageContext.request.contextPath }/imgs/1.jpg"></li>
            <li class="imgcenter"><img src="${pageContext.request.contextPath }/imgs/2.jpg"></li>
            <li class="imgcenter"><img src="${pageContext.request.contextPath }/imgs/3.jpg"></li>
            <ul class="point">
                <li class="point1"></li>
                <li class="point1"></li>
                <li class="point1"></li>
            </ul>
        </ul>
        <div class="right">
            <a href="${pageContext.request.contextPath }/commodity/item?url=c3a6229fcbc9c907.jpg">
                <img src="${pageContext.request.contextPath }/imgs/c3a6229fcbc9c907.jpg" alt="右边">
            </a><br>
            <a href="${pageContext.request.contextPath }/commodity/item?url=1fec724485e437e4.jpg">
                <img src="${pageContext.request.contextPath }/imgs/1fec724485e437e4.jpg" alt="右边">
            </a><br>
            <a href="${pageContext.request.contextPath }/commodity/item?url=1acfea8c6d4a1f87.jpg">
                <img src="${pageContext.request.contextPath }/imgs/1acfea8c6d4a1f87.jpg" alt="右边">
            </a>
        </div>
        <div class="right_2">
            <img  src="${pageContext.request.contextPath }/imgs/jingdongongnenglang.png" alt="功能栏">
        </div>
    </div>
</body>

</html>