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
 * 交易  平台上的任何交易都将产生一条此记录和两条recharge记录
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_bill")
public class BwmTransaction implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String transId;			//支付账单ID
	private String fromAccount;		//交易发起账户
	private String toAccount;		//交易收到账户
	private String orderId;			//订单号
	private BigDecimal amountAll;	//总金额
	private BigDecimal amount;		//货币金额
	private Integer	score;			//积分
	private Date startTime;			//交易开始时间 
	private Date endTime;			//交易结束时间 
	private String state;			//状态
	private String type;			//交易类型
	
	public BwmTransaction() {
	}

	public BwmTransaction(String transId) {
		this.transId = transId;
	}


	@Id
	@Column(name = "trans_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getTransId() {
		return this.transId;
	}

	public void setTransId(String transId) {
		this.transId = transId;
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
	@Column(name = "start_time", length = 19)
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_time", length = 19)
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "amount_all", precision = 10, scale = 2)
	public BigDecimal getAmountAll() {
		return amountAll;
	}

	public void setAmountAll(BigDecimal amountAll) {
		this.amountAll = amountAll;
	}
	
	@Column(name = "amount", precision = 10, scale = 2)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "from_account", length = 32)
	public String getFromAccount() {
		return fromAccount;
	}

	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}

	@Column(name = "to_account", length = 32)
	public String getToAccount() {
		return toAccount;
	}

	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}

	@Column(name = "score")
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}




}
