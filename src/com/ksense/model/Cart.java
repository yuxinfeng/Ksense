package com.ksense.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Gavei
 * @date : 2013-12-16 ÏÂÎç12:55:32
 */

public class Cart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7950098049435039932L;
	
	String p_id;
	String p_brand;
	String p_name;
	double sa_price;
	Date cart_date;
	int cart_num;
	String username;
	
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
	public double getSa_price() {
		return sa_price;
	}
	public void setSa_price(double saPrice) {
		sa_price = saPrice;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cartDate) {
		cart_date = cartDate;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cartNum) {
		cart_num = cartNum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}
