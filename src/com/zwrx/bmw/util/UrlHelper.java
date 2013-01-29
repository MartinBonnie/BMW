/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "IDUtil.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2009-12-3           yixiugg                      initial
 **/
package com.zwrx.bmw.util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Administrator
 * 
 */
public class UrlHelper {
	/**
	 * 得到真实的url
	 * 
	 * @param request
	 * @return
	 */
	public static String requestRelayString(HttpServletRequest request) {
		String url = request.getRequestURI();
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String param = (String) e.nextElement();
			String[] values = request.getParameterValues(param);
			for (int i = 0; i < values.length; i++) {
				if (i == 0)
					url += "?" + param + "=" + values[i];
				else
					url += "&" + param + "=" + values[i];
			}
		}
		return url;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

	}

}
