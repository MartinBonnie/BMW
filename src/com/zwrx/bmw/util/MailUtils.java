package com.zwrx.bmw.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.zwrx.bmw.models.Mail;
import com.zwrx.bmw.models.MailBox;
import com.zwrx.bmw.models.MailInfo;

public class MailUtils {
	public static void main(String[] args) {
		MailBox box=new MailBox();
		MailInfo eml=new MailInfo("405787028@qq.com","赵志洋");
		sendMail(box,eml);
	}
	/**
	 * 发送一封邮件
	 * @param box	发件箱
	 * @param eml	邮件信息
	 */
	public static void sendMail(MailBox box,MailInfo eml){
		Mail mail=new Mail(box.getSmtp(),box.getUsername(),box.getPassword(),box.getSmtpport());
		mail.setNeedAuth(true);			
		mail.setFrom(box.getNickname(),box.getEmlAddr());		
		//mail.setReplySign();//设置自动回执标志
		//mail.setPriority("");设置邮件优先级		
		mail.setTo(eml.getTo());
		mail.setTo(eml.getTo(), eml.getToUser());
		mail.setSubject(eml.getSubject());		
		mail.setBody(eml.getBody());		
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		mail.setSendDate(df.format(new Date()));
		String strMailSendMessage=mail.sendoutEx();
		if("".equals(strMailSendMessage)){
			//System.out.println("邮件发送成功!");
		}else{
			System.out.println("邮件发送失败，原因："+strMailSendMessage);
		}
	}
}
