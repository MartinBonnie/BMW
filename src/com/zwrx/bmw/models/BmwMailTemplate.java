package com.zwrx.bmw.models;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;


/**
 * 附件 by zhiYang
 */
@Entity
@Table(name = "bmw_mail_template")
public class BmwMailTemplate implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mailTemplateId;	//ID
	private String name;			//名称
	private String desc;			//描述
	private String content;			//模板内容
	private String type;			//附件类型 00：注册模板 01----
	private String state;			//状态
	private Date addTime;			//添加时间
	

	public BmwMailTemplate() {
	}

	public BmwMailTemplate(String mailTemplateId) {
		this.mailTemplateId = mailTemplateId;
	}

	@Id
	@Column(name = "att_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getMailTemplateId() {
		return this.mailTemplateId;
	}

	public void setMailTemplateId(String mailTemplateId) {
		this.mailTemplateId = mailTemplateId;
	}


	@Column(name = "type", length = 2)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "state", length = 2)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "add_time", length = 19)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "desc", length = 500)
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Column(name = "content", length = 65535)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


}
