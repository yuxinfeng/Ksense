package com.ksense.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ksense.model.Phone;

import net.sf.json.JSONObject;

/**
 * @author Gavei
 * @date : 2013-12-14 下午03:47:10
 */ 

public class PhoneDAO extends BaseDAO{
	
	public static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
	public String getSaPrice(String p_brand, String p_name){
		String sumList = null;
		
		String sql = "select p_brand, p_name, sa_price from t_phone where p_brand like '%"+p_brand+"%' and p_name like '%"+p_name+"%'";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				String perList = null;
				perList = rs.getString("p_brand")+" "+rs.getString("p_name")+":"+String.valueOf(rs.getDouble("sa_price"));
				if(sumList == null){
					sumList = perList;
				}else{
					sumList = sumList + "\n" + perList;
				}
			}
			if(sumList == null){
				sumList = "抱歉，未找到您想找的机型。原因可能：\n 1、我们尚未有该机型； \n 2、您未按照要求输入查询机型；";
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if(getByteSize(sumList) < 2047){
			return sumList;
		}else{
			return "查询结果太多，系统无法传输，请缩小范围。";
		}
	}
	
	public  String getBrandList(){
		JSONObject resultJSON = new JSONObject();
		String sql = "select distinct(p_brand)as brand_name from t_phone where p_brand is not null";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				String brand_name = rs.getString("brand_name");
				resultJSON.accumulate("brand", brand_name);
				
				String sqls = "select p_id,p_name,p_color,sa_price,remark from t_phone where p_brand = '"+brand_name+"' ";
				PreparedStatement dPS = conn.prepareStatement(sqls);
				ResultSet drs = dPS.executeQuery();
				while(drs.next()){
					resultJSON.accumulate(brand_name, drs.getString("p_id"));
					resultJSON.accumulate(brand_name, drs.getString("p_name"));
					resultJSON.accumulate(brand_name, drs.getString("p_color"));
					resultJSON.accumulate(brand_name, drs.getDouble("sa_price"));
					resultJSON.accumulate(brand_name, drs.getString("remark"));
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return resultJSON.toString();
	}
	
	//新增手机
	public int insertPhone(Phone Phone){
		int effectRows = 0;
		String sql = "insert into t_phone(p_brand,p_name,sa_price) values" +
				"('"+Phone.getpBrand()+"','"+Phone.getpName()+"','"+Phone.getSaPrice()+"')";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRows = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRows;
	}
	
	//删除手机
	public int deletePhone(Phone Phone){
		int effectRows = 0;
		String sql = "delete from t_phone where p_brand = '"+Phone.getpBrand()+"' and p_name = '"+Phone.getpName()+"'";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRows = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRows;
	}
	
	//更新价格
	public int updatePhone(Phone Phone){
		int effectRows = 0;
		String sql = "update t_phone set sa_price='"+Phone.getSaPrice()+"' where p_brand = '"+Phone.getpBrand()+"' and p_name = '"+Phone.getpName()+"'";
		try{
			conn = this.getConnection();
			ps = conn.prepareStatement(sql);
			effectRows = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, ps, rs);
		}
		return effectRows;
	}
	
}

