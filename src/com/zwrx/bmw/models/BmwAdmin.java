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

@Entity
@Table(name = "bmw_admin")
public class BmwAdmin implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String adminId;		//管理员ID	
	private String username;	//用户名（可修改）
	private String password;	//密码
	private String type;		//类型 00：超级管理员 01：一般管理员
	private String state;		//状态
	private Date addTime;		//添加时间
	private String name;		//姓名
	private String email;		//邮箱
	private String gender;		//性别
	private String cellphone;	//手机
	private String adesc;		//描述
	private Date editTime;		//上次修改时间
	private String editIp;		//修改IP
	private Date lastTime;		//上次登录时间
	private String lastIp;		//上次登录IP
	
	public BmwAdmin() {
	}

	public BmwAdmin(String adminId) {
		this.adminId = adminId;
	}


	@Id
	@Column(name = "admin_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getAdminId() {
		return this.adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	@Column(name = "username", length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 32)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "type", length = 2)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "state", length = 2)
	public String getState() {
		return state;
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

	@Column(name = "name", length = 10)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "gender", length = 2)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "cellphone", length = 11)
	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	@Column(name = "adesc", length = 100)
	public String getAdesc() {
		return adesc;
	}

	public void setAdesc(String adesc) {
		this.adesc = adesc;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "edit_time", length = 19)
	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	@Column(name = "edit_ip", length = 20)
	public String getEditIp() {
		return editIp;
	}

	public void setEditIp(String editIp) {
		this.editIp = editIp;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_time", length = 19)
	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	@Column(name = "last_ip", length = 20)
	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

}
