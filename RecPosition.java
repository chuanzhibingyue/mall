package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;


@Entity
@Table(name = "33hao_rec_position")
public class RecPosition extends BaseEntity<Long>{

	/**标题**/
	private String title;
	
	/**序列化推荐位内容**/
	private String content;
	
	
	
	
	/**
	 * 位置
	 */
	public enum Type {

	
		/** 文字 */
		text,

		/** 本地图片 */
		local,

		/** 远程 */
		remote
		
	}
	
	private RecPosition.Type picType;

	@Length(max = 200)
	@Column(name="title",nullable = false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="content",nullable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(max = 1)
	@Column(name="pic_type",nullable = false)
	public RecPosition.Type getPicType() {
		return picType;
	}

	public void setPicType(RecPosition.Type picType) {
		this.picType = picType;
	}
	
	
	
	
	
}
