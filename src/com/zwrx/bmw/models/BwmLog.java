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
 * 网上支付账单
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_log")
public class BwmLog implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String logId;			//支付账单ID
	private String isAdmin;			//是否是管理员  00：管理员 01：一般用户 02：未登录用户
	private String logClass;		//级别  顶级00  二级01
	private String userId;			//操作人ID
	private Date addTime;			//添加时间
	private String name;			//被操作对象
	private String desc;			//描述
	private String state;			//状态
	private String type;			//日志类型
	
	public BwmLog() {
	}

	public BwmLog(String logId) {
		this.logId = logId;
	}


	@Id
	@Column(name = "log_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getLogId() {
		return this.logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
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
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "is_admin", length = 2)
	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Column(name = "log_class", length = 2)
	public String getLogClass() {
		return logClass;
	}

	public void setLogClass(String logClass) {
		this.logClass = logClass;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "desc", length = 400)
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}



}
