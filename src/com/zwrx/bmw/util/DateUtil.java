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

import java.text.*;
import java.util.*;

import org.apache.commons.lang.time.DateUtils;

public class DateUtil extends DateUtils{
	/**
	 * 按标准格式取得时间"yyyy-MM-dd hh:mm:ss"
	 */
	public String formatDate(String Format) {
		java.util.Date d = Calendar.getInstance().getTime();
		try {
			SimpleDateFormat f = new SimpleDateFormat(Format);
			return f.format(d);
		} catch (Exception e) {
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); // :iii
			return f.format(d);
		}
	}

	/**
	 * 按标准格式取得时间"yyyyMMddhhmmss"
	 */
	public String FormatDateTime() {
		java.sql.Time enter = new java.sql.Time(System.currentTimeMillis());
		java.sql.Date ent = new java.sql.Date(System.currentTimeMillis());
		java.util.Date d = Calendar.getInstance().getTime();
		SimpleDateFormat f = new SimpleDateFormat("yyyyMMddhhmmss");
		return f.format(d);
	}

	/**
	 * 按标准格式取得时间的几年后
	 */
	public String NextYear(String strdates, int ny) {
		// Calendar c = StrtoDate("yyyy-MM-dd hh:mm:ss",strdates);//取得当前日期
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, Integer.parseInt(strdates.substring(0, 4)));
		c.set(Calendar.MONTH, Integer.parseInt(strdates.substring(5, 7)) - 1);
		c.set(Calendar.DATE, Integer.parseInt(strdates.substring(8, 10)));
		c.add(Calendar.YEAR, ny); // c 加ny年
		c.add(Calendar.DATE, -1); // c 加-1天，是昨天的日期

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return f.format(c.getTime());
	}

	public String StrToDate(String Formate, String date) {
		Calendar c = Calendar.getInstance();
		try {
			c.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
			c.set(Calendar.MONTH, Integer.parseInt(date.substring(5, 7)) - 1);
			c.set(Calendar.DATE, Integer.parseInt(date.substring(8, 10)));
			java.util.Date d = c.getTime();
			SimpleDateFormat f = new SimpleDateFormat(Formate);
			return f.format(d);
		} catch (Exception e) {
			System.err.println(e + date);
			return "";
		}
	}

	public static String StrToDate(String date) {
		Calendar c = Calendar.getInstance();
		try {
			c.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
			c.set(Calendar.MONTH, Integer.parseInt(date.substring(5, 7)) - 1);
			c.set(Calendar.DATE, Integer.parseInt(date.substring(8, 10)));
			java.util.Date d = c.getTime();
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			return f.format(d);
		} catch (Exception e) {
			System.err.println(e + date);
			return "";
		}
	}

	public static Date strToDate(String str) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, Integer.parseInt(str.substring(0, 4)));
		c.set(Calendar.MONTH, Integer.parseInt(str.substring(5, 7)) - 1);
		c.set(Calendar.DATE, Integer.parseInt(str.substring(8, 10)));
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);

		return c.getTime();

	}

	/**
	 * *************************************************************************
	 */
	/**
	 * <p>
	 * 取得变化几月的日期，例如date：2007-01-30 如果var：1 返回值2008-01-30，如果var：-1 返回值2006-01-31
	 * <p>
	 * strdates：当前操作时间
	 * <p>
	 * ny：变更月数
	 * <p>
	 * return：时间字符串yyyy-MM-dd hh:mm:ss（类型：String）
	 */
	/**
	 * *************************************************************************
	 */
	public String MonthDiff(String strdates, int ny) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, Integer.parseInt(strdates.substring(0, 4)));
		c.set(Calendar.MONTH, Integer.parseInt(strdates.substring(5, 7)) - 1);
		c.set(Calendar.DATE, Integer.parseInt(strdates.substring(8, 10)));
		c.add(Calendar.MONTH, ny);
		if (ny > 0)
			c.add(Calendar.DATE, -1);
		else if (ny < 0)
			c.add(Calendar.DATE, 1);
		else {
		}

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return f.format(c.getTime());
	}

	/**
	 * *************************************************************************
	 */
	/**
	 * <p>
	 * 取得指定日期的月份天数 如strDate：2007-01-30 返回值 31
	 * <p>
	 * strDate：当前操作的日期
	 * <p>
	 * return：时间字符串（类型：int）
	 */
	/**
	 * *************************************************************************
	 */
	public int getDaysnum(String strDate) {
		int day = 0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			java.util.Date d = new Date(Integer.parseInt(strDate
					.substring(0, 4)), Integer
					.parseInt(strDate.substring(5, 7)) - 1, 1);
			c1.set(d.getYear(), d.getMonth(), 1);
			c2.set(d.getYear(), d.getMonth() + 1, 1);
			day = c2.get(Calendar.DAY_OF_YEAR) - c1.get(Calendar.DAY_OF_YEAR);
		} catch (Exception e) {
			// System.out.println(e.getMessage());
			return 0;
		}
		return day;
	}

	public String yesterDate(String date) {
		Calendar c = Calendar.getInstance();
		try {
			c.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
			c.set(Calendar.MONTH, Integer.parseInt(date.substring(5, 7)) - 1);
			c.set(Calendar.DATE, Integer.parseInt(date.substring(8, 10)) - 1);
			java.util.Date d = c.getTime();
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			return f.format(d);
		} catch (Exception e) {
			System.err.println(e + date);
			return "";
		}
	}

	public String tommorwDate(String date) {
		Calendar c = Calendar.getInstance();
		try {
			c.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
			c.set(Calendar.MONTH, Integer.parseInt(date.substring(5, 7)) - 1);
			c.set(Calendar.DATE, Integer.parseInt(date.substring(8, 10)) + 1);
			java.util.Date d = c.getTime();
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			return f.format(d);
		} catch (Exception e) {
			System.err.println(e + date);
			return "";
		}
	}

	// 月份天数
	public String getDays(String date) {
		int DaysInMonth[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		Calendar c = Calendar.getInstance();
		GregorianCalendar gc = (GregorianCalendar) c;
		try {
			int year = Integer.parseInt(date.substring(0, 4));
			int month = Integer.parseInt(date.substring(5, 7)) - 1;
			int day = DaysInMonth[month]
					+ ((gc.isLeapYear(year) && (month == 1)) ? 1 : 0);
			return String.valueOf(day);
		} catch (Exception e) {
			System.err.println(e + date);
			return "31";
		}
	}

	/**
	 * 取得日期 例如2003-12-04
	 */
	public String getDate() {
		java.sql.Date enter = new java.sql.Date(System.currentTimeMillis());
		return enter.toString();
	}

	/**
	 * 取得时间 例如09:27:12
	 */
	public String getTime() {
		java.sql.Time ent = new java.sql.Time(System.currentTimeMillis());
		return ent.toString();
	}

	/**
	 * 取得星期 例如星期四
	 */
	public String getWeek() {
		String weekinfo = "";
		int week = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		switch (week) {
		case 1:
			weekinfo = "星期日";
			break;
		case 2:
			weekinfo = "星期一";
			break;
		case 3:
			weekinfo = "星期二";
			break;
		case 4:
			weekinfo = "星期三";
			break;
		case 5:
			weekinfo = "星期四";
			break;
		case 6:
			weekinfo = "星期五";
			break;
		case 7:
			weekinfo = "星期六";
			break;
		default:
			weekinfo = "";
		}
		return weekinfo;
	}

	/**
	 * 取得星期 例如星期四
	 */
	public String getWeek(String strDate) {
		String weekinfo = "";
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(strDate.substring(0, 4)), Integer
				.parseInt(strDate.substring(5, 7)) - 1, Integer
				.parseInt(strDate.substring(8, 10)));
		int week = cal.get(Calendar.DAY_OF_WEEK);
		switch (week) {
		case 1:
			weekinfo = "星期日";
			break;
		case 2:
			weekinfo = "星期一";
			break;
		case 3:
			weekinfo = "星期二";
			break;
		case 4:
			weekinfo = "星期三";
			break;
		case 5:
			weekinfo = "星期四";
			break;
		case 6:
			weekinfo = "星期五";
			break;
		case 7:
			weekinfo = "星期六";
			break;
		default:
			weekinfo = "";
		}
		return weekinfo;
	}

	/**
	 * 取得年月日星期
	 */
	public String getChinseDate() {
		return formatDate("yyyy") + "年" + formatDate("MM") + "月"
				+ formatDate("dd") + "日  " + getWeek(getDate());
	}

	/**
	 * 取得年月日
	 */
	public String getChinseDate(String date) {
		return StrToDate("yyyy", date) + "年" + StrToDate("MM", date) + "月"
				+ StrToDate("dd", date) + "日  ";
	}

	/**
	 * 取得200604
	 */
	public String getConDate() {
		return formatDate("yyyy") + formatDate("MM");
	}

	/**
	 * 取得日期 例如2003-12-04
	 */
	public String getYearMonth() {
		return formatDate("yyyy") + "-" + formatDate("MM");
	}

	/**
	 * 取得日期时间 例如2003-12-04 09:27:12
	 */
	public String getDateTime() {
		java.sql.Time enter = new java.sql.Time(System.currentTimeMillis());
		java.sql.Date ent = new java.sql.Date(System.currentTimeMillis());
		String sDateTime = ent.toString() + ' ' + enter.toString();
		return sDateTime;
	}

	/**
	 * 取得时间差
	 */
	public long DateTimeSpace(String starttime, String endtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long starttimes = 0;
		long endtimes = 0;
		long spacetime = 0;
		try {
			starttimes = sdf.parse(starttime).getTime();
			endtimes = sdf.parse(endtime).getTime();
		} catch (ParseException e) {
			System.out.println(e);
		}

		spacetime = Math.abs(endtimes - starttimes) / 1000 / 60;
		return spacetime;
	}

	// 日期后几天
	public String AfterDate(String basicDate, int n) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long nday = 0;
		long basicday = 0;
		String newdate = "";
		try {
			basicday = sdf.parse(basicDate).getTime();
		} catch (ParseException e) {
			System.out.println(e);
		}
		nday = (basicday / (24 * 60 * 60 * 1000) + n) * (24 * 60 * 60 * 1000);
		java.sql.Date ent = new java.sql.Date(System.currentTimeMillis());
		ent.setTime(nday);
		newdate = ent.toString();
		return newdate;
	}

	public static String formatDate(Date date) {
		String dateformat = "yyyy-MM-dd HH:mm";
		return formatDate(date, dateformat);

	}

	public static String formatDate(Date date, String dateformat) {
		if(date==null)
			return "";
		SimpleDateFormat sdf = new SimpleDateFormat(dateformat);
		return sdf.format(date);

	}

	public static Date getCurrentDateEnd() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}

	public static Date getCurrentDateStart() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	public static Date getDateEnd(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, (date.getYear()+1900));
		calendar.set(Calendar.MONTH, date.getMonth());
		calendar.set(Calendar.DATE, date.getDate());
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}
	
	/**
	 * 本月第一天
	 * @return
	 */
	public static Date getMonthStart() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.DATE, 1);
		return calendar.getTime();
	}

	public static Date getDateStart(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, (date.getYear()+1900));
		calendar.set(Calendar.MONTH, date.getMonth());
		calendar.set(Calendar.DATE, date.getDate());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}
	
	public static Date getDateAfter(Date date,long offset){
		long offsettime = 1000*60*60*24*offset;
		long t = date.getTime()+offsettime;
		return new Date(t);
	}
	
	/**
	 * 解析字符串到日期
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date parseDate(String date,String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			return new Date();
		}
	}
}
