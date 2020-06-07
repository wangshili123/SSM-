package com.wangshili.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;




public class GetPassSession implements Filter{
	//存登录的用户信息
	private static Map<String, String> map;
	//存登录session
//	private static HttpSession session;
	//使用logger import org.slf4j.Logger; import org.slf4j.LoggerFactory;
	Logger logger = LoggerFactory.getLogger(getClass());
	
//	public static synchronized HttpSession getSession() {
//		return session;
//	}
//
//	public static synchronized void setSession(HttpSession session) {
//		GetPassSession.session = session;
//	}

	public static synchronized Map<String, String> getMap() {
		return map;
	}

	public synchronized void setMap(Map<String, String> map) {
		GetPassSession.map = map;
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 初始化，只会执行一次,创建一个map
		map = new HashMap<String,String>();
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 执行过滤
		//需要判断sessionid是不是新的
		 HttpServletRequest httprequest = (HttpServletRequest) request;//需要转换下，接口没getsession
		 HttpServletResponse httpresponse = (HttpServletResponse) response;//需要转换下
		 HttpSession session = httprequest.getSession();
//		 setSession(httprequest.getSession());//存入，方便其他页面调用
		 logger.info("存入session:"+session.getId());
		 String username = map.get(session.getId());//获取名字
		 if(username!=null) { //有数据说明登录过了直接放行
			 logger.info(username+"免密登录了京淘");
			 //重新激活时间
			 Cookie cookie = new Cookie("JSESSIONID", session.getId());
			 cookie.setMaxAge(60*60);//存活一小时
			 httpresponse.addCookie(cookie);//添加到浏览器中
			 session.setMaxInactiveInterval(60*60);//存活一小时
			 if(httprequest.getRequestURI().equals(
					 httprequest.getContextPath()+"/index")) {//如果路径是指向登录界面的,直接进主页
				 httpresponse.sendRedirect(httprequest.getContextPath()+"/jingtaoindex");

			 }else {
				 chain.doFilter(httprequest, httpresponse);//放行资源
			 }
			 
			 
		 }else {
			 //如果是没登录过的状态，就要判断路径
			 if(httprequest.getRequestURI().equals(
					 httprequest.getContextPath()+"/index")) {//如果路径是指向登录界面的
//				 //要在这个界面存Cookie，不然不起作用
				 Cookie cookie = new Cookie("JSESSIONID", session.getId());
				 cookie.setMaxAge(60*60);//存活一小时
				 httpresponse.addCookie(cookie);//添加到浏览器中
				 session.setMaxInactiveInterval(60*60);//存活一小时
				 chain.doFilter(httprequest, httpresponse);//直接放行资源
			 }else {
				 //不是的话就要强制到登录界面
				 httpresponse.sendRedirect(httprequest.getContextPath()+"/index");
			 }
		 }
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}


}
