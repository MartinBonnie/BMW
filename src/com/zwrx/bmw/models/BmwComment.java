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
 * 评价兼评论 by zhiYang
 */
@Entity
@Table(name = "bmw_comment")
public class BmwComment implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String commentId;		//评价ID
	private String userId;			//添加用户
	private String belongId;		//所属编号
	private String type;			//类型  00：订单评价 01：新闻评论
	private String state;			//状态
	private String content;			//评论价内容
	private Date addTime;			//添加时间
	private String title;			//标题

	public BmwComment() {
	}

	public BmwComment(String commentId) {
		this.commentId = commentId;
	}

	@Id
	@Column(name = "comment_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Column(name = "belong_id", length = 32)
	public String getBelongId() {
		return this.belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
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

	@Column(name = "content", length = 500)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


}
