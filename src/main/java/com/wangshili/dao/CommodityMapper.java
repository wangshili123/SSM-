package com.wangshili.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangshili.pojo.Commodity;

public interface CommodityMapper {
	/*
	 * 根据需要查找信息
	 * 修改：传入对象，动态查询，2020-5-23
	 */
	Commodity findBycom(Commodity com);
	/*
	 * 取出用户对应的购物车记录
	 * 只需要提供用户id
	 */
	List<Commodity> findAndCart(@Param(value = "id")Integer id,@Param(value = "description")String description);
}
