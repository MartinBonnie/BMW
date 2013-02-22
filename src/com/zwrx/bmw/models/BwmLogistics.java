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
 * 物流
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_logistics")
public class BwmLogistics implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String logisticsId;		//物流ID
	private String orderId;			//订单ID
	private String logisticsCompany;//物流公司
	private String ticket;			//物流单号
	private Date deliverTime;		//发货时间
	private Date addTime;			//添加时间
	private String state;			//状态
	private String type;			//类型  
	public BwmLogistics() {
	}

	public BwmLogistics(String logisticsId) {
		this.logisticsId = logisticsId;
	}


	@Id
	@Column(name = "logistics_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getLogisticsId() {
		return this.logisticsId;
	}

	public void setLogisticsId(String logisticsId) {
		this.logisticsId = logisticsId;
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

	@Column(name = "order_id", length = 32)
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "logistics_company", length = 32)
	public String getLogisticsCompany() {
		return logisticsCompany;
	}

	public void setLogisticsCompany(String logisticsCompany) {
		this.logisticsCompany = logisticsCompany;
	}

	@Column(name = "ticket", length = 50)
	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}


}
