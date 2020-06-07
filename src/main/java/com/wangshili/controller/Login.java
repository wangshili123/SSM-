package com.wangshili.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangshili.dao.UserInfoMapper;
import com.wangshili.filter.GetPassSession;
import com.wangshili.pojo.UserInfo;
import com.wangshili.service.UserInfoService;

@Controller
@RequestMapping("/login")
public class Login extends HttpServlet{
	/**
	 * 还是把HttpServlet继承上，个别浏览器不同界面会产生新的session，导致不一样，继承后就可以保证唯一
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 获取存取用户名称和sessionid的map
	 */
	private Map<String, String> getPassSessionmap =  GetPassSession.getMap();
	/*
	 * 获取记录器
	 */
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	UserInfoService userinfoservice;//装配UserInfoMapper
	/*
	 * 
	 */
	@RequestMapping("/valid")
	@ResponseBody
	public String valid(String username,String password,HttpServletResponse response,HttpServletRequest request) 
			throws IOException { //接收两个参数
		HttpSession session = request.getSession();
		UserInfo findByusername = userinfoservice.findByusername(username); //查找username
		if(findByusername!=null) {//不为空说明找到了
			if(findByusername.getPassword().equals(password)) { //获取数据的密码对比
				request.getSession().setAttribute("username", username);//带入域中
				 //存入map
				 getPassSessionmap.put(session.getId(), username);//存入id和用户名
				 logger.info(username+"登录了京淘"+session.getAttribute("username"));
				 System.out.println("map:"+getPassSessionmap);
				return "jingtaoindex"; //验证通过,将跳转界面交给jsp里面来处理
			}
		}
		System.out.println(username+":"+password);
		return  "error";
	}
	/*
	 * 注册，接收用户名和密码，判空
	 * 解决ajax乱码问题produces="text/html;charset=UTF-8"
	 */
	@RequestMapping(value = "/userRegist",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String userRegist(String username,String password) {
		System.out.println(username+":"+password);
		//判空
		if(username != ""&&password != "") {
			//先判断是否存在用户
			if(userinfoservice.findByusername(username)==null) {
				//没有存在正常存入
				userinfoservice.insertUser(username, password);
				logger.info(username+"注册了京淘，密码为："+password);
				return "注册成功！";
			}else {
				//已存在
				return "该用户名已存在，请尝试其他的名称";
			}
		}else {//返回空错误
			return "请输入完整的用户名和密码";
		}
	}
	
	
	/*
	 * 注销，返回原界面
	 * 从Map清除指定的名字的数据
	 * 销毁session可能比修改值更耗费时间
	 */
	@RequestMapping("/signout")
	public String signout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(0);//销毁session
		System.out.println("注销id:"+session.getId());
		System.out.println("map:"+getPassSessionmap);
		getPassSessionmap.remove(session.getId());//清除map中的数据
		session.setAttribute("username", null);
		System.out.println("map:"+getPassSessionmap);
		return "redirect:/index";
	}

}
