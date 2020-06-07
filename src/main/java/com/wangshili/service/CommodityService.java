package com.wangshili.service;

import java.util.List;

import com.wangshili.pojo.Commodity;

public interface CommodityService {
	/*
	 * 图片名查找信息
	 */
	Commodity findBycom(Commodity com);
	/*
	 * 取出用户对应的购物车记录
	 * 只需要提供用户id
	 */
	List<Commodity> findAndCart(Integer id,String description);
}
