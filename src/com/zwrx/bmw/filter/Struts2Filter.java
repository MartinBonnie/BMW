/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "Struts2Filter.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2010-1-29           yixiugg                      initial
**/

package com.zwrx.bmw.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;


/**
 **Struts2Filter.java
 **/
public class Struts2Filter extends StrutsPrepareAndExecuteFilter
{
	private String notFilterDir = "";
	protected Log log = LogFactory.getLog(this.getClass());
	public void destroy() {
		notFilterDir = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			String uri = req.getRequestURI();
			String[] notFilterDirs = notFilterDir.split(",");
			for(int i=0;i<notFilterDirs.length;i++){
				String notFilterDirValue = notFilterDirs[i];
				if (uri.indexOf(notFilterDirValue) != -1) {
					chain.doFilter(request, response);
					return;
				}
			}
			super.doFilter(request, response, chain);
		} catch (Exception e) {
			log.error(e);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		notFilterDir = filterConfig.getInitParameter("notFilterDir");
		super.init(filterConfig);
	}
}

