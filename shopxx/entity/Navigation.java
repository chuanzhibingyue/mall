package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;



/**
 * Entity - 导航
 * 
 */
@Entity
@Table(name = "33hao_navigation")
public class Navigation extends OrderEntity<Long>{

	/**导航标题**/
	private String navTitle;
	
	/**导航链接**/
	private String navUrl;
	
	/**类别ID，对应着nav_type中的内容，默认为0**/
	private Integer itemId;
	
	
	
	/**
	 * 位置
	 */
	public enum Location {

		/** 顶部 */
		top,

		/** 中间 */
		middle,

		/** 底部 */
		bottom
		
	}
	/** 位置 */
	private Navigation.Location location;
	
	
	/** 是否新窗口打开 */
	private Boolean navNewOpen;
	
	/**
	 * 类别
	 */
	public enum Type{
		
		/**自定义导航**/
		Custome,
		/**商品分类**/
		GoodType,
		/**文章导航**/
		Article,
		/**活动导航**/
		Activity
		
	}
	
	private Navigation.Type type;

	
	@Length(max = 20)
	@Column(name="nav_title",nullable = false)
	public String getNavTitle() {
		return navTitle;
	}

	public void setNavTitle(String navTitle) {
		this.navTitle = navTitle;
	}

	/**
	 * 获取链接地址
	 * 
	 * @return 链接地址
	 */
	
	@Length(max = 200)
	@Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|ftp:\\/\\/|mailto:|\\/|#).*$")
	@Column(name="nav_url")
	public String getNavUrl() {
		return navUrl;
	}

	/**
	 * 设置链接地址
	 * 
	 * @param url
	 *            链接地址
	 */
	public void setNavUrl(String navUrl) {
		this.navUrl = navUrl;
	}

	@Length(max = 20)
	@Column(name="item_id",nullable = false)
	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	@Length(max = 1)
	@Column(name="nav_location",nullable = false)
	public Navigation.Location getLocation() {
		return location;
	}

	public void setLocation(Navigation.Location location) {
		this.location = location;
	}

	/**
	 * 获取是否新窗口打开
	 * 
	 * @return 是否新窗口打开
	 */
	@NotNull
	@Length(max = 1)
	@Column(name="nav_new_open",nullable = false)
	public Boolean getNavNewOpen() {
		return navNewOpen;
	}

	/**
	 * 设置是否新窗口打开
	 * 
	 * @param isBlankTarget
	 *            是否新窗口打开
	 */
	public void setNavNewOpen(Boolean navNewOpen) {
		this.navNewOpen = navNewOpen;
	}

	@NotNull
	@Length(max = 1)
	@Column(name="nav_type",nullable = false)
	public Navigation.Type getType() {
		return type;
	}

	public void setType(Navigation.Type type) {
		this.type = type;
	}
	
	
	
	
	
	
	
	
	
}
