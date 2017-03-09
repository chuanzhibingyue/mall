/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.dao.impl;


import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import net.shopxx.dao.AdDao;
import net.shopxx.entity.Ad;
import net.shopxx.entity.AdvPosition;


import org.springframework.stereotype.Repository;

/**
 * Dao - 广告
 * 
 */
@Repository("adDaoImpl")
public class AdDaoImpl extends BaseDaoImpl<Ad, Long> implements AdDao {

	@Override
	public List<Ad> find(AdvPosition advPosition) {
		
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Ad> criteriaQuery = criteriaBuilder.createQuery(Ad.class);
		Root<Ad> root = criteriaQuery.from(Ad.class);
		criteriaQuery.select(root);
		
		Predicate restrictions = criteriaBuilder.conjunction();
		if (advPosition != null) {
			Subquery<AdvPosition> subquery = criteriaQuery.subquery(AdvPosition.class);
			Root<AdvPosition> subqueryRoot = subquery.from(AdvPosition.class);
			subquery.select(subqueryRoot);
			
			subquery.where(criteriaBuilder.equal(subqueryRoot, advPosition));
			
			
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.in(root.get("advPosition")).value(subquery));
		}
		restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("advEndDate"), new Date()));
		
		
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get("slideSort")));
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get("advPosition")));
		
		criteriaQuery.where(restrictions);
		
		return super.findList(criteriaQuery, null, null, null, null);
	}

}