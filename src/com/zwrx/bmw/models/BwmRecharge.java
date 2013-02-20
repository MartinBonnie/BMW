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
@Table(name = "bmw_recharge")
public class BwmRecharge implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String rechargeId;		//充值消费ID
	private String flag;			//支出还是收入 00为收入 01为支出
	private BigDecimal amountAll;	//总金额
	private BigDecimal amount;		//货币金额
	private Integer score;			//积分
	private String evidence;		//充值凭证号，银行充值时为流水号 购买物品时为订单号
	private String operator;		//操作人
	private String accountId;		//账户ID
	private Date addTime;			//添加时间 
	private String state;			//状态
	private String type;			//类型
	private String orderId;			//订单号
	private String productId;		//产品ID
	
	public BwmRecharge() {
	}

	public BwmRecharge(String rechargeId) {
		this.rechargeId = rechargeId;
	}


	@Id
	@Column(name = "recharge_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getRechargeId() {
		return this.rechargeId;
	}

	public void setRechargeId(String rechargeId) {
		this.rechargeId = rechargeId;
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

	@Column(name = "score")
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "flag", length = 2)
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
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

	@Column(name = "evidence", length = 500)
	public String getEvidence() {
		return evidence;
	}

	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}

	@Column(name = "operator", length = 32)
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Column(name = "account_id", length = 32)
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "product_id", length = 32)
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}


}
