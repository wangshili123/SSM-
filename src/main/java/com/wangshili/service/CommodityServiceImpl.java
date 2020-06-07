package com.wangshili.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wangshili.dao.CommodityMapper;

import com.wangshili.pojo.Commodity;

@Service
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	CommodityMapper commodityMapper;	
	@Override
	public Commodity findBycom(Commodity com) {
		return commodityMapper.findBycom(com);
	}
	@Override
	public List<Commodity> findAndCart(Integer id,String description) {
		
		return commodityMapper.findAndCart(id,description);
	}
	
}
