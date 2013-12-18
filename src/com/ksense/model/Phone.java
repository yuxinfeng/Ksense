package com.ksense.model;

import java.io.Serializable;

/**
 * @author Gavei
 * @date : 2013-12-14 ÏÂÎç03:47:20
 */

public class Phone implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pId;
    private String pBrand;
    private String pName;
    private int inventory;
    private double inPrice;
    private double saPrice;
    private String remark;
    
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpBrand() {
		return pBrand;
	}
	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public double getInPrice() {
		return inPrice;
	}
	public void setInPrice(double inPrice) {
		this.inPrice = inPrice;
	}
	public double getSaPrice() {
		return saPrice;
	}
	public void setSaPrice(double saPrice) {
		this.saPrice = saPrice;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
