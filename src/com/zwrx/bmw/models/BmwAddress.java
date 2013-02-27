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
 * 收货地址
 * @author zhiYang
 *
 */
@Entity
@Table(name = "bmw_address")
public class BmwAddress implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String addressId;		//地址ID
	private String userId;			//操作人ID
	private String province;		//省份
	private String city;			//城市
	private String dist;			//地区
	private Date addTime;			//添加时间
	private String state;			//状态
	private String type;			//日志类型
	private String receiver;
	private String zipcode;
	private String address;
	private String phone;
	private String cellphone;
	
	public BmwAddress() {
	}

	public BmwAddress(String addressId) {
		this.addressId = addressId;
	}


	@Id
	@Column(name = "address_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getAddressId() {
		return this.addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
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

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "province", length = 32)
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Column(name = "city", length = 32)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "dist", length = 32)
	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	@Column(name = "receiver", length = 32)
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Column(name = "zipcode", length = 6)
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Column(name = "address", length = 500)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "cellphone", length = 11)
	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}




}
