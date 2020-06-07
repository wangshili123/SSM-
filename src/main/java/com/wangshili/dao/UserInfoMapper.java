package com.wangshili.dao;

import org.apache.ibatis.annotations.Param;

import com.wangshili.pojo.UserInfo;

public interface UserInfoMapper {
	/*
	 * 通过用户名查找数据库，返回UserInfo类型参数
	 */
	UserInfo findByusername(String username);
	/*
	 * 注册用户
	 */
	void insertUser(@Param(value = "username")String username,@Param(value = "password")String password);
}

