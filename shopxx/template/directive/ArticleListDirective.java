/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.template.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.Filter;
import net.shopxx.Order;

import net.shopxx.entity.Article;
import net.shopxx.service.ArticleService;
import net.shopxx.util.FreeMarkerUtils;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 文章列表
 * 
 * @author JSHOP Team
 \* @version 3.X
 */
@Component("articleListDirective")
public class ArticleListDirective extends BaseDirective {

	/** "文章分类ID"参数名称 */
	private static final String ARTICLE_CODE_PARAMETER_NAME = "articleCode";



	/** 变量名称 */
	private static final String VARIABLE_NAME = "articles";
	
	private static final String VARIABLE_NAME_CLASS_NAME = "articleClassName";

	@Resource(name = "articleServiceImpl")
	private ArticleService articleService;

	/**
	 * 执行
	 * 
	 * @param env
	 *            环境变量
	 * @param params
	 *            参数
	 * @param loopVars
	 *            循环变量
	 * @param body
	 *            模板内容
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Long articleCode = FreeMarkerUtils.getParameter(ARTICLE_CODE_PARAMETER_NAME, Long.class, params);
		Integer count = getCount(params);
		List<Filter> filters = getFilters(params, Article.class);
		List<Order> orders = getOrders(params);
		boolean useCache = useCache(env, params);
		List<Article> articles = articleService.findList(articleCode, true, count, filters, orders, useCache);
		setLocalVariable(VARIABLE_NAME, articles, env, body);
		
		String articleName="";
		if(CollectionUtils.isNotEmpty(articles)){
			articleName=articles.get(0).getArticleClass().getAcName();
		}
		setLocalVariable(VARIABLE_NAME_CLASS_NAME, articleName, env, body);
	}

}