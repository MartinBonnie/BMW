package com.zwrx.bmw.models;
/**
 * 邮箱实体类(发件箱、收件箱)
 * @author ad
 *
 */
public class MailBox {
	//用户昵称
	private String nickname;
	//邮箱地址
	private String emlAddr;
	//用户名
	private String username;
	//密码
	private String password;
	//smtp发件服务器地址
	private String smtp;
	//smtp发件服务器端口
	private String smtpport;
	//pop/imap收件服务器地址
	private String popimap;
	//pop/imap收件服务器端口
	private String popimapport;
	public MailBox(){
		this.emlAddr="enttest@126.com";
		this.username="enttest";
		this.password="qwerty";
		this.smtp="smtp.126.com";
		this.smtpport="25";
		this.nickname="admin";
	}
	public MailBox(String emlAddr,String username,String password,
			String smtp,String smtpport){
		this.emlAddr=emlAddr;
		this.username=username;
		this.password=password;
		this.smtp=smtp;
		this.smtpport=smtpport;
		this.nickname=emlAddr;
	}
	public MailBox(String emlAddr,String username,String password,
			String smtp,String smtpport,String nickname){
		this.emlAddr=emlAddr;
		this.username=username;
		this.password=password;
		this.smtp=smtp;
		this.smtpport=smtpport;
		this.nickname=nickname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmlAddr() {
		return emlAddr;
	}
	public void setEmlAddr(String emlAddr) {
		this.emlAddr = emlAddr;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSmtp() {
		return smtp;
	}
	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}
	public String getSmtpport() {
		return smtpport;
	}
	public void setSmtpport(String smtpport) {
		this.smtpport = smtpport;
	}
	public String getPopimap() {
		return popimap;
	}
	public void setPopimap(String popimap) {
		this.popimap = popimap;
	}
	public String getPopimapport() {
		return popimapport;
	}
	public void setPopimapport(String popimapport) {
		this.popimapport = popimapport;
	}
}
