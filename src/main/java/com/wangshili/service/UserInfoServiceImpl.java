package com.wangshili.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wangshili.dao.UserInfoMapper;
import com.wangshili.pojo.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoMapper userInfoMapper;
	@Override
	public UserInfo findByusername(String username) {

		return userInfoMapper.findByusername(username);
	}
	
	@Override
	public void insertUser(String username, String password) {
		userInfoMapper.insertUser(username, password);
	}

}
