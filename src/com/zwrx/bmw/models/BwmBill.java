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
@Table(name = "bmw_bill")
public class BwmBill implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String billId;			//支付账单ID
	private String rechargeId;		//对应的充值消费ID
	private String orderId;			//订单号
	private BigDecimal amount;		//总金额
	private String sn;				//处理的流水号
	private String userId;			//操作人ID
	private Date billTime;			//接口调用时间 
	private String state;			//状态
	private String type;			//充值方式 00：支付宝 01：财付通 02：网上银行
	
	public BwmBill() {
	}

	public BwmBill(String billId) {
		this.billId = billId;
	}


	@Id
	@Column(name = "bill_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getBillId() {
		return this.billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
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
	@Column(name = "bill_time", length = 19)
	public Date getBillTime() {
		return billTime;
	}

	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}


	@Column(name = "amount", precision = 10, scale = 2)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "sn", length = 500)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "recharge_id", length = 32)
	public String getRechargeId() {
		return rechargeId;
	}

	public void setRechargeId(String rechargeId) {
		this.rechargeId = rechargeId;
	}



}
