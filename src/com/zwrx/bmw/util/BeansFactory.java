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

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author Forre
 */
public class BeansFactory {

	private static final String APPLICATION_CONTEXT_FILENAME = "spring/applicationContext.xml";

	private static Log log = LogFactory.getLog(BeansFactory.class);

	private static ApplicationContext appContext;

	private static ServletContext context;

	private static BeanFactory factory = null;
	static {
		try {
			appContext = new ClassPathXmlApplicationContext(
					APPLICATION_CONTEXT_FILENAME);
			// factory = new FileSystemXmlApplicationContext(
			// APPLICATION_CONTEXT_FILENAME);

		} catch (Exception e) {
			log.info("Spring load error ", e);
		}
	}

	public static void setContext(ServletContext context) {
		BeansFactory.context = context;
	}

	private static ApplicationContext getApplicationContext() {
		return appContext;

	}

	/**
	 * @param name
	 * @return
	 */
	public static Object get(String name) {
		Object o = null;
		try {
			// o = factory.getBean(name);
			try {
				o = getApplicationContext().getBean(name);
				System.out.println("object:" + o);
			} catch (Exception e) {
				o = factory.getBean(name);
				System.out.println("object2:" + o);
			}

		} catch (Exception e) {
			System.out.println("bean name is " + name);
			e.printStackTrace();
			log.info("Load Spring bean error, Bean name is " + name, e);
		}
		return o;

	}
	/**
	 * @param name
	 * @return
	 */
	public static Object get(Class<?> cls) {
		Object o = null;
		try {
			try {
				o = getApplicationContext().getBean(cls);
			} catch (Exception e) {
				o = factory.getBean(cls);
			}
		} catch (Exception e) {
			log.info("Get bean error, Spring bean name is " +  cls.getName(), e);
		}
		return o;

	}
}
