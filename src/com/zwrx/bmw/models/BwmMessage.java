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
 * 消息
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_message")
public class BwmMessage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String messageId;		//ID
	private String userId;			//添加人ID
	private String title;			//标题
	private String content;			//内容
	private String belongId;		//回复Id
	private Date addTime;			//添加时间
	private String receiveId;		//接受者Id
	private String readState;		//是否已读 00:未读 01：已读
	private String state;			//状态
	private String type;			//类型 00：用户消息 01：系统消息
	
	public BwmMessage() {
	}

	public BwmMessage(String messageId) {
		this.messageId = messageId;
	}


	@Id
	@Column(name = "message_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getMessageId() {
		return this.messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
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

	@Column(name = "belong_id", length = 32)
	public String getBelongId() {
		return belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
	}

	@Column(name = "receive_id", length = 32)
	public String getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}

	@Column(name = "read_state", length = 2)
	public String getReadState() {
		return readState;
	}

	public void setReadState(String readState) {
		this.readState = readState;
	}

	@Column(name = "type", length = 2)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}




}
