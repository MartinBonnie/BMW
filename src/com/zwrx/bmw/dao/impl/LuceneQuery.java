
package com.zwrx.bmw.dao.impl;

import com.zwrx.bmw.util.StringUtil;


public class LuceneQuery {
	private String addQuery = "";
	private String orQuery = "";
	
	/**
	 * +(field:key)
	 * @param field
	 * @param key
	 */
	public void and(String field, String key){
		addQuery += "+(" + field + ":" + key + ")";
	}
	
	/**
	 * 空格field:key
	 * @param field
	 * @param key
	 */
	public void or(String field, String key){
		orQuery += " " + field + ":" + key;
	}
	
	public String toString(){
		StringBuilder result = new StringBuilder();
		if(StringUtil.isNotBlank(addQuery)){
			result.append(addQuery);
		}
		if(StringUtil.isNotBlank(orQuery)){
			orQuery = orQuery.substring(1);
			result.append("+(");
			result.append(orQuery);
			result.append(")");
		}
		return result.toString();
	}
	
	public static void main(String[] args) {
		LuceneQuery query = new LuceneQuery();
		query.or("field1", "key1");
		query.and("desc", "descvalue");
		query.or("field2", "key2");
		query.and("name", "namevalue");
		query.or("field3", "key3");
		query.and("state", "statevalue");
		System.out.println(query);
	}
}
