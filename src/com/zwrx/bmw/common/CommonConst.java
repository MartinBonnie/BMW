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
	
	/**
	 * Session相关
	 */
	public static String SESSION_USER = "bwmUser";								//用户登录系统后存session时的key
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


	/**
	 * 上传文件夹
	 */

	/**
	 * 图片上传后生成水印及缩略图说明
	 * 图片上传后图片名字+_1的为水印图片，+_3的为缩略图(宽度为800),+_4的为缩略图(宽度为100),+_5的为缩略图(宽度为20),
	 * 如：你上传的图片为login.jpg，你生成的水印图片地址为login_1.jpg,缩略图名为login_3.jpg
	 */
	public static int THUMBNAIL_BIG = 700;
	public static int THUMBNAIL_MIDDLE = 350;
	public static int THUMBNAIL_SMALL = 160;
	public static int THUMBNAIL_LITTLE = 100;
	public static int THUMBNAIL_TINY = 40;
	public static List<Integer>IMG_SIZES= new ArrayList<Integer>();
	
	static{
		IMG_SIZES.add(THUMBNAIL_BIG);
		IMG_SIZES.add(THUMBNAIL_MIDDLE);
		IMG_SIZES.add(THUMBNAIL_SMALL);
		IMG_SIZES.add(THUMBNAIL_LITTLE);
		IMG_SIZES.add(THUMBNAIL_TINY);
	}
	

	/**
	 * jms queue
	 */
	public static String JMS_MAIL = "NGBMAIL";

	/**
	 * 网站的title
	 */
	public static String bmw_TITLE = "商人自己的网站";
	public static boolean ISCONTROL = false;
	public static int PICCOUNT = 10;
	public static String YYYYMMDD = "yyyy-MM-dd";

	/**
	 * 充值消费类型，对应recharge中的flag字段
	 */
	public static String RECHARGE_ADD = "01";									//收入
	public static String RECHARGE_CONSUME = "11";								//支出
	
	public static Map<String, String> RECHARGE_MAP = new HashMap<String, String>();
	static{
		RECHARGE_MAP.put(RECHARGE_ADD, "收入");
		RECHARGE_MAP.put(RECHARGE_CONSUME, "支出");
	}
	public static Map<String, String> RECHARGE_STATE_MAP = new HashMap<String, String>();
	static{
		RECHARGE_STATE_MAP.put(STATE_INIT, "交易中");
		RECHARGE_STATE_MAP.put(STATE_NORMAL, "交易成功");
	}
	
	/**
	 * 充值或者消费的类型
	 */
	public static String RECHARGE_TYPE_ADD_CASH = "01";							//现金充值
	public static String RECHARGE_TYPE_ADD_BANK_TRANS = "02";					//银行转账
	public static String RECHARGE_TYPE_ADD_EBANK = "03";						//网银转账
	public static String RECHARGE_TYPE_ADD_ALIPAY = "04";						//支付宝
	public static String RECHARGE_TYPE_ADD_CASHCARD = "05";						//充值卡
	public static String RECHARGE_TYPE_ADD_SCORE = "06";						//积分折现
	public static String RECHARGE_TYPE_ADD_99BILL = "07";						//快钱
	public static String RECHARGE_TYPE_ADD_REBATE = "08";						//返利的支付
	public static String RECHARGE_TYPE_ADD_TRANS = "09";						//帐内转账
	public static String RECHARGE_TYPE_ADD_CMBC="10";							//民生B2B支付
	public static String RECHARGE_TYPE_ADD_INJECT = "21";						//资金注入
	
	public static String RECHARGE_TYPE_CONSUME_ORDER = "11";					//订单支付
	public static String RECHARGE_TYPE_CONSUME_TRANS = "12";					//站内转账
	public static String RECHARGE_TYPE_CONSUME_DRAWBACK = "13";					//提现
	public static String RECHARGE_TYPE_CONSUME_SCORE_ADD = "14";				//购买积分
	
	public static String RECHARGE_TYPE_SCORE_ADD_BUY = "31";					//直接购买加积分
	public static String RECHARGE_TYPE_SCORE_ADD_REBEL_BUY_PROD = "32";			//返利买产品加的积分
	public static String RECHARGE_TYPE_SCORE_ADD_BUY_PROD = "33";				//买产品加积分
	public static String RECHARGE_TYPE_SCORE_ADD_MALL_RECHARGE = "34";			//商城现金转积分
	
	public static String RECHARGE_TYPE_SCORE_CONSUME_SELL = "41";				//卖积分
	public static String RECHARGE_TYPE_SCORE_CONSUME_REBEL_SELL_PROD = "42";	//返利卖产品送的积分
	public static String RECHARGE_TYPE_SCORE_CONSUME_SELL_PROD = "43";			//卖产品送积分
	public static String RECHARGE_TYPE_SCORE_CONSUME_MALL_RECHARGE = "44";		//商城积分转现金
	
	public static String RECHARGE_TYPE_SETTLE_FROM = "30";//商城结算，送给商城
	public static String RECHARGE_TYPE_SETTLE_TO = "31";//商城结算，从商城中支付
	public static String RECHARGE_TYPE_SETTLE_SELF = "32";//商城自己转换
	
	
	public static Map<String, String> RECHARGE_TYPE_MAP = new HashMap<String, String>();
	public static Map<String, String> RECHARGE_POINT_TYPE_MAP = new HashMap<String, String>();
	static{
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_CASH, "现金充值");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_BANK_TRANS, "银行转账");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_EBANK, "网银转账");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_ALIPAY, "支付宝");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_CMBC, "民生银行");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_CASHCARD, "充值卡");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_SCORE, "积分折现");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_99BILL, "快钱");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_ADD_REBATE, "返利");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_CONSUME_ORDER, "订单支付");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_CONSUME_TRANS, "站内转账");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_CONSUME_SCORE_ADD, "购买积分");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_CONSUME_DRAWBACK, "提现");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_SETTLE_FROM, "商城结算支出");
		RECHARGE_TYPE_MAP.put(RECHARGE_TYPE_SETTLE_TO, "商城结算收入");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_CONSUME_SELL, "卖积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_CONSUME_REBEL_SELL_PROD, "返利卖产品送的积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_CONSUME_SELL_PROD, "卖产品送积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_ADD_BUY, "直接购买加积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_ADD_REBEL_BUY_PROD, "返利买产品加的积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_ADD_BUY_PROD, "买产品加积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_ADD_MALL_RECHARGE, "商城现金转积分");
		RECHARGE_POINT_TYPE_MAP.put(RECHARGE_TYPE_SCORE_CONSUME_MALL_RECHARGE, "商城积分转现金");
		
		}

	// 账户常量
	/*---------------------- 类型 -----------------------*/
	public static String ACCOUNT_TYPE_PERSONAL = "00";// 个人
	public static String ACCOUNT_TYPE_ENTERPRISE = "01";// 企业
	public static String ACCOUNT_TYPE_CARD = "02";// 消费卡
	public static String ACCOUNT_TYPE_MALL = "03";// 商城账户

	/*---------------------- 状态 -----------------------*/
	public static String ACCOUNT_INIT_STATUS = "00";
	public static String ACCOUNT_ACTIVE_STATUS = "01";
	public static String ACCOUNT_BAN_STATUS = "02";
	public static String ACCOUNT_DELETE_STATUS = "03";

	// 充值类型
	public static String RECHARGE_TYPE_CASH = "00";// 现金
	public static String RECHARGE_TYPE_TRANS = "01";// 转账

	//产品卖家修改后要将状态设为审核状态
	public static String PRODUCT_STATE_VERTIFY="99";
	// 广告类型
	public static String ADMANAGE_TYPE_PIC = "01"; // 图片
	public static String ADMANAGE_TYPE_FLASH = "02"; // flash
	public static String ADMANAGE_TYPE_OUT = "03"; // 外部引用
	public static String ADMANAGE_TYPE_WORD = "04"; // 文字
	public static String ADMANAGE_TYPE_PRODUCT = "05"; // 商品
	public static String ADMANAGE_TYPE_ENT = "06"; // 企业
	
	public static String ADMANAGE_URL_PRODUCT = "/portal/product_detail.jsp?id=";

	public static String NO_PHOTO = "nophoto.jpg";
	
	//订单类型
//	public static String ORDER_TYPE_MALL="00";//商城订单类型
//	public static String ORDER_TYPE_ENT="01";//普通旺铺订单类型
	public static String ORDER_PROD_TYPE_MALL="01";//商城订单
	public static String ORDER_PROD_TYPE_VIP="00";//旺铺订单
	public static String ORDER_PROD_TYPE_VIPANDMALL="02";//旺铺商城订单
	
	//企业类型
	public static Map<String, String> UER_TYPE_MAP = new HashMap<String, String>();
	public static String Enterprise_TYPE_PERSON="00";//个人用户
	public static String Enterprise_TYPE_ENT="01";//企业单位
	public static String Enterprise_TYPE_SELF="02";//个体经营
	public static String Enterprise_TYPE_INSTITUTION="03";//机构
	public static String USER_TYPE_VIP="04";//VIP用户
	static {
		UER_TYPE_MAP.put(Enterprise_TYPE_PERSON, "个人用户");
		UER_TYPE_MAP.put(Enterprise_TYPE_ENT, "企业单位");
		UER_TYPE_MAP.put(Enterprise_TYPE_SELF, "个体经营");
		UER_TYPE_MAP.put(Enterprise_TYPE_INSTITUTION, "机构");
		UER_TYPE_MAP.put(USER_TYPE_VIP, "VIP用户");
	}
	
	//对账单dealState状态设定
	public static String STATEMENT_DEALSTATE_INIT="00";//出具对账单初始状态
	public static String STATEMENT_DEALSTATE_DONE_SELLER="01";//卖家确认账单生效
	public static String STATEMENT_DEALSTATE_DONE_MALL="10";//商城确认账单生效
	public static String STATEMENT_DEALSTATE_DONE="11";//对账单对账终结状态
	
	//企业LOGO在附件中存在的类型
	public static String Enterprise_LOGO="08";
	//订单dealState状态类型
	public static String ORDER_DEALSTATE_INIT="00";//订单未支付状态
	public static String ORDER_DEALSTATE_SUCCESS="01";//订单已支付状态待发货
	public static String ORDER_DEALSTATE_PROCESSED="02";//订单已发货
	public static String ORDER_DEALSTATE_CONFIRM="03";//订单确认收货
	public static String ORDER_DEALSTATE_DENY="04";//买方申请退货
	public static String ORDER_DEALSTATE_DENY_CONFIRM="05";//商城批准退货
	public static String ORDER_DEALSTATE_DENY_SUCCESS="06";//订单退货成功
	public static String ORDER_DEALSTATE_SETTLE="07";//商家清算成功
	public static String ORDER_DEALSTATE_VIP="08";//旺铺订单已支付状态
	public static String ORDER_DEALSTATE_REMIND="10";//商城提醒卖家发货
	public static String ORDER_DEALSTATE_NOGOODS="11";//商城以及卖家提醒买方缺货
	public static String getDescByDealState(String ORDER_DEALSTATE){
		if(ORDER_DEALSTATE_INIT.equals(ORDER_DEALSTATE)){
			return "未支付";
		} else if(ORDER_DEALSTATE_SUCCESS.equals(ORDER_DEALSTATE)){
			return "已支付待发货";
		} else if(ORDER_DEALSTATE_PROCESSED.equals(ORDER_DEALSTATE)){
			return "已发货待确认";
		} else if(ORDER_DEALSTATE_CONFIRM.equals(ORDER_DEALSTATE)){
			return "已收货";
		} else if(ORDER_DEALSTATE_DENY.equals(ORDER_DEALSTATE)){
			return "申请退货";
		} else if(ORDER_DEALSTATE_DENY_CONFIRM.equals(ORDER_DEALSTATE)){
			return "批准退货";
		} else if(ORDER_DEALSTATE_DENY_SUCCESS.equals(ORDER_DEALSTATE)){
			return "已退货";
		} else if(ORDER_DEALSTATE_SETTLE.equals(ORDER_DEALSTATE)){
			return "已结算";
		} else if(ORDER_DEALSTATE_NOGOODS.equals(ORDER_DEALSTATE)){
			return "提醒缺货";
		} else {
			return "";
		}
	}
	//orderProd的评论状态
	public static String ORDERPROD_STATE_COMMENT_INIT="2";//还没收获没有评论权限
	public static String ORDERPROD_STATE_COMMENT_DONE="1";//已确认收获且已评论
	public static String ORDERPROD_STATE_COMMENT_NO="0";//已确认收获且尚未评论
	
	//invoice的make_type状态
	public static String ORDER_STATE_MAKE_TYPE_SELLER="01";//商城让卖家开发票
	public static String ORDER_STATE_MAKE_TYPE_MALL="00";//商城自己开发票
	public static String ORDER_STATE_MAKE_TYPE_INIT="02";//发票初始状态
	//invoice的Type状态
	public static String INVOICE_TYPE_GENERAL="00";//普通发票
	public static String INVOICE_TYPE_ADD_TAX="01";//增值税发票
	public static String INVOICE_TYPE_SERVICE_TAX="02";//服务发票
	//invoice的state状态
	public static String INVOICE_STATE_INIT="01";//买家所填发票状态
	public static String INVOICE_STATE_DONE="02";//商城或卖方已开发票
	
	//交易状态
	public static String TRANSACTION_STATE_INIT="00";//交易初始状态
	public static String TRANSACTION_STATE_SUCCESS="01";//交易成功状态
	public static String TRANSACTION_STATE_FAILURE="02";//交易失败即退货状态
	
	// 返利常量
	/*---------------------- 类型 -----------------------*/
	public static String REBATEREL_RECOMMEND_TYPE = "00";
	public static String REBATEREL_ERBATE_TYPE = "01";
	public static String REBATEREL_ALL_TYPE = "02";

	/*---------------------- 状态 -----------------------*/
	public static String REBATEREL_INIT_STATUS = "00";
	public static String REBATEREL_ACTIVE_STATUS = "01";// 审核通过
	public static String REBATEREL_NOTACTIVE_STATUS = "02";// 审核不通过
	public static String REBATEREL_PASS_STATUS = "03";// 返利审核通过
	public static String REBATEREL_NOTPASS_STATUS = "04";// 返利审核不通过
	public static String REBATEREL_SUCCESS_STATUS = "05";// 返利成功
	public static String REBATEREL_FAIL_STATUS = "06";// 返利失败
	public static String REBATEREL_DELETE_STATUS = "07";

	public static String REBATE_INIT_STATUS = "00";
	public static String REBATE_SUCCESS_STATUS = "01";
	public static String REBATE_FAIL_STATUS = "02";

	/*---------------------- 比例 -----------------------*/
	public static int REBATEREL_DEFAULT = 1;
	public static int THOUSAND = 1000;
	
	//促销相关
	public final static String PROMOTE_BELONG_TYPE_MALL = "00";// 商城促销
	public final static String PROMOTE_BELONG_TYPE_ENT = "01";// 企业促销
	//收藏相关
	public final static String FAVOURITE_TYPE_MALL_PRODUCT = "00";// 收藏商城产品
	public final static String FAVOURITE_TYPE_VIP_PRODUCT= "01";// 收藏旺铺产品
	public final static String FAVOURITE_TYPE_VIP_ENT = "02";// 收藏企业旺铺
	public final static String FAVOURITE_TYPE_VIP_NEWS = "03";// 收藏旺铺新闻
	
	public final static String PROMOTE_TYPE_PROD = "00";// 单品
	public final static String PROMOTE_TYPE_ORDER = "01";// 整单
	public final static String PROMOTE_TRIG_TYPE_FULL = "00";// 满
	public final static String PROMOTE_TRIG_TYPE_EVERY = "01";// 每
	public final static String PROMOTE_PATTERN_DELIVER = "00";// 送
	public final static String PROMOTE_PATTERN_DISCOUNT = "01";// 折
	public final static String PROMOTE_PATTERN_REDUCE = "02";// 减
	public final static String PROMOTE_PATTERN_PRESENT = "03";// 赠

	public final static String PROMOTE_UNIT_YUAN = "01";// 元
	public final static String PROMOTE_UNIT_JIAN = "02";// 件
	
	public final static String ATT_CERTIFICATE="12";//附件类型：荣誉证书
	
	public final static String COMMENT_TYPE_PRODUCT = "01";	//商品评论
	
	public final static String ADDRESS_TYPE_BUYER = "01";		//买家地址
	public final static String ADDRESS_TYPE_SELLER = "02";		//卖家地址
	public final static String ADTOP="ad_top";                 // 中央广告
    public final static String ADBEST="ad_bestSell";            //热销图片
    public final static String ADONS="ad_onSale";               //促销广告图片
    public final static String ADNEW="ad_newest";               //  最新产品图片
    
    
    public final static String MOBILE_AD_TOP="mobile_ad_top";                 // 中央广告
    public final static String MOBILE_AD_BESTSELL="mobile_ad_bestSell";            //热销图片
    public final static String MOBILE_AD_ONSALE="mobile_ad_onSale";               //促销广告图片
    public final static String MOBILE_AD_NEW="mobile_ad_newest";               //  最新产品图片
    public final static String MOBILE_AD_SELL_MOST="mobile_ad_sell_most";               //  销量排行
    public final static String FIREST_AD_FOUR_1="first_four_new";//首页新品上架
    public final static String FIREST_AD_FOUR_2="first_four_time";//首页限时抢购
    public final static String FIREST_AD_FOUR_3="first_four_brand";//首页品牌直销
    public final static String FIREST_AD_FOUR_4="first_four_price";//首页特价商品
    public final static String FIRST_AD_LEFT_FLOAT="first_left_float";//首页左侧浮动广告
    public final static String FIRST_AD_RIGHT_FLOAT="first_right_float";//首页右侧浮动广告
    
    
    
	public static Map<String, String> PROMOTE_TYPE_MAP = new HashMap<String, String>();
	public static Map<String, String> PROMOTE_TRIG_TYPE_MAP = new HashMap<String, String>();
	public static Map<String, String> PROMOTE_PATTERN_MAP = new HashMap<String, String>();
	public static Map<String, String> PROMOTE_UNIT_MAP = new HashMap<String, String>();
	public static Map<String, String> STATE_MAP = new HashMap<String, String>();
	
	
	
	static {
		PROMOTE_TYPE_MAP.put(PROMOTE_TYPE_PROD, "单品");
		PROMOTE_TYPE_MAP.put(PROMOTE_TYPE_ORDER, "整单");
		
		PROMOTE_TRIG_TYPE_MAP.put(PROMOTE_TRIG_TYPE_FULL, "满");
		PROMOTE_TRIG_TYPE_MAP.put(PROMOTE_TRIG_TYPE_EVERY, "每");
		
		PROMOTE_PATTERN_MAP.put(PROMOTE_PATTERN_DELIVER, "送");
		PROMOTE_PATTERN_MAP.put(PROMOTE_PATTERN_DISCOUNT, "折");
		PROMOTE_PATTERN_MAP.put(PROMOTE_PATTERN_REDUCE, "减");
		PROMOTE_PATTERN_MAP.put(PROMOTE_PATTERN_PRESENT, "赠");
		
		PROMOTE_UNIT_MAP.put(PROMOTE_UNIT_YUAN, "元");
		PROMOTE_UNIT_MAP.put(PROMOTE_UNIT_JIAN, "件");
		
		STATE_MAP.put(STATE_INIT, "初始");
		STATE_MAP.put(STATE_NORMAL, "正常");
		STATE_MAP.put(STATE_DEL, "删除");
		
		
		}

	 public final static String MODULE_TYPE_ADMIN = "01";
	 public final static String MODULE_TYPE_ADMIN_PRI = "02";
	 public final static String MODULE_TYPE_USER = "10";
	 
	 public final static String SESSION_ALL_MODULE = "adminAllModule";
	 public final static String SESSION_NAV_JS = "adminNavJS";
	 public final static String SESSION_NAV_TOP = "adminNavTop";
	 //产品类型
	 public final static String PRODUCT_VIP="00";
 	 public final static String PRODUCT_MALL="01";
 	 public final static String PRODUCT_MALLANDVIP="02";
}
