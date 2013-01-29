/**
 * Copyright (c) 2011 Jadsoft CO.LTD
 * Floor 4, Building 4,Eastern HiTech Park, NO 30 Wantan RD, Hang Zhou, Zhe Jiang, China.
 * All rights reserved.
 *
 * "DBUtil.java is the copyrighted,
 * proprietary property of Ray which retain all right, 
 * title and interest therein."
 * 
 * Create by yixiugg at 2012-2-11 下午3:25:07.
 * yixiugg [email:yixiugg@126.com]
 * 
 * Revision History
 *
 * Date            Programmer                   Notes
 * ---------    ---------------------  -----------------------------------
 * 2012-2-11            yixiugg                       initial
 **/

/**
 * 
 */
package com.zwrx.bmw.util;

import org.hibernate.Criteria;
import org.hibernate.engine.SessionFactoryImplementor;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.impl.CriteriaImpl;
import org.hibernate.loader.criteria.CriteriaJoinWalker;
import org.hibernate.loader.criteria.CriteriaQueryTranslator;
import org.hibernate.persister.entity.OuterJoinLoadable;

/**
 * @author Administrator
 *
 */
public class DBUtil {
	
	/**
	 * get hibernate criteria real sql
	 * @param criteria
	 * @return
	 */
	public static String getCriteriaSql(Criteria criteria) {
		CriteriaImpl criteriaImpl = (CriteriaImpl) criteria;//转型
		SessionImplementor session = criteriaImpl.getSession();//获取SESSION
		SessionFactoryImplementor factory = session.getFactory();//获取FACTORY
		CriteriaQueryTranslator translator = new CriteriaQueryTranslator(factory, criteriaImpl, criteriaImpl
			.getEntityOrClassName(), CriteriaQueryTranslator.ROOT_SQL_ALIAS);
		String[] implementors = factory.getImplementors(criteriaImpl.getEntityOrClassName());
		CriteriaJoinWalker walker = new CriteriaJoinWalker((OuterJoinLoadable) factory
			.getEntityPersister(implementors[0]), translator, factory, criteriaImpl, criteriaImpl
			.getEntityOrClassName(), session.getLoadQueryInfluencers());
		return walker.getSQLString();
	}
}
