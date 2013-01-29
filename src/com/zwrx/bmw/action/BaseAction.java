
package com.zwrx.bmw.action;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.apache.struts2.util.ServletContextAware;
import org.hibernate.criterion.DetachedCriteria;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.PaginationSupport;
import com.zwrx.bmw.models.BmwAdmin;
import com.zwrx.bmw.models.BmwAttachment;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.service.BaseService;

/**
 * *NewBaseAction.java
 */
@SuppressWarnings("serial")
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>,
		Preparable, ServletContextAware {
	
	protected String ERR_Desc = "服务器异常";
	
	public static final int DEFAULT_PAGESIZE = 20;

	protected static final String INDEX = "index";

	protected static final String VIEW = "view";

	protected static final String LIST = "list";

	protected static final String QUERY = "query";

	protected static final String EDIT = "edit";

	protected static final String ADD = "add";

	protected static final String JSON = "json";

	protected static final String REMOVE = "remove";

	protected static final String DETAIL = "detail";
	
	protected static final String RESULT = "result";

	private String targetModule;

	protected ServletContext servletContext;

	protected BaseService baseService;

	protected String domain;
	
	protected String actionUrl;

	protected final org.apache.log4j.Logger log = org.apache.log4j.Logger
			.getLogger(this.getClass());

	protected Class<T> entityClass;
	protected T entity;
	protected String id;
	protected int page = 1;
	protected int startIndex = 0;
	protected int pageSize = DEFAULT_PAGESIZE;

	protected PaginationSupport pageList;

	public List<T> resultList;

	protected String result;

	@SuppressWarnings("unchecked")
	public BaseAction() {
		try {
			entityClass = (Class<T>) ((ParameterizedType) getClass()
					.getGenericSuperclass()).getActualTypeArguments()[0];
		} catch (Exception e) {
			log.info("未能获取泛型类");
		}
	}

	public T getModel() {
		if (entity == null) {
			try {
				entity = (T) entityClass.newInstance();
			} catch (Exception e) {
				log.info("无法创建模型实例");
				return null;
			}
		}
		return entity;
	}

	public HttpSession getSession() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		return session;
	}

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	protected Map<String,Object> getApplication(){
		return ServletActionContext.getContext().getApplication();
	}

	protected Map<String,String> getApplicationAuditedUsers(){
		Map<String,String> auditedUsers = (Map<String,String> ) ServletActionContext.getContext().getApplication().get(CommonConst.APPLICATION_AUDIT_USERS);
		if(auditedUsers==null){
			auditedUsers = new Hashtable<String,String>();
			ServletActionContext.getContext().getApplication().put(CommonConst.APPLICATION_AUDIT_USERS, auditedUsers);
		}
		return auditedUsers;
	}

	protected void output(Object s) throws IOException {
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().getWriter().print(s);
	}

	public void prepare() throws Exception {
		// if (this.id != null && id.length() > 0) {
		// if (entityClass != null)
		// entity = (T) baseService.findById(entityClass, id);
		// } else {
		// entity = (T) entityClass.newInstance();
		// prepareModelInner(entity);
		// }
		this.page=0;
		this.result = "";
		this.page=1;
		entity = (T) entityClass.newInstance();
		this.clearErrorsAndMessages();
		prepareModelInner(entity);
	}

	/**
	 * @param model
	 */
	protected void prepareModelInner(T model) {

	}

	public String save() {
		return SUCCESS;
	}

	@SkipValidation
	public String view() {
		return VIEW;
	}

	public String edit() {
		return EDIT;
	}

	@SuppressWarnings("unchecked")
	public String detail() {
		this.entity = (T) baseService.findById(entity.getClass(), id);
		return DETAIL;
	}

	public String list() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(entity
				.getClass());
		startIndex = (page - 1) * pageSize;
		this.pageList = baseService.findPageByCriteria(detachedCriteria,
				pageSize, startIndex);
		return LIST;
	}

	public String query() {
		return QUERY;
	}

	public String add() {
		return ADD;
	}

	public String remove() {
		return REMOVE;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

	public BaseService getBaseService() {
		return baseService;
	}

	public Class<T> getEntityClass() {
		return entityClass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setServletContext(ServletContext context) {
		this.servletContext = context;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTargetModule() {
		return targetModule;
	}

	public void setTargetModule(String targetModule) {
		this.targetModule = targetModule;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		if (page > 0)
			startIndex = (page - 1) * pageSize;
	}

	/**
	 * 得到当前登陆用户
	 * 
	 * @return
	 */
	protected BmwUser getCurrentUser(){
		BmwUser user = (BmwUser)getSession().getAttribute(CommonConst.SESSION_USER);
		//如果用户认证通过，则直接更新
		if(user!=null){
			if(this.getApplicationAuditedUsers().get(user.getUserId())!=null){
				user = (BmwUser)baseService.findById(BmwUser.class, user.getUserId());
				this.getSession().setAttribute(CommonConst.SESSION_USER, user);
				this.getApplicationAuditedUsers().remove(user.getUserId());
			}
		}
		return user;
	}
	
	/**
	 * 得到当前登陆的管理员
	 * 
	 * @return
	 */
	protected BmwAdmin getCurrentAdmin(){
		return (BmwAdmin)this.getSession().getAttribute(CommonConst.SESSION_ADMIN);
	}
	
	protected void deposit(String key, Object o) {
		getRequest().setAttribute(key, o);
	}
	
	public void reloadSession(String SessionKey, Object obj) {
		getSession().setAttribute(SessionKey, obj);
	}
	
	// 把内容里的图片对照存在attachment表里的记录，存在状态改成01,不存在改成00
	public void setUploadState(String content) {
		BmwAttachment att = new BmwAttachment();
		att.setBmwUserId(getCurrentUser().getUserId());
		att.setBelongType("相册管理");//注意修改
		att.setFiledesc("xheditor");
		att.setState(CommonConst.STATE_INIT);
		List<BmwAttachment> list = baseService.findByExample(att);
		for (BmwAttachment at : list) {
			if (content.indexOf(at.getServerPath()) > -1) {
				at.setState(CommonConst.STATE_NORMAL);
				baseService.update(at);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public void setTempAttachment(String belongId, String belongType) {
		List<BmwAttachment> tempAttachments = (List<BmwAttachment>) this
				.getSession().getAttribute(CommonConst.SESSIONATTACHMENTS);
		if (tempAttachments != null && tempAttachments.size() > 0) {
			for (BmwAttachment att : tempAttachments) {
				att.setBelongId(belongId);
				att.setBelongType(belongType);
				baseService.saveOrUpdate(att);
			}
			this.getSession().setAttribute(CommonConst.SESSIONATTACHMENTS,
					new ArrayList());
		}
	}
	
	public String[] getEnterpriseIdByOrigin(String type) {
		String hql = "select enterpriseId from NgbUser where domain='" + type
				+ "' and grade is not null";
		List<String> ulist = baseService.findByHql(hql);
		String uarray[] = new String[ulist.size()];
		for (int i = 0; i < ulist.size(); i++) {
			uarray[i] = ulist.get(i);
		}
		return uarray;
	}
	
	
	/**
	 * get action url
	 * @return
	 */
	public String getActionUrl(){
		Map<String,String[]> map = this.getRequest().getParameterMap();
		String actionUrl = "";
		for(String param:map.keySet()){
			if(param.equals("page"))
				continue;
			String[] values = map.get(param);
			for(String value:values)
				actionUrl+=param+"="+value+"&";
		}
		return actionUrl;
	}

	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}
	
//	/**
//	 * 得到商城的账号
//	 * @return
//	 */
//	public NgbAccount getMallAccount(){
//		NgbAccount ngbAccount = new NgbAccount();
//		ngbAccount.setType(CommonConst.ACCOUNT_TYPE_MALL);
//		List<NgbAccount> accounts = baseService.findByExample(ngbAccount);
//		if(accounts.size()==0){
//			ngbAccount.setBalance(BigDecimal.ZERO);
//			ngbAccount.setAddTime(new Date());
//			ngbAccount.setState(CommonConst.STATENORMAL);
//			ngbAccount.setScore(0L);
//			ngbAccount.setPassword(MD5EncryptUtil.md5Encry(CommonConst.INITPWD));
//			baseService.save(ngbAccount);
//		}else{
//			ngbAccount = accounts.get(0);
//		}
//		return ngbAccount;
//	}
	
//	/**
//	 * 调整到认证页面（用户必须已登录）
//	 * @returnUrl 认证成功后跳转的url
//	 */
//	public boolean isRedirectToAuditPage(String fromUrl, String returnUrl){
//		BmwUser user = getCurrentUser();
//		if(!user.isAuditUser()){
//			HttpServletRequest request = getRequest();
//			try {
//				request.setAttribute("fromUrl", fromUrl);
//				request.setAttribute("returnUrl", returnUrl);
//				String redirectUrl = "/account/auditInputUser";
//				request.getRequestDispatcher(redirectUrl).forward(request, getResponse());
//				return true;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}
	
	public String result(){
		this.result = (String) getSession().getAttribute(RESULT);
		getSession().setAttribute(RESULT, null);
		return list();
	}
}
