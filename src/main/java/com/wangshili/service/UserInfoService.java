package com.wangshili.service;

import org.apache.ibatis.annotations.Param;

import com.wangshili.pojo.UserInfo;

public interface UserInfoService {
	/*
	 * 通过用户名查找数据库，返回UserInfo类型参数
	 */
	UserInfo findByusername(String username);
	/*
	 * 注册用户
	 */
	void insertUser(String username,String password);
}
