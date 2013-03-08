package com.zwrx.bmw.models;
/**
 * 邮件信息类
 * @author ad
 *
 */
public class MailInfo {
	//邮件主题(邮件主题)
	private String subject;
	//发件箱地址
	private String from;
	//收件箱地址(支持一个)
	private String to;
	//收件人昵称
	private String toUser;
	//抄送人地址(;分隔)
	private String copycc;
	//附件名(;分隔)
	private String filepath;
	//邮件正文
	private String body;
	//邮件回执标志(0:不要，1：要)
	private String needrt;
	//邮件优先级
	private String priority;
	//发送日期
	private String senddate;
	//定时发送日期
	private String delaytime;
	public MailInfo(String to){
		this.subject=to+",恭喜您!成功注册斗价网！";
		this.from="enttest@126.com";
		this.toUser=to;
		this.copycc="";
		this.filepath="";
		this.to=to;
		this.body="<html><body>欢迎你注册斗价网！<br/><img src=\"/BMW/files/main.jpg\""+
				" width=\"150px\" height=\"150px\" alt=\"点我啊亲\"/>"+
				"<hr/><p><a href=\"http://localhost/BMW/user/\" >点击链接激活</a></p><br/>"				
				+"该邮件不必回复。"+"</body></html>";
	}
	public MailInfo(String to,String toUser){
		this.subject=toUser+",恭喜您!成功注册斗价网！";
		this.from="enttest@126.com";
		this.toUser=toUser;
		//this.copycc="";
		//this.filepath="";
		this.to=to;
		this.body="<html><body>欢迎你注册斗价网！<br/><img src=\"/BMW/files/main.jpg\""+
				" width=\"150px\" height=\"150px\" alt=\"点我啊亲\"/>"+
				"<hr/><p><a href=\"http://localhost/BMW/user/\" >点击链接激活</a></p><br/>"				
				+"该邮件不必回复。"+"</body></html>";
	}
	public MailInfo(String subject,String from,String to,
			String body){
		this.subject=subject;
		this.from=from;
		this.to=to;
		this.body=body;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getToUser() {
		return toUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public String getCopycc() {
		return copycc;
	}
	public void setCopycc(String copycc) {
		this.copycc = copycc;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getNeedrt() {
		return needrt;
	}
	public void setNeedrt(String needrt) {
		this.needrt = needrt;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getDelaytime() {
		return delaytime;
	}
	public void setDelaytime(String delaytime) {
		this.delaytime = delaytime;
	}
	
}
