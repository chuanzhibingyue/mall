package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;


/**
 * Entity - 广告
 * 
 */
@Entity
@Table(name = "xx_ad")
public class Ad extends OrderEntity<Long>{

	/** 广告位 */
	private AdvPosition advPosition;
	
	/** 广告内容描述 */
	private String advTitle;
	
	/** 广告内容 */
	private String advContent;
	
	/**购买所支付的金币**/
	private Integer goldPay;
	
	/**购买方式**/
	private String buyStyle;
	
	/**广告点击率**/
	private Integer clickNum;
	
	/**广告开始时间**/
	private Integer advStartDate;
	
	/**广告结束时间**/
	private Integer advEndDate;
	
	/**会员购买的广告是否通过审核**/
	private Integer isAllow;
	
	/**幻灯片排序**/
	private Integer slideSort;
	
	
	
	

	public Integer getSlideSort() {
		return slideSort;
	}

	public void setSlideSort(Integer slideSort) {
		this.slideSort = slideSort;
	}

	public Integer getIsAllow() {
		return isAllow;
	}

	public void setIsAllow(Integer isAllow) {
		this.isAllow = isAllow;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ap_id",nullable = false)
	public AdvPosition getAdvPosition() {
		return advPosition;
	}

	public void setAdPosition(AdvPosition advPosition) {
		this.advPosition = advPosition;
	}

	@Length(max = 255)
	@Column(name="adv_title",nullable = false)
	public String getAdvTitle() {
		return advTitle;
	}

	public void setAdvTitle(String advTitle) {
		this.advTitle = advTitle;
	}

	@Length(max = 1000)
	@Column(name="adv_content",nullable = false)
	public String getAdvContent() {
		return advContent;
	}

	public void setAdvContent(String advContent) {
		this.advContent = advContent;
	}
	@Length(max = 10)
	@Column(name="goldpay",nullable = false)
	public Integer getGoldPay() {
		return goldPay;
	}

	public void setGoldPay(Integer goldPay) {
		this.goldPay = goldPay;
	}
	@Length(max = 10)
	@Column(name="buy_style",nullable = false)
	public String getBuyStyle() {
		return buyStyle;
	}

	public void setBuyStyle(String buyStyle) {
		this.buyStyle = buyStyle;
	}

	@Length(max = 10)
	@Column(name="click_num",nullable = false)
	public Integer getClickNum() {
		return clickNum;
	}

	public void setClickNum(Integer clickNum) {
		this.clickNum = clickNum;
	}

	@Length(max = 10)
	@Column(name="adv_start_date",nullable = false)
	public Integer getAdvStartDate() {
		return advStartDate;
	}

	public void setAdvStartDate(Integer advStartDate) {
		this.advStartDate = advStartDate;
	}
	@Length(max = 10)
	@Column(name="adv_end_date",nullable = false)
	public Integer getAdvEndDate() {
		return advEndDate;
	}

	public void setAdvEndDate(Integer advEndDate) {
		this.advEndDate = advEndDate;
	}
	
	
	
	
	
	
	
	
	
	
}
