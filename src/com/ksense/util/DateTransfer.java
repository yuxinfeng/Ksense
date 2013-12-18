package com.ksense.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * @author Gavei
 * @date : 2013-12-12 上午12:52:52
 */

public class DateTransfer {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//用来做date对string的转换
	public static String DateToString(Date date){
		String transferString = null;
		
		if(date == null){
			date = new Date();
		}
		transferString = sdf.format(date);
		return transferString;
	}
	
}
