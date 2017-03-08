/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.dao;

import java.util.List;


import net.shopxx.entity.ArticleClass;

/**
 * Dao - 文章分类
 * 
 */
public interface ArticleClassDao extends BaseDao<ArticleClass, Long> {

	/**
	 * 查找顶级文章分类
	 * 
	 * @param count
	 *            数量
	 * @return 顶级文章分类
	 */
	List<ArticleClass> findRoots(Integer count);

	/**
	 * 查找上级文章分类
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param recursive
	 *            是否递归
	 * @param count
	 *            数量
	 * @return 上级文章分类
	 */
	List<ArticleClass> findParents(ArticleClass articleClass, boolean recursive, Integer count);

	/**
	 * 查找下级文章分类
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param recursive
	 *            是否递归
	 * @param count
	 *            数量
	 * @return 下级文章分类
	 */
	List<ArticleClass> findChildren(ArticleClass articleClass, boolean recursive, Integer count);

}