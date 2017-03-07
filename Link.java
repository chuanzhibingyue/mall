package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity - 友情链接
 */
@Entity
@Table(name = "hao_link")
public class Link extends OrderEntity<Long>{

	
	private static final long serialVersionUID = -8049515561752740814L;
	
	
	/**
	 * 类型
	 */
	public enum Type {

		/** 文本 */
		text,

		/** 图片 */
		image
	}

    /**
     * 标题
     */
	private String linkTitle;
	
	/**
	 * 链接
	 */
	private String linkUrl;
	
	/**
	 * 图片
	 */
	private String linekPic;

	
	/**
	 * 获取标题
	 * @return
	 */
	@NotEmpty
	@Length(max = 100)
	@Column(name="link_title", nullable = false)
	public String getLinkTitle() {
		return linkTitle;
	}

	/**
	 * 设置标题
	 * @param linkTitle
	 */
	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}

	/**
	 * 获取链接
	 * @return
	 */
	@NotEmpty
	@Length(max = 100)
	@Column(name="link_url",nullable = false)
	public String getLinkUrl() {
		return linkUrl;
	}

	/**
	 * 设置链接
	 * @param linkUrl
	 */
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	/**
	 * 获取图片
	 * @return
	 */
	@Length(max = 100)
	@Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|ftp:\\/\\/|mailto:|\\/|#).*$")
	@Column(name="link_pic")
	public String getLinekPic() {
		return linekPic;
	}

	/**
	 * 设置图片
	 * @param linekPic
	 */
	public void setLinekPic(String linekPic) {
		this.linekPic = linekPic;
	}
	
	
	
	

}
