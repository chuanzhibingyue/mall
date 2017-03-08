package net.shopxx.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "33hao_article_class")
public class ArticleClass extends OrderEntity<Long>{

	



	/** 分类标识码 */
	private String acCode;
	
	
	/** 分类名称 */
	private String acName;
	

	/** 上级分类 */
	private ArticleClass parent;

	/** 下级分类 */
	private Set<ArticleClass> children = new HashSet<ArticleClass>();
	
	
	/** 文章 */
	private Set<Article> articles = new HashSet<Article>();

	
	
	/**
	 * 获取分类标识码
	 * 
	 * @return 获取分类标识码
	 */
	@Length(max = 20)
	@Column(name="ac_code",nullable = false)
	public String getAcCode() {
		return acCode;
	}

	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}

	
	/**
	 * 获取分类名称
	 * 
	 * @return 获取分类名称
	 */
	@NotEmpty
	@Length(max = 100)
	@Column(name="ac_name",nullable = false)
	public String getAcName() {
		return acName;
	}

	
	/**
	 * 设置分类名称
	 * 
	 * @return 设置分类名称
	 */
	public void setAcName(String acName) {
		this.acName = acName;
	}

	/**
	 * 获取上级分类
	 * 
	 * @return 上级分类
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ac_parent_id" ,nullable = false)
	public ArticleClass getParent() {
		return parent;
	}

	/**
	 * 设置上级分类
	 * 
	 * @param parent
	 *            上级分类
	 */
	public void setParent(ArticleClass parent) {
		this.parent = parent;
	}

	/**
	 * 获取下级分类
	 * 
	 * @return 下级分类
	 */
	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY)
	@OrderBy("order asc")
	public Set<ArticleClass> getChildren() {
		return children;
	}

	/**
	 * 设置下级分类
	 * 
	 * @param children
	 *            下级分类
	 */
	public void setChildren(Set<ArticleClass> children) {
		this.children = children;
	}
	
	
	/**
	 * 获取所有上级分类
	 * 
	 * @return 所有上级分类
	 */
	@Transient
	public List<ArticleClass> getParents() {
		List<ArticleClass> parents = new ArrayList<ArticleClass>();
		recursiveParents(parents, this);
		return parents;
	}

	/**
	 * 递归上级分类
	 * 
	 * @param parents
	 *            上级分类
	 * @param articleCategory
	 *            文章分类
	 */
	private void recursiveParents(List<ArticleClass> parents, ArticleClass articleClass) {
		if (articleClass == null) {
			return;
		}
		ArticleClass parent = articleClass.getParent();
		if (parent != null) {
			parents.add(0, parent);
			recursiveParents(parents, parent);
		}
	}
	
	@OneToMany(mappedBy = "articleClass", fetch = FetchType.LAZY)
	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}
	
	
    
	
	
	
	
	
	
	
	
	
	
	



}
