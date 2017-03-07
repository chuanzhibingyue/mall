package net.shopxx.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;


/**
 * Entity - 广告位
 * 
 */
@Entity
@Table(name = "33hao_adv_position")
public class AdvPosition extends BaseEntity<Long>{

	/**广告位置名**/
	private String apName;
	
	/**广告位简介**/
	private String apIntro;
	
	/**广告位宽度**/
	private Integer apWidth;
	
	/**广告位高度**/
	private Integer apHeight;
	
	/**广告位单价**/
	private Integer apPrice;
	
	
	/**拥有的广告数**/
	private Integer advNum;
	
	
	/**广告位点击率**/
	private Integer clickNum;
	
	
	/**广告位默认内容**/
	private String defaultContent;
	
	/**
	 *广告类别
	 */
	public enum ApClass {

		
		/** 图片 */
		image,

		/** 文字 */
		text,

		/** 幻灯 */
		huandeng,
		
		/**Flash */
		flash
		
	}
	/**广告类别**/
	private ApClass apClass;
	
	public enum ApDisplay{

		
		/** 幻灯片 */
		huandeng,

		/** 多广告展示 */
		mul,

		/** 单广告展示 */
		single
	}
	/**广告展示方式**/
	private ApDisplay apDisplay;
	
	/**广告位是否启用**/
	private boolean isUse;


	
	
	/** 广告 */
	private Set<Ad1> ads = new HashSet<Ad1>();
	
	
	

	@OneToMany(mappedBy = "adPosition", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@OrderBy("order asc")
	public Set<Ad1> getAds() {
		return ads;
	}


	public void setAds(Set<Ad1> ads) {
		this.ads = ads;
	}

	@Length(max = 100)
	@Column(name="ap_name",nullable = false)
	public String getApName() {
		return apName;
	}


	public void setApName(String apName) {
		this.apName = apName;
	}

	@Length(max = 255)
	@Column(name="ap_intro",nullable = false)
	public String getApIntro() {
		return apIntro;
	}


	public void setApIntro(String apIntro) {
		this.apIntro = apIntro;
	}

	@Length(max = 10)
	@Column(name="ap_width",nullable = false)
	public Integer getApWidth() {
		return apWidth;
	}


	public void setApWidth(Integer apWidth) {
		this.apWidth = apWidth;
	}

	@Length(max = 10)
	@Column(name="ap_height",nullable = false)
	public Integer getApHeight() {
		return apHeight;
	}


	public void setApHeight(Integer apHeight) {
		this.apHeight = apHeight;
	}

	@Length(max = 10)
	@Column(name="ap_price",nullable = false)
	public Integer getApPrice() {
		return apPrice;
	}


	public void setApPrice(Integer apPrice) {
		this.apPrice = apPrice;
	}

	@Length(max = 10)
	@Column(name="adv_num",nullable = false)
	public Integer getAdvNum() {
		return advNum;
	}


	public void setAdvNum(Integer advNum) {
		this.advNum = advNum;
	}

	@Length(max = 10)
	@Column(name="click_num",nullable = false)
	public Integer getClickNum() {
		return clickNum;
	}


	public void setClickNum(Integer clickNum) {
		this.clickNum = clickNum;
	}

	@Length(max = 100)
	@Column(name="default_content",nullable = false)
	public String getDefaultContent() {
		return defaultContent;
	}


	public void setDefaultContent(String defaultContent) {
		this.defaultContent = defaultContent;
	}


	public ApClass getApClass() {
		return apClass;
	}


	public void setApClass(ApClass apClass) {
		this.apClass = apClass;
	}

	@Length(max = 1)
	@Column(name="ap_display",nullable = false)
	public ApDisplay getApDisplay() {
		return apDisplay;
	}


	public void setApDisplay(ApDisplay apDisplay) {
		this.apDisplay = apDisplay;
	}

	@Length(max = 1)
	@Column(name="is_use",nullable = false)
	public boolean isUse() {
		return isUse;
	}


	public void setUse(boolean isUse) {
		this.isUse = isUse;
	}
	
	
	
	
}
