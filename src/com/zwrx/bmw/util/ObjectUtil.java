/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "ObjectUtil.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2009-12-14           baowp                      initial
 */

package com.zwrx.bmw.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class ObjectUtil {
	static org.apache.log4j.Logger log = org.apache.log4j.Logger
			.getLogger(ObjectUtil.class);

	/**
	 * @author baowp
	 */
	public static void copy(Object source, Object target) {
		extendAll(target, source);
	}

	/**
	 * @author baowp
	 */
	public static Object copy(Object source) {
		Object target = new Object();
		extendAll(target, source);
		return target;
	}

	/**
	 * inherit all properties from parent(s) to self
	 * 
	 * @author baowp
	 * @since 2010-02-02
	 */
	public static void extendAll(Object self, Object... parent) {
		for (Object obj : parent) {
			inheritParent(self, obj, new Build());
		}
	}

	/**
	 * inherit not null properties from parent(s) to self
	 * 
	 * @author baowp
	 * @since 2010-02-02
	 */
	public static void extend(Object self, Object... parent) {
		for (Object obj : parent) {
			inheritParent(self, obj, new Build() {
				public boolean check(Map.Entry<?, ?> entry) {
					return entry.getValue() != null;
				}
			});
		}
	}

	/**
	 * @author baowp
	 * @since 2010-02-02
	 * @return new instance inherit parameters' not null properties
	 */
	@SuppressWarnings("unchecked")
	public static <T> T extendz(T... parent) {
		T newInstance = null;
		try {
			newInstance = (T) parent[0].getClass().newInstance();
		} catch (Exception e) {
		}
		extend(newInstance, parent);
		return newInstance;
	}

	public static void highLight(Object obj) {
		inheritParent(obj, obj, new Build() {
			protected boolean check(Map.Entry<?, ?> entry) {
				return entry.getValue() instanceof String;
			}

			protected Object getValue(Map.Entry<?, ?> entry) {
				return "<span class=\"high-light\">" + entry.getValue()
						+ "</span>";
			}
		});
	}

	public static String getMethodName(String prefix, String fieldName) {
		return prefix + fieldName.substring(0, 1).toUpperCase()
				+ fieldName.substring(1);
	}

	public static String getMethodName(String prefix, Field field) {
		return getMethodName(prefix, field.getName());
	}

	public static String getMethodName(String fieldName) {
		return getMethodName("get", fieldName);
	}

	public static String getMethodName(Field field) {
		return getMethodName("get", field);
	}

	public static String getFieldName(String methodName) {
		return Character.toLowerCase(methodName.charAt(3))
				+ methodName.substring(4);
	}

	private static void inheritParent(Object self, Object parent, Build build) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (Field field : parent.getClass().getFields()) {
			try {
				map.put(field.getName(), field.get(parent));
			} catch (Exception e) {
			}
		}
		for (Method method : parent.getClass().getMethods()) {
			String name = method.getName();
			if (name.startsWith("get") && name.length() > 3
					&& !name.equals("getClass")) {
				try {
					map.put(getFieldName(name), method.invoke(parent));
				} catch (Exception e) {
				}
			}
		}
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			if (!build.check(entry))
				continue;
			String key = build.getKey(entry);
			Object value = build.getValue(entry);
			String name = getMethodName("set", key);
			try {
				Method method = self.getClass().getMethod(name,
						value.getClass());
				method.invoke(self, value);
			} catch (Exception e) {
				try {
					Field field = self.getClass().getField(key);
					field.set(self, value);
				} catch (Exception e1) {
					try {
						Field field = self.getClass().getDeclaredField(key);
						field.setAccessible(true);
						field.set(self, value);
					} catch (Exception e2) {
					}
				}
			}
		}
	}

	private static class Build {
		protected boolean check(Map.Entry<?, ?> entry) {
			return true;
		}

		protected String getKey(Map.Entry<?, ?> entry) {
			return (String) entry.getKey();
		}

		protected Object getValue(Map.Entry<?, ?> entry) {
			return entry.getValue();
		}
	}
}
