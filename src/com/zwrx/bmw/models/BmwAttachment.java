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
import javax.persistence.Transient;
import org.hibernate.annotations.GenericGenerator;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.ConfConst;
import com.zwrx.bmw.util.StringUtil;


/**
 * 附件 by zhiYang
 */
@Entity
@Table(name = "bmw_attachment")
public class BmwAttachment implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String attId;			//附件ID
	private String userId;			//添加用户
	private String belongType;		//所属类型
	private String belongId;		//所属编号
	private String type;			//附件类型
	private String state;			//状态
	private String serverPath;		//存储路径
	private Date uploadTime;		//上传时间
	private BigDecimal fileSize;
	

	public BmwAttachment() {
	}

	public BmwAttachment(String attId) {
		this.attId = attId;
	}

	@Id
	@Column(name = "att_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	public String getAttId() {
		return this.attId;
	}

	public void setAttId(String attId) {
		this.attId = attId;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Column(name = "belong_type", length = 2)
	public String getBelongType() {
		return this.belongType;
	}

	public void setBelongType(String belongType) {
		this.belongType = belongType;
	}

	@Column(name = "belong_id", length = 32)
	public String getBelongId() {
		return this.belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
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

	@Column(name = "server_path", length = 400)
	public String getServerPath() {
		return this.serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}

	
	@Column(name = "file_size", precision = 10, scale = 4)
	public BigDecimal getFileSize() {
		return fileSize;
	}

	public void setFileSize(BigDecimal fileSize) {
		this.fileSize = fileSize;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "upload_time", length = 19)
	public Date getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	
	@Transient
	public String getFileSvrPath(){
		if(StringUtil.isBlank(serverPath))
			return ConfConst.FILE_SVR+CommonConst.NO_PHOTO;
		else
		return ConfConst.FILE_SVR+serverPath;
	}

}
