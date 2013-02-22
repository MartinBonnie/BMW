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
 * 斗价期次表
 * @author zhiYang
 *
 */

@Entity
@Table(name = "bmw_timedj")
public class BmwTimeDJ implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String timedjId;	//ID
	private String startHour;	//起始小时
	private String startMinute;	//起始分钟
	private String endHour;		//终止小时
	private String endMinute;	//终止分钟
	private String state;		//状态
	private Date addTime;		//添加时间
	private String name;		//其次名称
	

	public BmwTimeDJ() {
	}

	public BmwTimeDJ(String timedjId) {
		this.timedjId = timedjId;
	}

	@Id
	@Column(name = "timedj_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@GeneratedValue(generator = "idGenerator")
	public String getTimedjId() {
		return this.timedjId;
	}

	public void setTimedjId(String timedjId) {
		this.timedjId = timedjId;
	}


	@Column(name = "state", length = 2)
	public String getState() {
		return state;
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

	@Column(name = "start_hour", length = 2)
	public String getStartHour() {
		return startHour;
	}

	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}

	@Column(name = "start_minute", length = 2)
	public String getStartMinute() {
		return startMinute;
	}

	public void setStartMinute(String startMinute) {
		this.startMinute = startMinute;
	}

	@Column(name = "end_hour", length = 2)
	public String getEndHour() {
		return endHour;
	}

	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	
	@Column(name = "end_minute", length = 2)
	public String getEndMinute() {
		return endMinute;
	}

	public void setEndMinute(String endMinute) {
		this.endMinute = endMinute;
	}
	
	@Column(name = "name", length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
