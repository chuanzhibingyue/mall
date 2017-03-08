package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "33hao_web_code")
public class WebCode extends BaseEntity<Long>{

	private String codeType;
	
	private String varName;
	
	private String codeInfo;
	
	private String showName;
	
	private Web web;

	
	@Column(name="code_type")
	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	@Column(name="var_name")
	public String getVarName() {
		return varName;
	}

	public void setVarName(String varName) {
		this.varName = varName;
	}

	@Column(name="code_info")
	public String getCodeInfo() {
		return codeInfo;
	}

	public void setCodeInfo(String codeInfo) {
		this.codeInfo = codeInfo;
	}

	@Column(name="show_name")
	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="web_id",nullable = false)
	public Web getWeb() {
		return web;
	}

	public void setWeb(Web web) {
		this.web = web;
	}
	
	
}
