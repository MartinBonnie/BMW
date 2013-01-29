
package com.zwrx.bmw.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.Sort;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.transform.ResultTransformer;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.zwrx.bmw.common.PaginationSupport;
import com.zwrx.bmw.dao.impl.LuceneQuery;

/**
 * *AdminService.java
 */
public interface BaseService {
	public void save(Object entity);

	public void delete(Object entity);

	public void deleteAll(Collection entites);

	@SuppressWarnings("unchecked")
	public Object findById(Class clazz, String id);

	public void load(Object obj, Serializable id);

	public void refresh(Object entity);

	@SuppressWarnings("unchecked")
	public List findByExample(Object example);

	public List findByHql(String hql);

	public List<?> findByHqlAndTop(String hql, int topNum);

	public int getStatBySql(String sql);

	@SuppressWarnings("unchecked")
	public List findAll(Class clazz);

	public void saveOrUpdate(Object entity);

	public void saveOrUpdateAll(Collection entities);

	public void update(Object entity);

	public void merge(Object instance);

	public List<?> find(String hql, Object... values);

	public int bulkUpdate(String hql, Object... values);

	public List<?> query(String sql, RowMapper rowMapper);

	public Object query(String sql, ResultSetExtractor rse);

	public int[] batchUpdate(String[] sql);

	public PaginationSupport findPageByCriteria(
			DetachedCriteria detachedCriteria);

	public PaginationSupport findPageByCriteria(
			DetachedCriteria detachedCriteria, int startIndex);

	public PaginationSupport findPageByCriteria(
			DetachedCriteria detachedCriteria, int pageSize, int startIndex);

	public PaginationSupport findPageByCriteria(
			DetachedCriteria detachedCriteria, int pageSize, int startIndex,
			ResultTransformer resultTransformer);

	@SuppressWarnings("unchecked")
	public List findAllByCriteria(DetachedCriteria detachedCriteria);

	public int getCountByCriteria(DetachedCriteria detachedCriteria);

	public void callProcedure(String procString, List<Object> params)
			throws Exception;

	@SuppressWarnings("unchecked")
	public List getCallProcedureResult(String procString, List<Object> params)
			throws Exception;

	public List findUserByParams(String[] fields, String key, Class clazz)
			throws Exception;

	public List findUserByParamsByPage(String[] fields, String key,
			Class clazz, int page, int pageSize) throws ParseException;

	public List findByCriteria(DetachedCriteria detachedCriteria);

	public PaginationSupport findPageBySql(String string, int pageSize,
			int startIndex, ResultTransformer object);

	public PaginationSupport findPageByGroupBy(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex, final ResultTransformer resultTransformer);

	public List findByCriteria(DetachedCriteria detachedCriteria,
			ResultTransformer resultTransformer);

	public PaginationSupport findPaginationUserByParams(String[] fields,
			String key, Class clazz, int page, int pageSize);

	public PaginationSupport findPaginationUserByParams(String[] fields,
			String key, Class clazz, int page, int pageSize, Sort sort);

	public PaginationSupport findPaginationUserByParams(String[] fields,
			String[] key, Class clazz, int page, int pageSize);
	
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
