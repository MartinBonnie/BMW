package com.zwrx.bmw.models;


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


@Entity
@Table(name = "bmw_user")
public class BmwUser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String userId;		//用户ID
	private String username;	//用户名
	private String password;	//密码
	private String type;		//用户类型 00：买家 01：一般卖家 02：特殊卖家
	private String state;		//状态 00:未激活状态  01：正常状态 
	private Date addTime;		//添加时间
	private String pwdQuestion;	//密码保护问题
	private String pwdAnswer;	//密码保护答案
	private String email;		//邮箱
	private String name;		//姓名
	private String dist;		//所在地区（BmwSyscode）
	private String address;		//详细地址
	private String zipcode;		//邮政编码
	private String qq;			//qq
	private String msn;			//msn
	private String phone;		//联系电话
	private String cellphone;	//手机号码
	private String fax;			//传真
	private String buyerGrade;	//用户买家等级
	private String sellerGrade;	//用户卖家等级
	private int buyerGradeScore;//买家积分数
	private int sellerGradeScore;//卖家积分数
	private Date editTime;		//上次修改时间
	private String editIp;		//修改IP
	private Date lastTime;		//上次登录时间
	private String lastIp;		//上次登录IP
	
	public BmwUser() {
	}

	public BmwUser(String userId) {
		this.userId = userId;
	}

	@Id
	@Column(name = "user_id", unique = true, nullable = false, length = 32)
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@GeneratedValue(generator = "idGenerator")
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Column(name = "username", length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 32)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	@Column(name = "pwd_question", length = 100)
	public String getPwdQuestion() {
		return pwdQuestion;
	}

	public void setPwdQuestion(String pwdQuestion) {
		this.pwdQuestion = pwdQuestion;
	}

	@Column(name = "pwd_answer", length = 100)
	public String getPwdAnswer() {
		return pwdAnswer;
	}

	public void setPwdAnswer(String pwdAnswer) {
		this.pwdAnswer = pwdAnswer;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "dist", length = 32)
	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	@Column(name = "address", length = 400)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "zipcode", length = 10)
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Column(name = "qq", length = 15)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "msn", length = 20)
	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
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

	@Column(name = "fax", length = 20)
	public String getFax() {
		return fax;
	}
	
	public void setFax(String fax) {
		this.fax = fax;
	}

	@Column(name = "buyer_grade", length = 32)
	public String getBuyerGrade() {
		return buyerGrade;
	}

	public void setBuyerGrade(String buyerGrade) {
		this.buyerGrade = buyerGrade;
	}

	@Column(name = "seller_grade", length = 32)
	public String getSellerGrade() {
		return sellerGrade;
	}

	public void setSellerGrade(String sellerGrade) {
		this.sellerGrade = sellerGrade;
	}

	@Column(name = "buyer_grade_score")
	public Integer getBuyerGradeScore() {
		return buyerGradeScore;
	}

	public void setBuyerGradeScore(Integer buyerGradeScore) {
		this.buyerGradeScore = buyerGradeScore;
	}

	@Column(name = "seller_grade_score")
	public Integer getSellerGradeScore() {
		return sellerGradeScore;
	}

	public void setSellerGradeScore(Integer sellerGradeScore) {
		this.sellerGradeScore = sellerGradeScore;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "edit_time", length = 19)
	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	@Column(name = "edit_ip", length = 20)
	public String getEditIp() {
		return editIp;
	}

	public void setEditIp(String editIp) {
		this.editIp = editIp;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_time", length = 19)
	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	@Column(name = "last_ip", length = 20)
	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}
	@Transient
	public String getTypeName(){
		if(CommonConst.USER_TYPE_BUYER.equals(this.type)){
			return "买家";
		}else if(CommonConst.USER_TYPE_SELLER.equals(this.type)){
			return "一般卖家";
		}else if(CommonConst.USER_TYPE_SELLER_SUPER.equals(this.type)){
			return "超级卖家";
		}else{
			return "";
		}
	}
}
