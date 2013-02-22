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
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Store;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * 网上支付账单
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_product")
public class BwmProduct implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String productId;		//产品ID
	private String name;			//产品名称
	private String pkey;			//产品关键字
	private Date addTime;			//添加时间 
	private Date startTime;			//斗价开始时间 
	private Date endTime;			//斗价结束时间 
	private BigDecimal basicPrice;	//产品单价
	private BigDecimal sellPrice;	//当前销售单价
	private int sellCount;			//销售量
	private	int stock;				//库存
	private String unit;			//产品计量单位 个还是件还是台等
	private String userId;			//产品所有者
	private String state;			//状态
	private String type;			//类型  00：斗价区  01：特价区  02：斗价区转特价区
	private String staticUrl;		//静态化后的链接
	private String desc;			//产品描述
	private String comTimes;		//斗价期次
	public BwmProduct() {
	}

	public BwmProduct(String productId) {
		this.productId = productId;
	}


	@Id
	@Column(name = "product_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
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

	@Column(name = "basic_price", precision = 10, scale = 2)
	public BigDecimal getBasicPrice() {
		return basicPrice;
	}

	public void setBasicPrice(BigDecimal basicPrice) {
		this.basicPrice = basicPrice;
	}

	@Column(name = "sell_price", precision = 10, scale = 2)
	public BigDecimal getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(BigDecimal sellPrice) {
		this.sellPrice = sellPrice;
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

	@Column(name = "pkey", length = 100)
	public String getPkey() {
		return pkey;
	}

	public void setPkey(String pkey) {
		this.pkey = pkey;
	}

	@Column(name = "sell_count")
	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	@Column(name = "stock")
	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Column(name = "unit", length = 20)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "static_url", length = 100)
	public String getStaticUrl() {
		return staticUrl;
	}

	public void setStaticUrl(String staticUrl) {
		this.staticUrl = staticUrl;
	}

	@Column(name = "desc", length = 65535)
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Column(name = "com_times", length = 32)
	public String getComTimes() {
		return comTimes;
	}

	public void setComTimes(String comTimes) {
		this.comTimes = comTimes;
	}


}
