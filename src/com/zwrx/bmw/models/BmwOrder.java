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
 * 订单
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_order")
public class BmwOrder implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String orderId;			//订单ID
	private BigDecimal amountAll;	//总金额
	private BigDecimal amount;		//平台货币
	private Integer score;			//积分
	private String userId;			//下单人ID
	private Date addTime;			//添加时间 
	private String dealState;		//交易状态
	private String state;			//状态
	private String type;			//订单类型 00：斗价街 01：特价专区 02：斗价街+特价区
	private BigDecimal logisticsAmounts;	//物流总金额
	private String desc;			//备注
	private String address;			//收获地址
	private String productId;		//产品Id
	private Integer	prodCount;		//产品数量
	private Date deliverTime;		//发货时间
	private Date returnTime;		//退货时间
	private Date settleTime;		//结算时间
	
	public BmwOrder() {
	}

	public BmwOrder(String orderId) {
		this.orderId = orderId;
	}


	@Id
	@Column(name = "order_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "deliver_time", length = 19)
	public Date getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "return_time", length = 19)
	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "settle_time", length = 19)
	public Date getSettleTime() {
		return settleTime;
	}

	public void setSettleTime(Date settleTime) {
		this.settleTime = settleTime;
	}
	@Column(name = "amount", precision = 10, scale = 2)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "amount_all", precision = 10, scale = 2)
	public BigDecimal getAmountAll() {
		return amountAll;
	}

	public void setAmountAll(BigDecimal amountAll) {
		this.amountAll = amountAll;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "score")
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "deal_state", length = 2)
	public String getDealState() {
		return dealState;
	}

	public void setDealState(String dealState) {
		this.dealState = dealState;
	}

	@Column(name = "logistics_amounts", precision = 10, scale = 2)
	public BigDecimal getLogisticsAmounts() {
		return logisticsAmounts;
	}

	public void setLogisticsAmounts(BigDecimal logisticsAmounts) {
		this.logisticsAmounts = logisticsAmounts;
	}

	@Column(name = "desc", length = 1000)
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Column(name = "address", length = 32)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "product_id", length = 32)
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@Column(name = "prod_count")
	public Integer getProdCount() {
		return prodCount;
	}

	public void setProdCount(Integer prodCount) {
		this.prodCount = prodCount;
	}




}
