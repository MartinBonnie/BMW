/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "FreemarkerHelper.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2010-1-9           yixiugg                      initial
 **/

package com.zwrx.bmw.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.models.BmwUser;




import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleHash;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * *FreemarkerHelper.java
 */
public class FreemarkerHelper {
	org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(getClass());
	private static FreemarkerHelper instance = null;
	private Configuration cfg;

	public static FreemarkerHelper getInstance() {
		if (instance == null) {
			instance = new FreemarkerHelper();
			return instance;
		} else
			return instance;
	}

	public FreemarkerHelper() {
		cfg = new Configuration();
		// - Templates are stoted in the WEB-INF/templates directory of the Web
		// app.
		File dir = new File(CommonConst.CLASSPATH + "templates");
		try {
			cfg.setDirectoryForTemplateLoading(dir);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public FreemarkerHelper(String fltpath) {
		cfg = new Configuration();
		File dir = new File(fltpath);
		try {
			cfg.setDirectoryForTemplateLoading(dir);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getUpgradeInvite(BmwUser user) throws IOException,
			TemplateException {
		Template template = cfg.getTemplate("upgradeInvite.ftl");
		StringWriter writer = new StringWriter();
		SimpleHash root = new SimpleHash(ObjectWrapper.BEANS_WRAPPER);
		root.put("user", user);
		template.process(root, writer);
		return writer.toString();
	}

//	public String getNews(NgbNews news) throws IOException, TemplateException {
//		Template template = cfg.getTemplate("news.ftl");
//		StringWriter writer = new StringWriter();
//		SimpleHash root = new SimpleHash(ObjectWrapper.BEANS_WRAPPER);
//		root.put("news", news);
//		template.process(root, writer);
//		return writer.toString();
//	}

	public String getEntryUserInfo(BmwUser user) throws IOException,
			TemplateException {
		Template template = cfg.getTemplate("entry/user_info.html");
		StringWriter writer = new StringWriter();
		SimpleHash root = new SimpleHash(ObjectWrapper.BEANS_WRAPPER);
		root.put("user", user);
		template.process(root, writer);
		return writer.toString();
	}


	/**
	 * 生成静态页面主方法
	 * 
	 * @param context
	 *            ServletContext
	 * @param data
	 *            一个Map的数据结果集
	 * @param templatePath
	 *            ftl模版路径
	 * @param targetHtmlPath
	 *            生成静态页面的路径
	 */
	public void createHTML(Map data, String templatePath, String targetHtmlPath) {
		Writer out=null;
		try {
			// 指定模版路径
			Template template = cfg.getTemplate(templatePath, "UTF-8");
			template.setEncoding("UTF-8");
			// 静态页面路径
			String targetHtmlFolder = targetHtmlPath.substring(0,
					targetHtmlPath.lastIndexOf(CommonConst.SEP));
			File folder = new File(targetHtmlFolder);
			File htmlFile = new File(targetHtmlPath);
			if (!folder.exists())
				folder.mkdirs();
			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(htmlFile), "UTF-8"));
			// 处理模版
			template.process(data, out);
			out.flush();
		} catch (Exception e) {
			log.error(e.getMessage());
		}finally{
			if(out!=null)
				try {
					out.close();
				} catch (IOException e) {
				}
		}
	}

//	/**
//	 * 生成html,直接从数据库调用模板
//	 * 
//	 * @param data
//	 * @param templateContent 模板内容
//	 * @param targetHtmlPath
//	 * @throws NgbCommonException 
//	 * @throws IOException 
//	 * @throws TemplateException 
//	 */
//	public void createSiteHTML(Map data, SoaTemplate t,
//			String targetHtmlPath) throws NgbCommonException  {
//			try {
//				// 指定模版路径
//				cfg.setTemplateLoader(new StringTemplateLoader());
//				Template template = cfg.getTemplate(t.getContent(), "GBK");
//				// 静态页面路径
//				String targetHtmlFolder = targetHtmlPath.substring(0,
//						targetHtmlPath.lastIndexOf(CommonConst.SEP));
//				File folder = new File(targetHtmlFolder);
//				File htmlFile = new File(targetHtmlPath);
//				if (!folder.exists())
//					folder.mkdirs();
//				Writer out = new BufferedWriter(new OutputStreamWriter(
//						new FileOutputStream(htmlFile), "GBK"));
//				// 处理模版
//				template.process(data, out);
//				out.flush();
//				out.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//				String error = e.toString().length()>200?e.toString().substring(0, 200):e.toString();
//				throw new NgbCommonException("模板格式不正确，模板:"+t.getName()+",错误："+error);
//				// TODO: handle exception
//			}
//	}
	public void createSiteHTML(Map data, String content,
			String targetHtmlPath) throws IOException, TemplateException   {
				// 指定模版路径
				cfg.setTemplateLoader(new StringTemplateLoader());
				Template template = cfg.getTemplate(content, "GBK");
				// 静态页面路径
				String targetHtmlFolder = targetHtmlPath.substring(0,
						targetHtmlPath.lastIndexOf(CommonConst.SEP));
				File folder = new File(targetHtmlFolder);
				File htmlFile = new File(targetHtmlPath);
				if (!folder.exists())
					folder.mkdirs();
				Writer out = new BufferedWriter(new OutputStreamWriter(
						new FileOutputStream(htmlFile), "GBK"));
				// 处理模版
				template.process(data, out);
				out.flush();
				out.close();
	}


}
