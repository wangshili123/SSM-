package com.wangshili.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wangshili.dao.ShoppingCartMapper;
import com.wangshili.pojo.Commodity;

@Service
public class ShoppinCartServiceImpl implements ShoppinCartService {

	@Autowired
	ShoppingCartMapper shoppingCartMapper;
	@Override
	public void insert(Integer userid, Integer productid, Integer number) {
		shoppingCartMapper.insert(userid, productid, number);
	}
	
	@Override
	public void deleteProduct(Integer userid, Integer productid) {
		shoppingCartMapper.deleteProduct(userid, productid);
	}

	@Override
	public List<Commodity> findLikeCart(String description) {

		return shoppingCartMapper.findLikeCart(description);
	}

}
