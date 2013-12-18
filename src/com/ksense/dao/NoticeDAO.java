package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.sf.json.JSONObject;

import com.ksense.util.DateTransfer;

/**
 * @author Gavei
 * @date : 2013-12-15 ÉÏÎç11:21:09
 */

public class NoticeDAO extends BaseDAO{
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public String loadNotice(){
		
		JSONObject resultJSON = new JSONObject();
		String sql = "select notice_date, notice_name, notice_content from t_notice order by notice_date desc limit 0,5";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				resultJSON.accumulate("notice_date",DateTransfer.DateToString(rs.getDate("notice_date")));
				resultJSON.accumulate("notice_name", rs.getString("notice_name"));
				resultJSON.accumulate("notice_content", rs.getString("notice_content"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return resultJSON.toString();
	}
	
}
