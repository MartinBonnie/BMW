package com.zwrx.bmw.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BwmSyscode;
import com.zwrx.bmw.service.BaseService;
import com.zwrx.bmw.util.BeansFactory;
import com.zwrx.bmw.util.StringUtil;


public class BannedFilter implements Filter {

	private String filterParams = "";
	protected Log log = LogFactory.getLog(this.getClass());
	private FilterConfig filterConfig;

	public void destroy() {
		filterParams = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			BaseService baseService = (BaseService)BeansFactory.get("baseService");
			BwmSyscode syscode = new BwmSyscode();
			syscode.setType(CommonConst.SYSCODE_TYPE_BANNED_KEY);
			List<BwmSyscode> list =baseService.findByExample(syscode);
			if(list.size()==0){
				syscode.setName("屏蔽字");
				baseService.save(syscode);
			}else{
				syscode=list.get(0);
			}
			String bannedKey = syscode.getContent();
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			String[] bannedKeys = bannedKey.split(" ");
			//自动过滤获得填写的内容
			if(filterParams!=null){
				String[] paramArr = filterParams.split(",");
				for(String param:paramArr){
					String content = req.getParameter(param);
					if(StringUtil.isNotBlank(content)){
						for(String banned:bannedKeys){
							if(content.indexOf(banned)>-1){
								res.sendRedirect(this.filterConfig.getServletContext()
										.getContextPath()
										+ CommonConst.BANNED_PAGE);
								return;
							}
						}
					}
				}
			}
			chain.doFilter(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		filterParams = filterConfig.getInitParameter("filterParams");
	}

}
