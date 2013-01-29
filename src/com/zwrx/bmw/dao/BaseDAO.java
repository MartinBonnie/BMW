/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "BaseDAO.java is the copyrighted,
 * proprietary property of Abbcc Company and its
 * subsidiaries and affiliates which retain all right, title and interest
 * therein."
 * 
 * Revision History
 *
 * Date              Programmer                   Notes
 * ---------    ---------------------  --------------------------------------------
 * 2009-12-4           yixiugg                      initial
 **/

package com.zwrx.bmw.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.Sort;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.transform.ResultTransformer;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.zwrx.bmw.common.PaginationSupport;
import com.zwrx.bmw.dao.impl.LuceneQuery;




/**
 * *BaseDAO.java
 */
public interface BaseDAO {
	public void save(Object entity);

	public void delete(Object entity);

	public void deleteAll(Collection entities);
	
	public void deleteByHql(String hql);

	public Object findById(Class clazz, String id);

	public void loadById(Object obj, Serializable id);

	public void refresh(Object entity);

	public List findByExample(Object example);

	public List findAll(Class clazz);

	public void saveOrUpdate(Object entity);
	
	public void saveOrUpdateAll(Collection entities);

	public void update(Object entity);
	
	public void merge(Object entity);

	public List findByHql(String hql);
	
	public List<?> findByHqlAndTop(String hql, int topNum);

	public List<?> find(String hql, Object... values);

	public int bulkUpdate(String hql, Object... values);

	public List<?> query(String sql, RowMapper rowMapper);
	
	public Object query(String sql,ResultSetExtractor rse);

	public int[] batchUpdate(String[] sql);

	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria);

	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int startIndex);

	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex);
	
	public PaginationSupport findPaginationUserByParams(String[] fields, String key,
			Class clazz, int page, int pageSize) throws ParseException;
	
	public PaginationSupport findPaginationUserByParams(String[] fields, String key,
			Class clazz, int page, int pageSize,Sort sort) throws ParseException;
	
	public PaginationSupport findPaginationUserByParams(String[] fields, String[] key,
			Class clazz, int page, int pageSize) throws ParseException;
	
	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex, ResultTransformer resultTransformer);

	public List findAllByCriteria(final DetachedCriteria detachedCriteria);

	public int getCountByCriteria(final DetachedCriteria detachedCriteria);

	public void callProcedure(String procString, List<Object> params)
			throws Exception;

	public List getCallProcedureResult(String procString, List<Object> params)
			throws Exception;

	public List findUserByParams(String[] fields, String key, Class clazz)
			throws ParseException;

	public List findUserByParamsByPage(String[] fields, String key,
			Class clazz, int page, int pageSize) throws ParseException;
	
	public List findByCriteria(final DetachedCriteria detachedCriteria);
	
	public List findByCriteria(final DetachedCriteria detachedCriteria, final ResultTransformer resultTransformer) ;
	
	public int getStatBySql(String sql);
	
	public PaginationSupport findPageBySql(final String sql,
			final int pageSize, final int startIndex,
			final ResultTransformer resultTransformer);
	public PaginationSupport findPageByGroupBy(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex, final ResultTransformer resultTransformer);

	public void purgeIndex(Class clz, String id);

	public void addIndex(Class clz, String id);
	
	/**
	 * @param fields 字段名，必须有index的
	 * @param state 状态，必须是英文或中文，并且要有index
	 * @param key 关键字
	 * @param clazz
	 * @param page
	 * @param pageSize
	 * @return
	 * @throws ParseException
	 */
	public List<?> luceneByStateAndPage(String[] fields, String state, String key, Class<?> clazz, int page, int pageSize) throws ParseException;
	/**
	 * 通过LuceneQuery逻辑(与或)查询条件进行查询
	 */
	public List<?> luceneQueryByPage(LuceneQuery query, Class<?> clazz, int page, int pageSize) throws Exception;
	
	public PaginationSupport getQueryFromIndexByPage(LuceneQuery query, Class<?> clazz, int page, int pageSize) throws Exception ;
	
	public PaginationSupport getQueryFromIndexByPage(LuceneQuery query, Class<?> clazz, int page, int pageSize, Sort sort) throws Exception ;

}
