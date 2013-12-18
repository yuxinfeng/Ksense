package com.ksense.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Gavei
 * @date : 2013-12-10 下午10:45:49
 */

public class BaseDAO {
	
	
	private static final String DRIVERNAME = "com.mysql.jdbc.Driver";

//	private static final String URL = "jdbc:mysql://sqld.duapp.com:4050/HjSLWtmtShcuLDsjDyyM";
//	private static final String USER = "wigf4bKroYb3KrpubBqupjeQ";
//	private static final String PWD = "dLRVxYXFQmptbjmdjD09Cjub8g6cfA37";
	
	private static final String URL = "jdbc:mysql://localhost:3306/ksense";
	private static final String USER = "root";
	private static final String PWD = "root";
	
	public Connection getConnection(){
		Connection connection = null;
		
			try {
			    
			    Class.forName(DRIVERNAME);
			    try {
			    	connection = DriverManager.getConnection(URL, USER, PWD);
			    } catch (SQLException e) {
			    	e.printStackTrace();
			    }
			   } catch (ClassNotFoundException e) {
			    
				   e.printStackTrace();
			   }
		return connection;
	}
	
	public void closeAll(Connection conn,PreparedStatement ps,ResultSet rs){
		try{
			
		if(conn!=null){
			conn.close();
		}
		if(ps!=null){
			ps.close();
		}
		if(rs!=null){
			rs.close();
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static int getByteSize(String content) {
		int size = 0;
		if (null != content) {
			try {
				// 汉字采用utf-8编码时占3个字节
				size = content.getBytes("utf-8").length;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return size;
	}
}
