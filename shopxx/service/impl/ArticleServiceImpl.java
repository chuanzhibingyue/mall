/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;

import net.shopxx.dao.ArticleClassDao;
import net.shopxx.dao.ArticleDao;

import net.shopxx.entity.Article;
import net.shopxx.entity.ArticleClass;

import net.shopxx.service.ArticleService;


import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

/**
 * Service - 文章
 * 
 * @author JSHOP Team
 \* @version 3.X
 */
@Service("articleServiceImpl")
public class ArticleServiceImpl extends BaseServiceImpl<Article, Long> implements ArticleService {

	@Resource(name = "ehCacheManager")
	private CacheManager cacheManager;
	@Resource(name = "articleDaoImpl")
	private ArticleDao articleDao;
	@Resource(name = "articleClassDaoImpl")
	private ArticleClassDao articleClassDao;


	@Transactional(readOnly = true)
	public List<Article> findList(ArticleClass articleClass,  Boolean isPublication, Integer count, List<Filter> filters, List<Order> orders) {
		return articleDao.findList(articleClass, isPublication, count, filters, orders);
	}

	@Transactional(readOnly = true)
	@Cacheable(value = "article", condition = "#useCache")
	public List<Article> findList(Long articleCategoryId,  Boolean isPublication, Integer count, List<Filter> filters, List<Order> orders, boolean useCache) {
		ArticleClass articleClass = articleClassDao.find(articleCategoryId);
		if (articleCategoryId != null && articleClass == null) {
			return Collections.emptyList();
		}
		
		return articleDao.findList(articleClass,  isPublication, count, filters, orders);
	}

	@Transactional(readOnly = true)
	public List<Article> findList(ArticleClass articleClass, Boolean isPublication, Article.GenerateMethod generateMethod, Date beginDate, Date endDate, Integer first, Integer count) {
		return articleDao.findList(articleClass, isPublication, generateMethod, beginDate, endDate, first, count);
	}

	@Transactional(readOnly = true)
	public Page<Article> findPage(ArticleClass articleClass,Boolean isPublication, Pageable pageable) {
		return articleDao.findPage(articleClass,  isPublication, pageable);
	}

	

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public Article save(Article article) {
		Assert.notNull(article);

		article.setGenerateMethod(Article.GenerateMethod.eager);
		return super.save(article);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public Article update(Article article) {
		Assert.notNull(article);

		article.setGenerateMethod(Article.GenerateMethod.eager);
		return super.update(article);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public Article update(Article article, String... ignoreProperties) {
		return super.update(article, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "article", "articleCategory" }, allEntries = true)
	public void delete(Article article) {
		
		super.delete(article);
	}

}