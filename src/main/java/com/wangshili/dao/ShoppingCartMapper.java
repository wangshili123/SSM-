package com.wangshili.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangshili.pojo.Commodity;

/*
 * 购物车信息，关联用户id和商品id和数量即可
 */
public interface ShoppingCartMapper {
	
	/*
	 * 添加购物车信息
	 * 当多个参数时，必须要加param注解，否则mybatis无法识别对应哪个参数
	 */
	void insert(@Param(value = "userid")Integer userid,
			@Param(value = "productid")Integer productid,
			@Param(value = "number")Integer number);
	
	/*
	 * 删除购物车信息，指定的用户id和商品id
	 */
	void deleteProduct(@Param(value = "userid")Integer userid,
			@Param(value = "productid")Integer productid);
	
	/*
	 *模糊搜索商品 
	 */
	List<Commodity> findLikeCart(String description);
}
