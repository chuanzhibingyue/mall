/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.dao.impl;


import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import net.shopxx.dao.ArticleClassDao;
import net.shopxx.entity.ArticleClass;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.builder.CompareToBuilder;


import org.springframework.stereotype.Repository;

/**
 * Dao - 文章分类
 * 
 */
@Repository("articleClassDaoImpl")
public class ArticleClassDaoImpl extends BaseDaoImpl<ArticleClass, Long> implements ArticleClassDao {

	public List<ArticleClass> findRoots(Integer count) {
		String jpql = "select articleClass from ArticleClass articleClass where articleClass.parent is null order by articleClass.order asc";
		TypedQuery<ArticleClass> query = entityManager.createQuery(jpql, ArticleClass.class);
		if (count != null) {
			query.setMaxResults(count);
		}
		return query.getResultList();
	}

	public List<ArticleClass> findParents(ArticleClass articleClass, boolean recursive, Integer count) {
		if (articleClass == null || articleClass.getParent() == null) {
			return Collections.emptyList();
		}
		TypedQuery<ArticleClass> query = null;
		if (recursive) {
			
		} else {
			String jpql = "select articleClass from ArticleClass articleClass where articleClass = :articleClass";
			query = entityManager.createQuery(jpql, ArticleClass.class).setParameter("articleClass", articleClass.getParent());
		}
		if (count != null) {
			query.setMaxResults(count);
		}
		return query.getResultList();
	}

	public List<ArticleClass> findChildren(ArticleClass articleClass, boolean recursive, Integer count) {
		TypedQuery<ArticleClass> query;
		if (recursive) {
			
		} else {
			String jpql = "select articleClass from ArticleClass articleClass where articleClass.parent = :parent order by articleClass.order asc";
			query = entityManager.createQuery(jpql, ArticleClass.class).setParameter("parent", articleClass);
			if (count != null) {
				query.setMaxResults(count);
			}
			return query.getResultList();
		}
		
		return null;
	}

	/**
	 * 排序文章分类
	 * 
	 * @param articleCategories
	 *            文章分类
	 */
	private void sort(List<ArticleClass> articleClasses) {
		if (CollectionUtils.isEmpty(articleClasses)) {
			return;
		}
		final Map<Long, Integer> orderMap = new HashMap<Long, Integer>();
		for (ArticleClass articleClass : articleClasses) {
			orderMap.put(articleClass.getId(), articleClass.getOrder());
		}
		Collections.sort(articleClasses, new Comparator<ArticleClass>() {
			@Override
			public int compare(ArticleClass articleCategory1,ArticleClass articleCategory2) {
			
				CompareToBuilder compareToBuilder = new CompareToBuilder();
				
				return compareToBuilder.toComparison();
			}
		});
	}

}