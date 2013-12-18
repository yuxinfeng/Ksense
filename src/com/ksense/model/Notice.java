package com.ksense.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Gavei
 * @date : 2013-12-16 ����12:55:51
 */

public class Notice implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Date notice_date;			//��������
	String notice_name;			//��������
	String notice_content;		//��������
	String notice_user;			//������
	
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date noticeDate) {
		notice_date = noticeDate;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String noticeName) {
		notice_name = noticeName;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String noticeContent) {
		notice_content = noticeContent;
	}
	public String getNotice_user() {
		return notice_user;
	}
	public void setNotice_user(String noticeUser) {
		notice_user = noticeUser;
	}
	
}
