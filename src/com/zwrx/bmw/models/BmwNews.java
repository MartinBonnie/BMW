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
 * 新闻
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_news")
public class BmwNews implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String newsId;			//新闻ID
	private String userId;			//添加人ID
	private String category;		//分类（就一级分类）
	private String title;			//标题
	private String content;			//新闻内容
	private String nkey;			//关键字
	private Date addTime;			//添加时间
	private String state;			//状态
	
	public BmwNews() {
	}

	public BmwNews(String newsId) {
		this.newsId = newsId;
	}


	@Id
	@Column(name = "news_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getNewsId() {
		return this.newsId;
	}

	public void setNewsId(String newsId) {
		this.newsId = newsId;
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

	@Column(name = "category", length = 32)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 65535)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "nkey", length = 100)
	public String getNkey() {
		return nkey;
	}

	public void setNkey(String nkey) {
		this.nkey = nkey;
	}




}
