package com.wangshili.pojo;

/*
 * 商品信息\
 * 类型不要用基本类型，用包装类型
 * 属性名最好与列名保持一致，如果不一致需要配置对应关系
 * 比如 数据表中有列名为door_id，那java中要符合驼峰命名，需要用doorId，或者其他，但是要在mapper文件中配置对应关系
 */
public class Commodity {
	private Integer id ;
	private String description;
	private Double price;
	private String url;
	private Integer number;//此number是为了在获取用户的购物车时添加数量
	//无参构造方法
	public Commodity() {};
	//增加构造方法
	public Commodity(Integer id, String description, Double price, String url) {
		this.id = id;
		this.description = description;
		this.price = price;
		this.url = url;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "Commodity [id=" + id + ", description=" + description + ", price=" + price + ", url=" + url
				+ ", number=" + number + "]";
	}
	
	
}
