package com.wangshili.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangshili.pojo.Commodity;

public interface ShoppinCartService {

	/*
	 * 添加购物车信息
	 */
	void insert(Integer userid,Integer productid,Integer number);
	
	/*
	 * 删除购物车信息，指定的用户id和商品id
	 */
	void deleteProduct(Integer userid,Integer productid);
	
	/*
	 *模糊搜索商品 
	 */
	List<Commodity> findLikeCart(String description);
}
