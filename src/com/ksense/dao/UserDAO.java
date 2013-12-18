package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.sf.json.JSONObject;

import com.ksense.model.User;
import com.ksense.util.DateTransfer;

/**
 * @author Gavei
 * @date : 2013-12-10 下午10:54:18
 */

public class UserDAO extends BaseDAO{
	
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//登录处理
	public User getUser(String username, String password){
		User user = new User();
		String sql = "select username, password, name, qq, email, contact,  remark, status, apply_date, bank, bank_no, tran_type, tran_contact, tran_phone, address from t_user where username = '"+username+"' and password = '"+password+"'";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setQq(rs.getString("qq"));
				user.setEmail(rs.getString("email"));
				user.setContact(rs.getString("contact"));
				user.setRemark(rs.getString("remark"));
				user.setStatus(rs.getString("status"));
				user.setApply_date(rs.getDate("apply_date"));
				user.setBank(rs.getString("bank"));
				user.setBank_no(rs.getString("bank_no"));
				user.setTran_type(rs.getString("tran_type"));
				user.setTran_contact(rs.getString("tran_contact"));
				user.setTran_phone(rs.getString("tran_phone"));
				user.setAddress(rs.getString("address"));
			}
			else{
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return user;
	}
	
	//加载人员的基本资料
	public String loadUser(String username){
		JSONObject resultJSON = new JSONObject();
		String sql = "select username, password, name, qq, email, contact,  remark, status, apply_date, bank, bank_no, tran_type, tran_contact, tran_phone, address from t_user where username = '"+username+"' ";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				resultJSON.accumulate("username",rs.getString("username"));
				resultJSON.accumulate("password",rs.getString("password"));
				resultJSON.accumulate("name",rs.getString("name"));
				resultJSON.accumulate("qq",rs.getString("qq"));
				resultJSON.accumulate("email",rs.getString("email"));
				resultJSON.accumulate("contact",rs.getString("contact"));
				resultJSON.accumulate("remark",rs.getString("remark"));
				resultJSON.accumulate("status",rs.getString("status"));
				resultJSON.accumulate("apply_date",DateTransfer.DateToString(rs.getDate("apply_date")));
				resultJSON.accumulate("bank",rs.getString("bank"));
				resultJSON.accumulate("bank_no",rs.getString("bank_no"));
				resultJSON.accumulate("tran_type",rs.getString("tran_type"));
				resultJSON.accumulate("tran_contact",rs.getString("tran_contact"));
				resultJSON.accumulate("tran_phone",rs.getString("tran_phone"));
				resultJSON.accumulate("address",rs.getString("address"));
			}
			else{
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return resultJSON.toString();
	}
	
	//更新员工基本资料
	public int baseUpdate(User user){
		int effectRow = 0;
		String sql = "update t_user set name='"+user.getName()+"',qq='"+user.getQq()+"',email='"+user.getEmail()+"',contact='"+user.getContact()+"',remark='"+user.getRemark()+"',bank='"+user.getBank()+"',bank_no='"+user.getBank_no()+"',tran_type='"+user.getTran_type()+"',tran_contact='"+user.getTran_contact()+"',tran_phone='"+user.getTran_phone()+"',address='"+user.getAddress()+"' where username='"+user.getUsername()+"' ";
		try{
			System.out.println(sql);
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRow = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
	//更新密码
	public int passwordUpdate(String username, String password){
		int effectRow = 0;
		String sql = "update t_user set password='"+password+"' where username='"+username+"' ";
		try{
			System.out.println(sql);
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRow = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
	//更新员工基本资料
	public int userInsert(User user){
		int effectRow = 0;
		String sql = "insert t_user(username,password,name,qq,email,contact,status,apply_date) values('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getName()+"','"+user.getQq()+"','"+user.getEmail()+"','"+user.getContact()+"','"+user.getStatus()+"',sysdate())";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRow = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
	//更新员工基本资料
	public int userCount(String username){
		int effectRow = 0;
		String sql = "select count(*) as usercount from t_user where username='"+username+"'";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				effectRow = rs.getInt("usercount");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
}
