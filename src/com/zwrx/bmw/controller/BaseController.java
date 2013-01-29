package com.zwrx.bmw.controller;


import java.util.Hashtable;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.PaginationSupport;
import com.zwrx.bmw.models.BmwUser;
import com.zwrx.bmw.service.BaseService;

public class BaseController {
protected String ERR_Desc = "服务器异常";
	@Autowired
	protected ServletContext context;
	@Resource
	protected BaseService baseService;
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
	protected String domain;
	
	protected String actionUrl;

	protected final org.apache.log4j.Logger log = org.apache.log4j.Logger
			.getLogger(this.getClass());

	protected String id;
	protected int page = 1;
	protected int startIndex = 0;
	protected int pageSize = DEFAULT_PAGESIZE;

	protected PaginationSupport pageList;

	protected String result;
	
	
    public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getActionUrl() {
		return actionUrl;
	}
	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
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
	
	 /**
     * returns the current http session object
     * 
     * @return session
     */
    public HttpSession getSession() {        
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession contextSess = 
        		attr == null ? null : attr.getRequest().getSession(true);
        return contextSess; 
    }
	/**
     * returns the current http session object
     * 
     * @return session
     */
    public HttpServletRequest getRequest() {        
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest contextReq = 
        		attr == null ? null : attr.getRequest();
        return contextReq; 
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
	 * 
	 * @return
	 */
	protected Map<String,String> getApplicationAuditedUsers(){
		Map<String,String> auditedUsers = (Map<String,String> ) context.getAttribute(CommonConst.APPLICATION_AUDIT_USERS);
		if(auditedUsers==null){
			auditedUsers = new Hashtable<String,String>();
			ServletActionContext.getContext().getApplication().put(CommonConst.APPLICATION_AUDIT_USERS, auditedUsers);
		}
		return auditedUsers;
	}

}
