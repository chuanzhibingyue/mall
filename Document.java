package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;



/**
 * Entity - 会员
 * 
 */
@Entity
@Table(name = "33hao_document")
public class Document extends BaseEntity<Long>{

	
	/**调用标识码 */
	private String docCode;
	
	/**标题*/
	private String docTitle;
	
	/**内容*/
	private String docContent;


	/**
	 * 获取标识码
	 * @return
	 */
	@Length(max = 255)
	@Column(name="doc_code")
	public String getDocCode() {
		return docCode;
	}

	/**
	 * 设置标识码
	 * @return
	 */
	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}

	/**
	 * 获取标题
	 * @return
	 */
	@Length(max = 255)
	@Column(name="doc_title")
	public String getDocTitle() {
		return docTitle;
	}

	/**
	 * 设置标题
	 * @return
	 */
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	/**
	 * 获取内容
	 * @return
	 */
	@Length(max = 255)
	@Column(name="doc_content")
	public String getDocContent() {
		return docContent;
	}

	/**
	 * 设置内容
	 * @return
	 */
	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}
	
	
	
	
	
	
	
}
