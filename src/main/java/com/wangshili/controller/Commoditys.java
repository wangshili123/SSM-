package com.wangshili.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangshili.service.CommodityService;
import com.wangshili.service.ShoppinCartService;
import com.wangshili.service.UserInfoService;
import com.wangshili.filter.GetPassSession;
import com.wangshili.pojo.Commodity;
import com.wangshili.pojo.UserInfo;

/*
 * 商品信息处理
 */
@RequestMapping("/commodity")
@Controller
public class Commoditys extends HttpServlet{

	/**
	 * 还是把HttpServlet继承上，个别浏览器不同界面会产生新的session，导致不一样，继承后就可以保证唯一
	 */
	private static final long serialVersionUID = 1L;
	
	/*
	 * 获取记录器
	 */
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommodityService commodityService;//获取商品对象
	@Autowired
	UserInfoService userInfoService;//用户信息对象
	@Autowired
	ShoppinCartService shoppinCartService;//购物车信息对象
	
	
	
	
	/*r
	 * 处理不同图片带过来的图片名，取出对应的商品信息，并将信息存到模型数据域中
	 * 修改：使用Model存数据不方便其他模型获取数据，因为是作用在request上的。全部用session来存数据
	 */
	@RequestMapping("/item")
	public String item(String url,HttpServletRequest request) {
		Commodity findByurl = commodityService.findBycom(new Commodity(null, null, null, url));//找到需要的数据
		logger.info("用户看了产品："+findByurl);
		//添加到模型数据中
		request.getSession().setAttribute("commodity", findByurl);
		return "forward:/information";//跳到商品显示页
	}
	

	/**
	 * 加入购物车按钮按下后执行
	 * @param number 商品数量
	 * @param request
	 * @return
	 */
	@SuppressWarnings("finally")
	@RequestMapping("/addCart")
	public String addCart(String number,HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
				//先取出域中的用户名，再取出用户id
				Object username = session.getAttribute("username");
				//获取到用户信息
				UserInfo findByusername = userInfoService.findByusername((String)username);
				//取出商品信息
				Commodity commodity = (Commodity)session.getAttribute("commodity");//获取商品全部信息
//				System.out.println(commodity);
				//加入数据库
				shoppinCartService.insert(findByusername.getId(), commodity.getId(),Integer.valueOf(number));
				//返回加入成功
				session.setAttribute("message", "成功添加到购物车");
				logger.info("用户"+username+"加了"+number+"产品到购物车了："+findByusername);
			
			} catch (Exception e) {
				session.setAttribute("message", "添加失败，请重试");
				throw e;
			}finally {
				return "redirect:/information";
			}
		
	}
	
	/*
	 * 查看购物车信息.模糊搜索
	 */
	@RequestMapping("/cart")
	public String cart(HttpServletRequest request,String description) {
		//取出用户id
		//先取出域中的用户名，再取出用户id
		Object username = request.getSession().getAttribute("username");
		UserInfo findByusername = userInfoService.findByusername((String)username);//取出用户信息
		//取出购物车信息
		List<Commodity> findAndCart = commodityService.findAndCart(findByusername.getId(),description);
		logger.info("用户"+username+"查看了购物车："+findAndCart);
		request.setAttribute("findAndCart", findAndCart);
		return "myshoppingcart";
	}
	
	
	/**
	 * 删除指定商品，需要匹配用户
	 * @param productid 商品id
	 * @return 刷新购物车
	 */
	@RequestMapping("/deleteCart")
	public String deleteCart(String productid,HttpServletRequest request) {
		//取出用户id
		//先取出域中的用户名，再取出用户id
		Object username = request.getSession().getAttribute("username");
		UserInfo findByusername = userInfoService.findByusername((String)username);
		//从数据库删除
		shoppinCartService.deleteProduct(findByusername.getId(),Integer.valueOf(productid));
		logger.info("用户"+username+"删除了"+productid+"号商品");
		return "redirect:/commodity/cart";
	}
}
