package com.zwrx.bmw.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.zwrx.bmw.common.CommonConst;
import com.zwrx.bmw.common.ConfConst;
import com.zwrx.bmw.models.BwmSyscode;
import com.zwrx.bmw.service.BaseService;
import com.zwrx.bmw.util.BeansFactory;
import com.zwrx.bmw.util.FileUtil;


/**
 * *ConfServlet.java
 */
public class ConfServlet extends HttpServlet {
	/**
	 * serial id
	 */
	private static final long serialVersionUID = -2819896512667530335L;
	private static Log log = LogFactory.getLog(ConfServlet.class);

	/**
	 * Constructor of the object.
	 */
	public ConfServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		Properties sys = System.getProperties();
		System.setProperty("jmagick.systemclassloader", "no");
		CommonConst.SEP = sys.getProperty("file.separator");
		CommonConst.REALPATH = this.getServletContext().getRealPath(
				CommonConst.SEP);
		CommonConst.CONTEXTROOT = this.getServletContext().getContextPath();
		CommonConst.CLASSPATH = CommonConst.REALPATH + CommonConst.SEP
				+ "WEB-INF" + CommonConst.SEP + "classes" + CommonConst.SEP;
		BaseService baseService = (BaseService)BeansFactory.get("baseService");
		
		try {
			loadConfigProperties("/WEB-INF/classes/conf.properties",
					ConfConst.class.getName());
			loadLanguageProperties("/WEB-INF/classes/language.properties");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 读取配置文件，并且将配置文件中的值赋予配置的常量类
	 * 
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * 
	 * @throws Exception
	 */
	private void loadConfigProperties(String filePath, String className)
			throws IOException, ClassNotFoundException {
		ServletContext context = this.getServletContext();
		InputStream in = context.getResourceAsStream(filePath);
		Properties p = new Properties();
		p.load(in);
		Class<?> cls = Class.forName(className);
		for (Map.Entry<?, ?> entry : p.entrySet()) {
			String key = (String) entry.getKey();
			String value = (String) entry.getValue();
			try {
				Field field = cls.getField(key);
				fillField(field, value);
			} catch (Exception e) {
				try {
					Field field = cls.getField(key.replaceAll("\\.", "_"));
					fillField(field, value);
				} catch (Exception e1) {
				}
			}
		}
		log.info("load properties finished");
	}

	private void fillField(Field field, String value) throws Exception {
		if (field.getType() == int.class)
			field.setInt(null, Integer.parseInt(value));
		else if (field.getType() == boolean.class)
			field.setBoolean(null, Boolean.parseBoolean(value));
		else
			field.set(null, value);
	}


	/**
	 * 加载语言包的配置
	 * 
	 * @param filePath
	 * @param className
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	private void loadLanguageProperties(String filePath) throws IOException,
			ClassNotFoundException {
		ServletContext context = this.getServletContext();
		InputStream in = context.getResourceAsStream(filePath);
		Properties p = new Properties();
		p.load(in);
		StringBuffer sb = new StringBuffer();
		sb.append("var lan={");
		for (Map.Entry<?, ?> entry : p.entrySet()) {
			String key = (String) entry.getKey();
			String value = (String) entry.getValue();
			CommonConst.languagePack.put(key, value);
			key = "'" + key + "'";
			value = "'" + value + "'";
			sb.append(key).append(":").append(value).append(",");
		}
		sb.append("0:0};");
		String path = this.getServletContext().getRealPath("/js/util");
		FileUtil.writeFileWithUTF8(path, "language.js", sb.toString());		// 生成 language.js 文件
		log.info("load properties finished");
	}

}
