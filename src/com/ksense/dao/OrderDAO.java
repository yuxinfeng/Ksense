package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ksense.model.Order;

public class OrderDAO extends BaseDAO{
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public String getOrderNo(){
		String OrderNo = "RN-1001";
		String sql = "select IFNULL(max(order_no),'RN-1000') as maxno from t_order";
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				OrderNo= rs.getString("maxno");
				String str = OrderNo.substring(3);
				OrderNo = "RN-" + (Integer.parseInt(str) + 1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return OrderNo;
		
	}
	
	public int orderInsert(Order order){
		int effectRow = 0;
		String order_no = getOrderNo();
		String sql = "insert into t_order(order_no, order_date, order_sum, order_mon, bank, bank_no, tran_type,  tran_contact, tran_phone, address, username, remark, status)"+
					 "values('"+order_no+"',sysdate(),'"+order.getOrder_sum()+"','"+order.getOrder_mon()+"','"+order.getBank()+"','"+order.getBank_no()+"','"+order.getTran_type()+"','"+order.getTran_contact()+"','"+order.getTran_phone()+"','"+order.getAddress()+"','"+order.getUsername()+"','"+order.getRemark()+"','ÐÂ¶©µ¥')";
		try {
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRow = ps.executeUpdate();
			if(effectRow != 0){
				OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
				effectRow = orderDetailDAO.genOrderDetail(order.getUsername(), order_no);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRow;
	}
	
}
