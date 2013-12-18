package com.ksense.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Gavei
 * @date : 2013-12-16 ÏÂÎç12:56:09
 */

public class Order implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String order_no;
	Date order_date;
	int order_sum;
	double order_mon;
	String bank;
	String bank_no;
	String tran_type;
	String tran_no;
	String tran_contact;
	String tran_phone;
	String address;
	String username;
	String remark;
	String status;
	Date status_date;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String orderNo) {
		order_no = orderNo;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date orderDate) {
		order_date = orderDate;
	}
	public int getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(int orderSum) {
		order_sum = orderSum;
	}
	public double getOrder_mon() {
		return order_mon;
	}
	public void setOrder_mon(double orderMon) {
		order_mon = orderMon;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBank_no() {
		return bank_no;
	}
	public void setBank_no(String bankNo) {
		bank_no = bankNo;
	}
	public String getTran_type() {
		return tran_type;
	}
	public void setTran_type(String tranType) {
		tran_type = tranType;
	}
	public String getTran_no() {
		return tran_no;
	}
	public void setTran_no(String tranNo) {
		tran_no = tranNo;
	}
	public String getTran_contact() {
		return tran_contact;
	}
	public void setTran_contact(String tranContact) {
		tran_contact = tranContact;
	}
	public String getTran_phone() {
		return tran_phone;
	}
	public void setTran_phone(String tranPhone) {
		tran_phone = tranPhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getStatus_date() {
		return status_date;
	}
	public void setStatus_date(Date statusDate) {
		status_date = statusDate;
	}
	
	
}
