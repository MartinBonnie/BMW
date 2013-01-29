/**
 * Copyright (c) 2010 Abbcc Corp.
 * No 225,Wen Yi RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "IdentifierGeneratorHelper.java is the copyrighted,
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
package com.zwrx.bmw.dao.impl;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.SimpleAnalyzer;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Sort;
import org.apache.lucene.util.Version;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.transform.ResultTransformer;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.wltea.analyzer.lucene.IKAnalyzer;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.zwrx.bmw.common.PaginationSupport;
import com.zwrx.bmw.dao.BaseDAO;
import com.zwrx.bmw.util.BeansFactory;
import com.zwrx.bmw.util.StringUtil;

/**
 * A data access object (DAO) providing persistence and search support for
 * Object entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.abbcc.dao.impl.Object
 * @author MyEclipse Persistence Tools
 */

public class BaseDAOImpl implements BaseDAO {
	private static Log LOG = LogFactory.getLog(BaseDAOImpl.class);
	
	protected final org.apache.log4j.Logger log = org.apache.log4j.Logger
			.getLogger(this.getClass());
	
	// iBatis的Template
	private SqlMapClientTemplate sqlMapClientTemplate;
	// Hibernate的Template
	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	// 设置Hibernate
	public void setSessionFactory(SessionFactory sessionFactory) {
		if (this.hibernateTemplate == null) {
			this.hibernateTemplate = new HibernateTemplate(sessionFactory);
		} else {
			this.hibernateTemplate.setSessionFactory(sessionFactory);
		}
	}

	// 设置ibatis
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		if (this.sqlMapClientTemplate == null) {
			this.sqlMapClientTemplate = new SqlMapClientTemplate();
		}
		this.sqlMapClientTemplate.setSqlMapClient(sqlMapClient);
	}

	public void setDataSource(DataSource dataSource) {
		if (this.jdbcTemplate == null
				|| dataSource != this.jdbcTemplate.getDataSource()) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	}

	// 获取Hibernate的模板
	protected HibernateTemplate getHibernateTemplate() {
		return this.hibernateTemplate;
	}

	// 获取iBatis的模板
	protected SqlMapClientTemplate getSqlMapClientTemplate() {
		return this.sqlMapClientTemplate;
	}

	protected JdbcTemplate getJdbcTemplate() {
		return this.jdbcTemplate;
	}

	/**
	 * 获得单例
	 * 
	 * @return
	 */
	public static BaseDAOImpl getInstance() {
		return (BaseDAOImpl) BeansFactory.get("baseDAO");
	}

	/**
	 * 保存进数据库，同时写入索引文件
	 * 
	 * @param transientInstance
	 */
	public void save(Object transientInstance) {
		LOG.debug("saving Object instance");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			fullTextSession.save(transientInstance);

			LOG.debug("save successful");
		} catch (RuntimeException re) {
			LOG.error("save failed", re);
			throw re;
		}
	}

	/**
	 * 从索引里面删除
	 */
	@Override
	public void purgeIndex(Class clz,String id) {
		LOG.debug("Purge Object index");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			fullTextSession.purge(clz, id);

			LOG.debug("Purge index successful");
		} catch (RuntimeException re) {
			LOG.error("Purge index failed", re);
			throw re;
		}
	}
	
	/**
	 * 重新添加到索引
	 */
	@Override
	public void addIndex(Class clz,String id) {
		LOG.debug("Add Object index");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			Object o = fullTextSession.load(clz, id);
			fullTextSession.index(o);
			LOG.debug("Add index successful");
		} catch (RuntimeException re) {
			LOG.error("Add index failed", re);
			throw re;
		}
	}
	
	/**
	 * 删除
	 * 
	 * @param persistentInstance
	 */
	public void delete(Object persistentInstance) {
		LOG.debug("deleting Object instance");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			fullTextSession.delete(persistentInstance);
			LOG.debug("delete successful");
		} catch (RuntimeException re) {
			LOG.error("delete failed", re);
			throw re;
		}
	}

	public void deleteAll(Collection entities) {
		getHibernateTemplate().deleteAll(entities);
	}

	/**
	 * 根据主键查找
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public Object findById(Class clazz, String id) {
		LOG.debug("getting Object instance with id: " + id);
		try {
			Object instance = (Object) getHibernateTemplate().get(clazz, id);
			return instance;
		} catch (RuntimeException re) {
			LOG.error("get failed", re);
			throw re;
		}
	}

	/**
	 * 根据主键load
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public void loadById(Object obj, Serializable id) {
		LOG.debug("getting Object instance with id: " + id);
		try {
			getHibernateTemplate().load(obj, id);
		} catch (RuntimeException re) {
			LOG.error("get failed", re);
			throw re;
		}
	}

	public void refresh(Object entity) {
		getHibernateTemplate().refresh(entity);
	}

	/**
	 * 查询
	 * 
	 * @param instance
	 * @return
	 */
	public List findByExample(Object instance) {
		LOG.debug("finding Object instance by example");
		try {
			List results = (List) getHibernateTemplate()
					.findByExample(instance);
			LOG.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			LOG.error("find by example failed", re);
			throw re;
		}
	}

	/**
	 * 查找全部
	 * 
	 * @param clazz
	 * @return
	 */
	public List findAll(Class clazz) {
		LOG.debug("finding all Object instances");
		try {
			String queryString = "from " + clazz.getName();
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			LOG.error("find all failed", re);
			throw re;
		}
	}

	/**
	 * 通过HQL查找
	 * 
	 * @param clazz
	 * @return
	 */
	public List findByHql(String hql) {
		LOG.debug("finding all Object instances");
		try {
			List query = getHibernateTemplate().find(hql);
			System.out.println("query的值是:" + query);
			return query;
		} catch (RuntimeException re) {
			LOG.error("find all failed", re);
			throw re;
		}
	}
	
	public List<?> findByHqlAndTop(String hql, int topNum) {
		LOG.debug("finding all Object instances");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
			.getCurrentSession();
			Query query = session.createQuery(hql).setMaxResults(topNum);
			List<?> list =query.list();
			return list;
		} catch (RuntimeException re) {
			LOG.error("find all failed", re);
			throw re;
		}
	}

	public void deleteByHql(String hql) {
		LOG.debug("finding all Object instances");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			session.createQuery(hql).executeUpdate();
			session.close();
		} catch (RuntimeException re) {
			LOG.error("find all failed", re);
			throw re;
		}
	}

	/**
	 * 修改
	 * 
	 * @param instance
	 */
	public void saveOrUpdate(Object instance) {
		LOG.debug("attaching dirty Object instance");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			fullTextSession.saveOrUpdate(instance);
			LOG.debug("attach successful");
		} catch (RuntimeException re) {
			LOG.error("attach failed", re);
			throw re;
		}
	}

	public void saveOrUpdateAll(Collection entities) {
		getHibernateTemplate().saveOrUpdateAll(entities);
	}

	public void update(Object instance) {
		LOG.debug("update dirty Object instance");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
					.getCurrentSession();
			FullTextSession fullTextSession = Search
					.getFullTextSession(session);
			fullTextSession.update(instance);
			LOG.debug("update successful");
		} catch (RuntimeException re) {
			LOG.error("update failed", re);
			throw re;
		}
	}
	
	public void merge(Object instance) {
		LOG.debug("update dirty Object instance");
		try {
			Session session = getHibernateTemplate().getSessionFactory()
			.getCurrentSession();
			FullTextSession fullTextSession = Search
			.getFullTextSession(session);
			fullTextSession.merge(instance);
			LOG.debug("update successful");
		} catch (RuntimeException re) {
			LOG.error("update failed", re);
			throw re;
		}
	}

	public List<?> find(String hql, Object... values) {
		return getHibernateTemplate().find(hql, values);
	}

	public int bulkUpdate(String hql, Object... values) {
		return getHibernateTemplate().bulkUpdate(hql, values);
	}

	public List<?> query(String sql, RowMapper rowMapper)
			throws DataAccessException {
		return (List<?>) getJdbcTemplate().query(sql, rowMapper);
	}
	
	public Object query(String sql,ResultSetExtractor rse){
		return getJdbcTemplate().query(sql, rse);
	}

	public int[] batchUpdate(String[] sql) {
		return getJdbcTemplate().batchUpdate(sql);
	}

	/**
	 * 分页拿到第一页
	 * 
	 * @param detachedCriteria
	 * @return
	 */
	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria) {
		return findPageByCriteria(detachedCriteria, PaginationSupport.PAGESIZE,
				0);
	}

	/**
	 * 分页，从某条记录开始
	 * 
	 * @param detachedCriteria
	 * @param startIndex
	 * @return
	 */
	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int startIndex) {
		return findPageByCriteria(detachedCriteria, PaginationSupport.PAGESIZE,
				startIndex);
	}

	/**
	 * 条件查询
	 * 
	 * @param detachedCriteria
	 * @return
	 */
	public List findByCriteria(final DetachedCriteria detachedCriteria) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Criteria criteria = detachedCriteria
						.getExecutableCriteria(session);
				criteria.setProjection(null);
				List items = criteria.list();
				return items;
			}
		});
	}
	
	/**
	 * 条件查询
	 * 
	 * @param detachedCriteria
	 * @return
	 */
	public List findByCriteria(final DetachedCriteria detachedCriteria, final ResultTransformer resultTransformer) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Criteria criteria = detachedCriteria
						.getExecutableCriteria(session);
				criteria.setProjection(null);
				if (resultTransformer != null)
					criteria.setResultTransformer(resultTransformer);
				List items = criteria.list();
				return items;
			}
		});
	}

	/**
	 * 分页，提供页大小和起始
	 * 
	 * @param detachedCriteria
	 * @param pageSize
	 * @param startIndex
	 * @return
	 */
	public PaginationSupport findPageByCriteria(
			DetachedCriteria detachedCriteria, int pageSize, int startIndex) {
		return findPageByCriteria(detachedCriteria, pageSize, startIndex, null);
	}

	/**
	 * 分页，提供页大小,起始和结果集传送方式
	 * 
	 * @param detachedCriteria
	 * @param pageSize
	 * @param startIndex
	 * @param resultTransformer
	 * @return
	 */
	public PaginationSupport findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex, final ResultTransformer resultTransformer) {
		return (PaginationSupport) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Criteria criteria = detachedCriteria
								.getExecutableCriteria(session);
						Long totalCount = (Long) criteria.setProjection(
								Projections.rowCount()).uniqueResult();
						criteria.setProjection(null);
						if (resultTransformer != null)
							criteria.setResultTransformer(resultTransformer);
						List items = criteria.setFirstResult(startIndex)
								.setMaxResults(pageSize).list();
						PaginationSupport ps = new PaginationSupport(items,
								totalCount.intValue(), pageSize, startIndex);
						return ps;
					}
				});
	}
	
	public PaginationSupport findPageByGroupBy(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex, final ResultTransformer resultTransformer) {
		return (PaginationSupport) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Criteria criteria = detachedCriteria
								.getExecutableCriteria(session);
						if (resultTransformer != null)
							criteria.setResultTransformer(resultTransformer);
						List items = criteria.setFirstResult(startIndex)
								.setMaxResults(pageSize).list();
						PaginationSupport ps = new PaginationSupport(items,
								items.size(), pageSize, startIndex);
						return ps;
					}
				});
	}
	
	public PaginationSupport findPageBySql(final String sql,
			final int pageSize, final int startIndex,
			final ResultTransformer resultTransformer) {
		return (PaginationSupport) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(sql);

						int totalCount = query.list().size();
						if (resultTransformer != null)
							query.setResultTransformer(resultTransformer).uniqueResult();
						List items = query.setFirstResult(startIndex)
								.setMaxResults(pageSize).list();
						PaginationSupport ps = new PaginationSupport(items,
								totalCount, pageSize, startIndex);
						return ps;
					}
				});
	}

	/**
	 * 得到全部
	 * 
	 * @param detachedCriteria
	 * @return
	 */
	public List findAllByCriteria(final DetachedCriteria detachedCriteria) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Criteria criteria = detachedCriteria
						.getExecutableCriteria(session);
				return criteria.list();
			}
		});
	}

	/**
	 * 得到总数
	 * 
	 * @param detachedCriteria
	 * @return
	 */
	public int getCountByCriteria(final DetachedCriteria detachedCriteria) {
		Integer count = (Integer) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Criteria criteria = detachedCriteria
								.getExecutableCriteria(session);
						return criteria.setProjection(Projections.rowCount())
								.uniqueResult();
					}
				});
		return count.intValue();
	}

	/***************************************************************************
	 * 直接调用存储过程
	 * 
	 * @param procString
	 * @author kongqz
	 * @throws Exception
	 * @date 2009-03-03
	 **************************************************************************/
	public void callProcedure(String procString, List<Object> params)
			throws Exception {
		CallableStatement stmt = null;
		try {
			stmt = getHibernateTemplate().getSessionFactory()
					.getCurrentSession().connection().prepareCall(procString);
			if (params != null) {
				int idx = 1;
				for (Object obj : params) {
					if (obj != null) {
						stmt.setObject(idx, obj);
					} else {
						stmt.setNull(idx, Types.NULL);
					}
					idx++;
				}
			}
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("调用存储过程的时候发生错误[sql = " + procString + "]", e);
		} finally {
			stmt.close();
		}
	}

	/***************************************************************************
	 * 直接调用存储过程，然后返回结果
	 * 
	 * @param procString
	 * @author kongqz
	 * @throws Exception
	 * @date 2009-03-03
	 **************************************************************************/
	public List getCallProcedureResult(String procString, List<Object> params)
			throws Exception {
		CallableStatement stmt = null;
		List list = null;
		ResultSet rs = null;
		try {
			stmt = getHibernateTemplate().getSessionFactory()
					.getCurrentSession().connection().prepareCall(procString);
			if (params != null) {
				int idx = 1;
				for (Object obj : params) {
					if (obj != null) {
						stmt.setObject(idx, obj);
					} else {
						stmt.setNull(idx, Types.NULL);
					}
					idx++;
				}
			}
			rs = stmt.executeQuery();
			while (rs.next()) {
				// do some parse
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("调用存储过程的时候发生错误[sql = " + procString + "]", e);
		} finally {
			stmt.close();
			rs.close();
		}
		return list;
	}

	/**
	 * lucene查询
	 */
	public List findUserByParams(String[] fields, String key, Class clazz)
			throws ParseException {

		key = StringUtil.filtrate(key);
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_31,fields,
				new IKAnalyzer());
		org.apache.lucene.search.Query query = parser.parse(key);
		org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
				query, clazz);
		List result = hibQuery.list();
		return result;
	}

	/**
	 * lucene查询分页
	 * 
	 * @param fields
	 * @param key
	 * @param clazz
	 * @param page
	 * @param pageSize
	 * @return
	 * @throws ParseException
	 */
	public List findUserByParamsByPage(String[] fields, String key,
			Class clazz, int page, int pageSize) throws ParseException {

		key = StringUtil.filtrate(key);
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_31,fields,
				new IKAnalyzer());
		org.apache.lucene.search.Query query = parser.parse(key);
		org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
				query, clazz);
		int startIndex = (page - 1) * pageSize;
		hibQuery.setMaxResults(pageSize);
		hibQuery.setFirstResult(startIndex);
		List result = hibQuery.list();
		return result;
	}
	
	public PaginationSupport findPaginationUserByParams(String[] fields, String key,
			Class clazz, int page, int pageSize) throws ParseException {

		key = StringUtil.filtrate(key);
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_31,fields,
				new IKAnalyzer());
		org.apache.lucene.search.Query query = parser.parse(key);
		org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
				query, clazz);
		int startIndex = (page-1) * pageSize;
		List result = hibQuery.list();
		hibQuery.setMaxResults(pageSize);
		hibQuery.setFirstResult(startIndex);
		 
		PaginationSupport ps = new PaginationSupport(hibQuery.list(),
				result.size(), pageSize, startIndex);
		return ps;
	}
	
	/**
	 * 
	 * @param fields
	 * @param key
	 * @param clazz
	 * @param page
	 * @param pageSize
	 * @param sort 排序的字段
	 * @return
	 * @throws ParseException
	 */
	public PaginationSupport findPaginationUserByParams(String[] fields, String key,
			Class clazz, int page, int pageSize,Sort sort) throws ParseException {

		key = StringUtil.filtrate(key);
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_31,fields,
				new IKAnalyzer());
		org.apache.lucene.search.Query query = parser.parse(key);
		FullTextQuery hibQuery = fullTextSession.createFullTextQuery(
				query, clazz);
		hibQuery.setSort(sort);
		int startIndex = (page-1) * pageSize;
		List result = hibQuery.list();
		hibQuery.setMaxResults(pageSize);
		hibQuery.setFirstResult(startIndex);
		 
		PaginationSupport ps = new PaginationSupport(hibQuery.list(),
				result.size(), pageSize, startIndex);
		return ps;
	}
	public PaginationSupport findPaginationUserByParams(String[] fields, String[] keys,
			Class clazz, int page, int pageSize) throws ParseException {

		
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_31,fields,
				new IKAnalyzer());
		BooleanQuery booleanQuery = new BooleanQuery();
		for(String key:keys){
			key = StringUtil.filtrate(key);
			org.apache.lucene.search.Query query = parser.parse(key);
			booleanQuery.add(query, BooleanClause.Occur.SHOULD);  
		}
		
		org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
				booleanQuery, clazz);
		int startIndex = (page-1) * pageSize;
		List result = hibQuery.list();
		hibQuery.setMaxResults(pageSize);
		hibQuery.setFirstResult(startIndex);
		 
		PaginationSupport ps = new PaginationSupport(hibQuery.list(),
				result.size(), pageSize, startIndex);
		return ps;
	}
	public void saveLog() {

	}

	@Override
	public int getStatBySql(String sql) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory()
				.getCurrentSession();
		// session.createQuery(sql).list().get(0);
		int sum = Integer.parseInt((String) session.createQuery(sql)
				.uniqueResult());
		return sum;
	}
	
	public List<?> luceneByStateAndPage(String[] fields, String state, String key, Class<?> clazz, int page, int pageSize) throws ParseException {
		key = StringUtil.filtrate(key);
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);		
		org.apache.lucene.queryParser.QueryParser parser = new QueryParser(Version.LUCENE_31,"title", new IKAnalyzer() );
		String temp = "+(";
		for(String field : fields){
			temp += field + ":" + key + " ";
		}
		temp += ")+(state:" + state +")";
		System.out.println(temp);
		org.apache.lucene.search.Query luceneQuery = parser.parse(temp);
		org.hibernate.Query fullTextQuery = fullTextSession.createFullTextQuery( luceneQuery, clazz);
		return fullTextQuery.list();
	}
	
	public List<?> luceneQueryByPage(LuceneQuery query, Class<?> clazz, int page, int pageSize) throws Exception {		
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);		
		org.apache.lucene.queryParser.QueryParser parser = new QueryParser(Version.LUCENE_31,"title", new IKAnalyzer() );		
		org.apache.lucene.search.Query luceneQuery = parser.parse(query.toString());
		org.hibernate.Query fullTextQuery = fullTextSession.createFullTextQuery( luceneQuery, clazz);
		return fullTextQuery.list();
	}
	
	public PaginationSupport getQueryFromIndexByPage(LuceneQuery query, Class<?> clazz, int page, int pageSize) throws Exception {		
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);		
		org.apache.lucene.queryParser.QueryParser parser = new QueryParser(Version.LUCENE_31,"title", new IKAnalyzer() );		
		org.apache.lucene.search.Query luceneQuery = parser.parse(query.toString());
		FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery( luceneQuery, clazz);
		int startIndex = (page-1) * pageSize;
		List result = fullTextQuery.list();
		fullTextQuery.setMaxResults(pageSize);
		fullTextQuery.setFirstResult(startIndex);
		PaginationSupport ps = new PaginationSupport(fullTextQuery.list(),
				result.size(), pageSize, startIndex);
		return ps;
	}

	/* (non-Javadoc)
	 * @see com.jadsoft.ngb.dao.BaseDAO#getQueryFromIndexByPage(com.jadsoft.ngb.dao.impl.LuceneQuery, java.lang.Class, int, int, org.apache.lucene.search.Sort)
	 */
	@Override
	public PaginationSupport getQueryFromIndexByPage(LuceneQuery query,
			Class<?> clazz, int page, int pageSize, Sort sort) throws Exception {
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);		
		org.apache.lucene.queryParser.QueryParser parser = new QueryParser(Version.LUCENE_31,"title", new IKAnalyzer() );		
		org.apache.lucene.search.Query luceneQuery = parser.parse(query.toString());
		FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery( luceneQuery, clazz);
		int startIndex = (page-1) * pageSize;
		List result = fullTextQuery.list();
		fullTextQuery.setMaxResults(pageSize);
		fullTextQuery.setFirstResult(startIndex);
		fullTextQuery.setSort(sort);
		PaginationSupport ps = new PaginationSupport(fullTextQuery.list(),
				result.size(), pageSize, startIndex);
		return ps;
	}
}