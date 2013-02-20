package com.zwrx.bmw.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "bmw_module")
public class BwmModule implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String moduleId;		//模块ID
	private String name;			//模块名称
	private String url;				//模块url 
	private String type;			//类型
	private String sdesc;			//描述
	private String state;			//状态

	public BwmModule() {
	}

	public BwmModule(String moduleId) {
		this.moduleId = moduleId;
	}


	@Id
	@Column(name = "module_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	@Column(name = "type", length = 2)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "name", length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sdesc", length = 400)
	public String getSdesc() {
		return this.sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}


	@Column(name = "state", length = 2)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "url", length = 500)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
