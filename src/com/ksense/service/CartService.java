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
			
			if("load".equals(type)){//���ع��ﳵ
				respmessage = cartDAO.loadCart(user.getUsername());
			}
			else if("insert".equals(type)){//���빺�ﳵ��
				int effectRow = cartDAO.cartInsert(user.getUsername(),request.getParameter("p_id"));
				if(effectRow == 0){
					respmessage="insertFail"; //���ʧ��
				}else if(effectRow == -1){
					respmessage="insertHave"; //�Ѿ��ڹ��ﳵ��
				}else{
					respmessage="insertSuccess";
				}
			}
			else if("delete".equals(type)){//ɾ�����ﳵ����Ĳ�Ʒ
				int effectRow = cartDAO.cartDelete(user.getUsername(),request.getParameter("p_id"));
				if(effectRow == 0){
					respmessage="updateFail";
				}else{
					respmessage="updateSuccess";
				}
			}
			else if("clear".equals(type)){//����ҵĹ��ﳵ
				int effectRow = cartDAO.cartClear(user.getUsername());
				if(effectRow == 0){
					respmessage="clearFail";
				}else{
					respmessage="clearSuccess";
				}
			}
			else if("order".equals(type)){//�ɹ��ﳵ���ɶ���
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
