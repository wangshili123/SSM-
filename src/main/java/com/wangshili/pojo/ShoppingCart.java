package com.wangshili.pojo;


public class ShoppingCart {
	private Integer userid;
	private Integer productid;
	private Integer number;
	
	public ShoppingCart() {};
	public ShoppingCart(Integer userid, Integer productid, Integer number) {
		this.userid = userid;
		this.productid = productid;
		this.number = number;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
}
