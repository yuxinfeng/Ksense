package com.ksense.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ksense.dao.PhoneDAO;
import com.ksense.respone.Article;
import com.ksense.respone.NewsMessage;
import com.ksense.respone.TextMessage;
import com.ksense.util.MessageUtil;

/**
 * ���ķ�����
 * 
 * @author gavei_won
 * @date 2013-07-25
 */
public class CoreService {
	/**
	 * ����΢�ŷ���������
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// xml�������
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// ���ͷ��ʺţ�open_id��
			String fromUserName = requestMap.get("FromUserName");
			// �����ʺ�
			String toUserName = requestMap.get("ToUserName");
			// ��Ϣ����
			String msgType = requestMap.get("MsgType");
			
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			
			//����ظ������ı�
			if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
				String reqContent = requestMap.get("Content");
				//�ظ�1 ���ظ��˲˵�
				if(reqContent.trim().equals("1")){
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setFuncFlag(0);
					
					List<Article> articleList = new ArrayList<Article>();
					// ��ͼ����Ϣ
						Article article1 = new Article();
						article1.setTitle("�Ƿ�С���� \n����ѯ���붩��ƽ̨");
						article1.setPicUrl("http://starbee.duapp.com/images/logo.png");


						Article article2 = new Article();
						article2.setTitle("���߶���");
						article2.setPicUrl("http://starbee.duapp.com/images/zaixiandinghuo.png");
						article2.setUrl("http://starbee.duapp.com");
						
						
						Article article3 = new Article();
						article3.setTitle("���Է壺13952264764��13375107667");
						
						articleList.add(article1);
						articleList.add(article2);
						articleList.add(article3);
						
						
//						if("of5pat9wyVI7ErIDtUYoojKTxqBQ".equals(fromUserName) ||"of5pat9XIaN0z7K1CfvQg3JVrCLg".equals(fromUserName)){
//							Article article7 = new Article();
//							article7.setTitle("�۸��޸�");
//							article7.setPicUrl("http://starbee.duapp.com/Images/xinpintejia.png");
//							article7.setUrl("http://starbee.duapp.com/updateServlet");
//							articleList.add(article7);
//						}
						
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
				} 
				//�ظ� �� ���ز˵�
				else if(reqContent.trim().equals("��") || reqContent.trim().equals("?")){
					textMessage.setContent(getMainMenu());
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
				
				else if(reqContent.indexOf("+") == -1){
					textMessage.setContent("��ѯ���ۣ����������+����Ŷ~");
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
				else{
					PhoneDAO phoneDAO = new PhoneDAO();
					
					String[] arry = reqContent.split("[+]");
					if(arry.length == 0 ){
						textMessage.setContent(phoneDAO.getSaPrice("%","%"));
					}
					else if (arry.length == 1){
						textMessage.setContent(phoneDAO.getSaPrice(arry[0].trim(),"%"));
					}
					else if(arry.length == 2){
						if(arry[0] == null){
							textMessage.setContent(phoneDAO.getSaPrice("%",arry[1]).trim());
						}else{
							textMessage.setContent(phoneDAO.getSaPrice(arry[0].trim(),arry[1]).trim());
						}
					}
					else{
						textMessage.setContent("�ǲ������˺ü�����+���ţ�ֻ��һ��Ŷ~");
					}
					
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
				
			}
			
			//������µĹ�ע��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				
				String eventType = requestMap.get("Event");
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					textMessage.setContent(getMainMenu());
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
			}
			else{
				textMessage.setContent("ϵͳ������δ֧��������ͼƬ�ȡ�");
				respMessage = MessageUtil.textMessageToXml(textMessage);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}

	/**
	 * emoji����ת��(hex -> utf-16)
	 * 
	 * @param hexEmoji
	 * @return
	 */
	public static String emoji(int hexEmoji) {
		return String.valueOf(Character.toChars(hexEmoji));
	}
	
	public static String getMainMenu() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("���ã���ӭ�����Ƿ�Ƽ���").append("\n\n");
		buffer.append("�ظ���Ʒ��+�ͺš������ɲ�ѯ�Ƿ����±��ۡ�").append("\n");
		buffer.append("��������+note3").append("\n");
		buffer.append("�ظ���1������ʾ �������ġ�").append("\n");
		buffer.append("�ظ���?������ʾ �����˵���").append("\n");
		return buffer.toString();
	}
}
