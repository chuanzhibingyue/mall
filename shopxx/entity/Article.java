/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.search.annotations.Indexed;
import org.hibernate.validator.constraints.Length;



/**
 * Entity - 文章
 * 
 */
@Indexed
@Entity
@Table(name = "33hao_article")
public class Article extends BaseEntity<Long> {

	
	/**
	 * 静态生成方式
	 */
	public enum GenerateMethod {

		/** 无 */
		none,

		/** 即时 */
		eager,

		/** 延时 */
		lazy
	}
	/** 文章分类 */
	private ArticleClass ArticleClass;
	
	
	/** 静态生成方式 */
	private Article.GenerateMethod generateMethod;
	
	
	
	/** 文章标题 */
	private String articleTitle;
	
	/** 文章内容 */
	private String articleContent;
	
	/** 跳转链接 */
	private String articleUrl;
	
	/** 是否显示，0为否，1为是，默认为1 */
	private Boolean articleShow;

	
	/**
	 * 获取静态生成方式
	 * 
	 * @return 静态生成方式
	 */
	@Column(nullable = false)
	public Article.GenerateMethod getGenerateMethod() {
		return generateMethod;
	}

	/**
	 * 设置静态生成方式
	 * 
	 * @param generateMethod
	 *            静态生成方式
	 */
	public void setGenerateMethod(Article.GenerateMethod generateMethod) {
		this.generateMethod = generateMethod;
	}
	
	/**
	 * 获取文章分类
	 * 
	 * @return 文章分类
	 */
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ac_id",nullable = false)
	public ArticleClass getArticleClass() {
		return ArticleClass;
	}

	/**
	 * 设置文章分类
	 * 
	 * @param articleCategory
	 *            文章分类
	 */
	public void setArticleClass(ArticleClass articleClass) {
		ArticleClass = articleClass;
	}

	/**
	 * 获取文章标题
	 * 
	 * @return 文章标题
	 */
	@Length(max = 100)
	@Column(name="article_title")
	public String getArticleTitle() {
		return articleTitle;
	}

	/**
	 * 设置文章标题
	 * 
	 * @return 文章标题
	 */
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	/**
	 * 获取文章内容
	 * 
	 * @return 文章内容
	 */
	@Length(max = 100)
	@Column(name="article_content")
	public String getArticleContent() {
		return articleContent;
	}

	
	/**
	 * 设置文章内容
	 * 
	 * @return 文章内容
	 */
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	/**
	 * 获取链接URL
	 * 
	 * @return 链接URL
	 */
	@Length(max = 100)
	@Column(name="article_url")
	public String getArticleUrl() {
		return articleUrl;
	}

	
	/**
	 * 设置链接URL
	 * 
	 * @return 链接URL
	 */
	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}

	/**
	 * 获取是否显示
	 * 
	 * @return 是否显示
	 */
	@Length(max = 1)
	@Column(name="article_show")
	public Boolean getArticleShow() {
		return articleShow;
	}

	/**
	 * 设置是否显示
	 * 
	 * @return 是否显示
	 */
	public void setArticleShow(Boolean articleShow) {
		this.articleShow = articleShow;
	}
	
	
	
	
	
}
