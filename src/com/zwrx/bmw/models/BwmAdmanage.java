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
@Table(name = "bmw_admanage")
public class BwmAdmanage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String adId;			//广告ID
	private String posId;			//位置Id  对应Syscode
	private String type;			//广告类型
	private String adPath;			//广告路径
	private Date addTime;			//添加时间
	private String adTitle;			//广告标题
	private String adLevel;		//优先级
	private String adDesc;			//广告描述
	private String adUrl;			//链接
	private String adminId;			//添加人账号admin
	private String state;			//状态
	
	public BwmAdmanage() {
	}

	public BwmAdmanage(String adId) {
		this.adId = adId;
	}


	@Id
	@Column(name = "ad_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getAdId() {
		return this.adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
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

	@Column(name = "admin_id", length = 32)
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	@Column(name = "pos_id", length = 32)
	public String getPosId() {
		return posId;
	}

	public void setPosId(String posId) {
		this.posId = posId;
	}

	@Column(name = "ad_path", length = 200)
	public String getAdPath() {
		return adPath;
	}

	public void setAdPath(String adPath) {
		this.adPath = adPath;
	}

	@Column(name = "ad_title", length = 100)
	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	@Column(name = "ad_level", length = 2)
	public String getAdLevel() {
		return adLevel;
	}

	public void setAdLevel(String adLevel) {
		this.adLevel = adLevel;
	}

	@Column(name = "ad_desc", length = 200)
	public String getAdDesc() {
		return adDesc;
	}

	public void setAdDesc(String adDesc) {
		this.adDesc = adDesc;
	}

	@Column(name = "url", length = 200)
	public String getAdUrl() {
		return adUrl;
	}

	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}



}
