package com.wangshili.sqltest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wangshili.pojo.Commodity;
import com.wangshili.service.CommodityService;
import com.wangshili.service.UserInfoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={ "classpath:spring/applicationContext.xml" })
public class SQLTest {
	@Autowired
	CommodityService commodityService;//获取商品对象
	
	@Autowired 
	UserInfoService userInfoService;
	
	@Test
	public void test1() {
//		测试sql
		Commodity commodity = new Commodity(null, null, null, "c3a6229fcbc9c907.jpg");
		Commodity findByurl = commodityService.findBycom(commodity);//找到需要的数据
		System.out.println(findByurl.toString());
	}
	
	@Test
	public void test2() {
		userInfoService.insertUser("我是傻逼", "123456");
	}
	
	@Test
	public void test3() {
		
		
		System.out.println(commodityService.findAndCart(1,"东"));
	}
}
