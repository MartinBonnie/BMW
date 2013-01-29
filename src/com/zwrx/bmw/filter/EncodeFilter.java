/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "AdminLoginAction.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2009-12-5           yixiugg                      initial
 **/
package com.zwrx.bmw.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class EncodeFilter implements Filter {
	protected FilterConfig filterConfig = null;
	protected String encoding = "utf-8";
	protected boolean ignore = true;
	protected Log log = LogFactory.getLog(this.getClass());

	public void destroy() {
		filterConfig = null;
		encoding = null;
		ignore = false;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) {
		try {
			request.setCharacterEncoding(encoding);
			response.setCharacterEncoding(encoding);

			/**
			 * IE跨域 session HttpServletResponse res = (HttpServletResponse)
			 * response; res.setHeader("P3P", "CP=CAO PSA OUR");
			 */

			chain.doFilter(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}

	public void init(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;

		String paramValue = filterConfig.getInitParameter("encoding");
		if (paramValue != null) {
			this.encoding = paramValue;
		}
		String value = filterConfig.getInitParameter("ignore");
		if (value == null)
			this.ignore = true;
		else if (value.equalsIgnoreCase("true"))
			this.ignore = true;
		else if (value.equalsIgnoreCase("yes"))
			this.ignore = true;
		else
			this.ignore = false;
	}
}
