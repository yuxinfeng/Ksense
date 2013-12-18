package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDetailDAO extends BaseDAO{
	
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int genOrderDetail(String username, String order_no){
		int effectRow = 0;
		String sql="insert into t_order_detail(order_no, p_id, p_brand, p_name, p_color, remark, sa_price, order_num) select '"+order_no+"' as order_no, c.p_id as p_id, p.p_brand as p_brand, p.p_name as p_name,p.p_color as p_color,p.remark as remark, p.sa_price as sa_price, c.cart_num as order_num  from t_cart c, t_phone p "
		+ " where c.p_id = p.p_id and c.username='"+username+"'";
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRow = ps.executeUpdate();
			if( effectRow != 0 ){
				CartDAO cartDAO = new CartDAO();
				effectRow = cartDAO.cartClear(username);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
}
