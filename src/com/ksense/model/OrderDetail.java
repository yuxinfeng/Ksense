package com.ksense.model;

import java.io.Serializable;

/**
 * @author Gavei
 * @date : 2013-12-16 ÏÂÎç12:56:19
 */

public class OrderDetail implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String order_no;
	String p_id;
	String p_brand;
	String p_name;
	Double sa_price;
	int order_num;
	String p_color;
	String remark;
	
	
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String pColor) {
		p_color = pColor;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String orderNo) {
		order_no = orderNo;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String pId) {
		p_id = pId;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String pBrand) {
		p_brand = pBrand;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String pName) {
		p_name = pName;
	}
	public Double getSa_price() {
		return sa_price;
	}
	public void setSa_price(Double saPrice) {
		sa_price = saPrice;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int orderNum) {
		order_num = orderNum;
	}
	
	
}
