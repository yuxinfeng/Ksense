package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import net.sf.json.JSONObject;

import com.ksense.util.DateTransfer;

/**
 * @author Gavei
 * @date : 2013-12-15 上午11:21:02
 */

public class CartDAO extends BaseDAO{
	
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public String loadCart(String username){
		
		JSONObject resultJSON = new JSONObject();
		String sql = "select c.p_id as p_id, p.p_brand as p_brand, p.p_name as p_name, p.p_color as p_color,p.sa_price as sa_price ,p.remark as remark,c.cart_num as cart_num from t_cart c,t_phone p where c.p_id = p.p_id and c.username='"+username+"' order by c.cart_date desc";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				resultJSON.accumulate("p_id",rs.getString("p_id"));
				resultJSON.accumulate("p_brand", rs.getString("p_brand"));
				resultJSON.accumulate("p_name", rs.getString("p_name"));
				resultJSON.accumulate("p_color", rs.getString("p_color"));
				resultJSON.accumulate("sa_price", rs.getDouble("sa_price"));
				resultJSON.accumulate("remark", rs.getString("remark"));
				resultJSON.accumulate("cart_num", rs.getInt("cart_num"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return resultJSON.toString();
	}
	
	//删除购物车里面的东西
	public int cartDelete(String username, String p_id){
		int effectRow = 0;
		String sql = "delete from t_cart where username='"+username+"' and p_id='"+p_id+"'";
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
	
	//删除购物车里面的东西
	public int cartClear(String username){
		int effectRow = 0;
		String sql = "delete from t_cart where username='"+username+"'";
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
	
	//添加购物车
	public int cartInsert(String username, String p_id){
		int effectRow = 0;
		String sql = "select count(*) as counts from t_cart where username='"+username+"' and p_id='"+p_id+"' ";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				int counts = rs.getInt("counts");
				if(counts == 0){
					String sqls = "insert into t_cart(p_id,cart_date,username) values('"+p_id+"',sysdate(),'"+username+"')";
					ps = conn.prepareStatement(sqls);
					effectRow = ps.executeUpdate();
				}else{
					effectRow = -1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
	//删除购物车里面的东西
	public int cartUpdate(String username, String p_id, String sa_price){
		int effectRow = 0;
		String sql = "update t_cart set cart_num='"+sa_price+"' where username='"+username+"' and p_id='"+p_id+"' ";
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
}
