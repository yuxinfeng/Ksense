package com.ksense.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Gavei
 * @date : 2013-12-10 ÏÂÎç10:40:20
 */

public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String username;
	String password;
	String name;
	String qq;
	String email;
	String contact;
	String remark;
	String status;
	Date apply_date;
	String bank;
	String bank_no;
	String tran_type;
	String tran_contact;
	String tran_phone;
	String address;
	
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
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date applyDate) {
		apply_date = applyDate;
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

	
}
