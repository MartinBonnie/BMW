package com.zwrx.bmw.models;

import java.math.BigDecimal;
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
@Table(name = "bmw_category")
public class BwmCategory implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String categoryId;		//产品分类ID
	private String userId;			//操作人ID
	private Date addTime;			//添加时间
	private String belongId;		//父类
	private String name;			//分类名称
	private String desc;			//描述
	private String grade;			//分类级别
	private String isRoot;			//是否根分类
	private String isDisplay;		//是否显示
	private String state;			//状态
	private String type;			//类型
	private Integer sort;			//排序
	
	public BwmCategory() {
	}

	public BwmCategory(String categoryId) {
		this.categoryId = categoryId;
	}


	@Id
	@Column(name = "category_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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

	@Column(name = "belong_id", length = 32)
	public String getBelongId() {
		return belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
	}

	@Column(name = "grade", length = 2)
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Column(name = "is_root", length = 2)
	public String getIsRoot() {
		return isRoot;
	}

	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}

	@Column(name = "is_display", length = 2)
	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}



}
