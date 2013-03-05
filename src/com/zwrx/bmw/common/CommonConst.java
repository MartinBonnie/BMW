package com.zwrx.bmw.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CommonConst {
	/**
	 * 网站信息
	 */
	
	public static String SEP = System.getProperty("file.separator");			// 文件夹分隔符
	public static String REALPATH;												// 应用部署在硬盘上的路径
	public static String CLASSPATH;												// jee应用对应WEB-INF/classes的硬盘路径
	public static String FOLDER_UPLOAD = "";									// 文件上传路径
	public static String APP_PROP_FILE = "conf.properties";						// 配置文件
	public static String CONTEXTROOT;
	public static String SITEINFOFILEPATH;
	public static String SITEMODULESFILEPATH;
	public static Map<String, String> languagePack = new HashMap<String, String>();			

	
	public static String SUCCESS = "success";									//固定字符
	public static String FAILURE = "failure";									//固定字符

	/**
	 * 数据表中的所有state状态表的内容
	 */
	public static String STATE_INIT = "00";										//初始化
	public static String STATE_NORMAL = "01";									//正常
	public static String STATE_DEL = "09";										//删除
	
	public static String SUCCESS_INITATION = "函数初始化！";
	public static String SUCCESS_DESC = "操作成功！";
	public static String SUCCESS_DELETE = "删除成功！";
	public static String SUCCESS_ADD="添加成功!";
	public static String SUCCESS_EDIT="修改成功!";
	
	/**
	 * 网站同步的变量
	 */
	public static String FOLDER_TEMPLATE = "template";
	public static String FOLDER_HTML = "html";
	public static String FOLDER_HTML_WANGPU = "wangpu";
	public static String FOLDER_PICTURE = "picture";
	
	/**
	 * 固定信息
	 */
	public static String NOT_LOGIN = "请先登录！";								//未登录提示信息
	public static String LOGIN_ERROR = "用户名或者密码错误";						//用户名密码输入提示
	public static String VERIFY_CODE_ERROR = "验证码错误";						//验证码输入错误提示
	public static String USERNAME_PASSWORD_NULL_ERROR = "用户名或者密码不能为空";	//用户名密码为空提示
	public static String USERNAME_EXISTED_EROOR = "用户名已经被注册";				//注册时用户名已存在提示
	public static String EMAIL_EXISTED_EROOR = "email地址已经被注册";				//注册时邮箱已存在提示
	public static String UPDATE_EROOR = "修改失败，请稍候再试!";					//修改操作失败提示
	public static String ADD_ERROR = "添加失败，请稍后再试！";						//新增操作失败提示
	public static String ADD_SUCCESS = "添加成功！";
	public static String DEL_SUCCESS = "删除成功！";
	public static String DEL_ERROR = "删除失败！";
	public static String SEND_SUCCESS = "消息发送成功！";
	public static String ADD_SUCCESS_REFLESH = "添加成功，请刷新页面查看最新数据！";
	public static String USERNAME_RULE = "用户名只能为数字、英文字母、汉字和\"_\"，并且长度在6-20位";
	public static String EMAIL_RULE = "email必须为xx@xx.xx格式";
	public static String POSTCODE_RULE = "邮编必须是6位数字";
	public static String PHONE_NUMBER_RULE = "电话号码格式：010-67676767";
	public static String CELLPHONE_NUMBER_RULE = "手机号码格式：11位数字且以1开头";
	public static String PASSWORD_RULE = "密码必须为6-15位，且必须有英文字母和数字";
	public static String REGEX_USERNAME = "[\\w\u4e00-\u9fa5]{6,20}(?<!_)";		//用户名正则表达式
	public static String REGEX_EMAIL = "\\w+\\@\\w+\\.\\w{2,}";					//emai正则表达式
	public static String REGEX_POSTCODD = "^[1-9]\\d{5}";						//邮编正则表达式
	public static String REGEX_PHONENUMBER = "^[0]\\d{2,3}\\-\\d{7,8}";			//普通电话正则表达式
	public static String REGEX_PASSWORD = "^[a-zA-z]{1}[a-zA-Z0-9]{5,14}";		//密码正则表达式
	public static String REGEX_CELLPHONE = "^[1][\\d]{10}";						//手机号码正则表达式
	public static String VERICODE = "vericode";
	public static String NORESULT = "没有相应的查询结果";
	public static String GRADE_ERROR_SMALL="等级设置的最小值不合规范";
	public static String GRADE_ERROR_LARGE="等级设置的最大值不合规范";
	public static String GRADE_ERROR_NORMAL="等级设置的最大值要大于最小值";
	/**
	 * Session相关
	 */
	public static String SESSION_USER = "bmwUser";								//用户登录系统后存session时的key
	public static String SESSION_ADMIN = "bmwAdmin";							//管理员登录系统后存session时的key
	public static final String APPLICATION_AUDIT_USERS="auditedUsers";			//认证审核时用到
	public static final String SESSIONATTACHMENTS = "tempattachments";
	
	/**
	 * 附件表类型
	 */
	public static String PICTURE = "01";
	public static String NEWSTITLEPICTURE = "03";
	public static String MAILATTACHMENT = "02";
	
	/**
	 * 固定页面的匹配表示
	 */
	public static String USER_LOGIN_PAGE = "/customer/login.jsp";				//用户登录页面
	public static String ADMIN_LOGIN_PAGE = "/admin/login.jsp";					//管理员登录页面
	public static String BANNED_PAGE = "/banned.html";							//

	/**
	 * 管理员类型
	 */
	public static String ADMIN_TYPE_SUPER = "00"; 								//超级管理员
	public static String ADMIN_TYPE_NORMAL = "01"; 								//普通管理员

	/**
	 * 用户类型
	 */
	public static String USER_TYPE_BUYER="00";									//买家
	public static String USER_TYPE_SELLER="01";									//一般卖家
	public static String USER_TYPE_SELLER_SUPER="02";							//超级卖家
	
	public static String USER_AUDIT_INIT="00";									//未实名认证用户
	public static String USER_AUDIT_NORMAL="01";								//实名认证用户
	
	/**
	 * 系统编码表类型
	 */
	public static String SYSCODE_TYPE_AUDIT = "11"; 							// 审核
	public static String SYSCODE_TYPE_PROVINCE = "01"; 							// 省
	public static String SYSCODE_TYPE_CITY = "02"; 								// 城市
	public static String SYSCODE_TYPE_DIST = "03"; 								// 地区
	public static String SYSCODE_TYPE_INDUSTY = "20"; 							// 所属行业
	public static String SYSCODE_TYPE_BANNED_KEY = "40"; 						// 屏蔽字
	public static String SYSCODE_TYPE_AD_POS = "99"; 							// 广告位置
	public static String SYSCODE_TYPE_USER_GRADE = "42"; 						// 用户买家等级
	public static String SYSCODE_TYPE_SELLER_USER_GRADE = "44"; 				// 用户卖家等级
	public static String SYSCODE_TYPE_GOOD_TYPE = "60"; 						// 商城产品分类

	/**
	 * 系统编码表级别
	 */
	public static String SYSCODE_CLASS_TOP = "00";								//第一级
	public static String SYSCODE_CLASS_SECONDDARY = "01";						//第二级

	/**
	 * log操作的类型
	 */
	public static String LOG_LOGOUT = "05";										//登出
	public static String LOG_LOGIN = "04";										//登入
	public static String LOG_DEL = "03";										//删除操作
	public static String LOG_UPDATE = "02";										//更新操作
	public static String LOG_SAVE = "01";										//新增操作

	/**
	 * 认证用户类型
	 */
	public static String USER_NOT_AUDIT ="00"; 									//没认证用户
	public static String USER_AUDIT_SUCCESS ="01"; 								//已认证用户
	public static String USER_AUDIT_FAIL ="02"; 								//认证失败用户
	public static String USER_AUDITING ="03"; 									//待认证用户

	/**
	 * 付款方式
	 */
	public static String PAY_TYPE_NONE="00";									//虚拟币支付
	public static String PAY_TYPE_ALIPAY="01";									//支付宝支付					
	public static String PAY_TYPE_CFT="02";										//财付通支付
	public static String PAY_TYPE_BANK="03";									//网银支付

	/**
	 * 通用分类表类型
	 */
	public static String CATEGORY_TYPE_PRODUCT = "01";							//产品类别
	public static String CATEGORY_TYPE_NEWS = "02";								//新闻资讯类别
	public static String CATEGORY_TYPE_HELP = "03";								//商场用户帮助类型
	
	
	/**
	 * 类别等级
	 */
	public static String CATEGORY_IS_ROOT = "00";								//根类别
	public static String CATEGORY_NOT_ROOT = "01";								//子类别

	/**
	 * 产品类型
	 */
	public static String PRODUCT_PUBLISH_WAIT = "01"; 							// 商品进入商城待审核
	public static String PRODUCT_PUBLISH_NORMAL ="02"; 							// 审核通过
	public static String PRODUCT_PUBLISH_DENY = "03"; 							// 审核失败
	
	
	/**
	 * 附件表类型(type)
	 */
	public static String ATTACH_TYPE_PIC_PRODUCT = "01";						// 产品图片
	public static String ATTACH_TYPE_PIC_NEWS = "02";							// 资讯图片
	public static String ATTACH_TYPE_RAR = "03";								// 压缩包
	public static String ATTACH_TYPE_TXT = "04";								// 文本
	public static String ATTACH_TYPE_DOC = "05";								// DOC

	/**
	 * 附件表文件说明(filedesc)
	 */
	public static String ATTACH_PIC_MAIN = "01";								// 主图片(产品第一个展示的图片)
	public static String ATTACH_PIC_PERTAIN = "02";								// 附属图片(从属的图片)

	/**
	 * 消息类型
	 */
	public static String MESSAGE_IS_READ = "01"; 								// 已读消息
	public static String MESSAGE_NOT_READ = "02";								// 未读消息
	public static String MESSAGE_USER = "03"; 									// 用户消息
	public static String MESSAGE_SYS = "04"; 									// 系统消息
	public static String MESSAGE_SEND = "05"; 									// 表示是发送的消息
	public static String MESSAGE_RECV = "06"; 									// 表示是接收的消息

	/**
	 * 邮件类型
	 */
	public static String MAIL_TYPE_USER_REGISTER = "01";						//注册会员发送邮件
	public static String MAIL_TYPE_GOODS_WAIT_SEND = "02"; 						//待发货邮件提醒（发给卖家）
	public static String MAIL_TYPE_GOODS_SEND = "03"; 							//已发货提醒(发给买家)
	public static String MAIL_TYPE_GOODS_DONE = "04"; 							//结算提醒(发给卖家)
	public static String MAIL_GROUP_MAIL = "10"; 								// 管理员群发邮件

	/**
	 * 邮件标题
	 */
	public static String MAIL_TITLE_USER_REGISTER = "欢迎您的注册"; 				//注册邮件标题
	public static String MAIL_TITLE_GOODS_WAIT_SEND = "发货提醒"; 				//待发货邮件标题
	public static String MAIL_TITLE_GOODS_SEND= "卖家已发货提醒"; 				//已发货邮件标题
	public static String MAIL_TITLE_GOODS_DONE= "商城结算通知"; 					//结算提醒邮件标题
	public static String MAIL_TITLE_UPGRADE_INVITE = "网站升级通知"; 				// 网站升级通知标题


}
