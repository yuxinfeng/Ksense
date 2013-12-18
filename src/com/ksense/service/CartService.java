package com.ksense.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ksense.dao.CartDAO;
import com.ksense.model.User;

public class CartService {
	public static String processRequest(HttpServletRequest request){
		String respmessage = null;
		CartDAO cartDAO = new CartDAO();
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("LoginUser");
		if(obj == null){
			respmessage = "Erro";
		}else{
			User user = (User)obj;
			
			if("load".equals(type)){//加载购物车
				respmessage = cartDAO.loadCart(user.getUsername());
			}
			else if("insert".equals(type)){//加入购物车额
				int effectRow = cartDAO.cartInsert(user.getUsername(),request.getParameter("p_id"));
				if(effectRow == 0){
					respmessage="insertFail"; //添加失败
				}else if(effectRow == -1){
					respmessage="insertHave"; //已经在购物车了
				}else{
					respmessage="insertSuccess";
				}
			}
			else if("delete".equals(type)){//删除购物车里面的产品
				int effectRow = cartDAO.cartDelete(user.getUsername(),request.getParameter("p_id"));
				if(effectRow == 0){
					respmessage="updateFail";
				}else{
					respmessage="updateSuccess";
				}
			}
			else if("clear".equals(type)){//清空我的购物车
				int effectRow = cartDAO.cartClear(user.getUsername());
				if(effectRow == 0){
					respmessage="clearFail";
				}else{
					respmessage="clearSuccess";
				}
			}
			else if("order".equals(type)){//由购物车生成订单
				String str = request.getParameter("p_id");
				int effectRow = 0;
				String array[] = str.split(";");
				for(int i=0; i< array.length; i++){
					String splitStr  = array[i];
					effectRow = cartDAO.cartUpdate(user.getUsername(),splitStr.split(",")[0],splitStr.split(",")[1]);
					if(effectRow == 0){
						respmessage="orderFail";
						break;
					}else{
						respmessage="orderSuccess";
					}
				}
			}
		}
		return respmessage;
	}
}
