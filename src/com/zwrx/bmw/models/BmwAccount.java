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

@Entity
@Table(name = "bmw_account")
public class BmwAccount implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String accountId;		//模块ID
	private String ownerId;			//账户所有人
	private Date addTime;			//添加时间 
	private BigDecimal balance;		//虚拟货币余额
	private Integer score;			//积分
	private String state;			//状态
	private String type;			//类型
	private String payPwd;			//支付密码

	public BmwAccount() {
	}

	public BmwAccount(String accountId) {
		this.accountId = accountId;
	}


	@Id
	@Column(name = "account_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
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

	@Column(name = "owner_ip", length = 32)
	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "add_time", length = 19)
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "balance", precision = 10, scale = 2)
	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	@Column(name = "score")
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "pay_pwd", length = 20)
	public String getPayPwd() {
		return payPwd;
	}

	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}

}
