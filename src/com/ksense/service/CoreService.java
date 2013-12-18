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
 * 核心服务类
 * 
 * @author gavei_won
 * @date 2013-07-25
 */
public class CoreService {
	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			
			//如果回复的是文本
			if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
				String reqContent = requestMap.get("Content");
				//回复1 返回个人菜单
				if(reqContent.trim().equals("1")){
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setFuncFlag(0);
					
					List<Article> articleList = new ArrayList<Article>();
					// 单图文消息
						Article article1 = new Article();
						article1.setTitle("星蜂小助手 \n在线询价与订货平台");
						article1.setPicUrl("http://starbee.duapp.com/images/logo.png");


						Article article2 = new Article();
						article2.setTitle("在线订货");
						article2.setPicUrl("http://starbee.duapp.com/images/zaixiandinghuo.png");
						article2.setUrl("http://starbee.duapp.com");
						
						
						Article article3 = new Article();
						article3.setTitle("王言峰：13952264764、13375107667");
						
						articleList.add(article1);
						articleList.add(article2);
						articleList.add(article3);
						
						
//						if("of5pat9wyVI7ErIDtUYoojKTxqBQ".equals(fromUserName) ||"of5pat9XIaN0z7K1CfvQg3JVrCLg".equals(fromUserName)){
//							Article article7 = new Article();
//							article7.setTitle("价格修改");
//							article7.setPicUrl("http://starbee.duapp.com/Images/xinpintejia.png");
//							article7.setUrl("http://starbee.duapp.com/updateServlet");
//							articleList.add(article7);
//						}
						
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
				} 
				//回复 ？ 返回菜单
				else if(reqContent.trim().equals("？") || reqContent.trim().equals("?")){
					textMessage.setContent(getMainMenu());
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
				
				else if(reqContent.indexOf("+") == -1){
					textMessage.setContent("查询报价，必须包含“+”号哦~");
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
						textMessage.setContent("是不是输了好几个“+”号？只能一个哦~");
					}
					
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
				
			}
			
			//如果是新的关注信息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				
				String eventType = requestMap.get("Event");
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					textMessage.setContent(getMainMenu());
					respMessage = MessageUtil.textMessageToXml(textMessage);
				}
			}
			else{
				textMessage.setContent("系统现在尚未支持语音、图片等。");
				respMessage = MessageUtil.textMessageToXml(textMessage);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}

	/**
	 * emoji表情转换(hex -> utf-16)
	 * 
	 * @param hexEmoji
	 * @return
	 */
	public static String emoji(int hexEmoji) {
		return String.valueOf(Character.toChars(hexEmoji));
	}
	
	public static String getMainMenu() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("您好，欢迎光临星蜂科技。").append("\n\n");
		buffer.append("回复【品牌+型号】，即可查询星蜂最新报价。").append("\n");
		buffer.append("例：三星+note3").append("\n");
		buffer.append("回复【1】，显示 个人中心。").append("\n");
		buffer.append("回复【?】，显示 帮助菜单。").append("\n");
		return buffer.toString();
	}
}
