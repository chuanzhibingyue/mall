package net.shopxx.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "33hao_web")
public class Web extends BaseEntity<Long>{

	/**模块名称**/
	private String webName;
	
	/**风格名称**/
	private String stypleName;
	
	/**所在页面(暂时只有index)**/
	private String webPage;
	
	/**是否显示，0为否，1为是，默认为1**/
	private Integer webShow;
	
	
	/**模块html代码**/
	private String webHtml;
	
	
	
	private Set<WebCode>webcodes=new HashSet<WebCode>();
	
	
	@Column(name="web_name")
	public String getWebName() {
		return webName;
	}

	public void setWebName(String webName) {
		this.webName = webName;
	}
	@Column(name="style_name")
	public String getStypleName() {
		return stypleName;
	}

	
	public void setStypleName(String stypleName) {
		this.stypleName = stypleName;
	}
	@Column(name="web_page")
	public String getWebPage() {
		return webPage;
	}

	public void setWebPage(String webPage) {
		this.webPage = webPage;
	}
	@Column(name="web_show")
	public Integer getWebShow() {
		return webShow;
	}

	public void setWebShow(Integer webShow) {
		this.webShow = webShow;
	}
	@Column(name="web_html")
	public String getWebHtml() {
		return webHtml;
	}

	public void setWebHtml(String webHtml) {
		this.webHtml = webHtml;
	}

	@NotEmpty
	@OneToMany(mappedBy = "web", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	public Set<WebCode> getWebcodes() {
		return webcodes;
	}

	public void setWebcodes(Set<WebCode> webcodes) {
		this.webcodes = webcodes;
	}
	
	
	
}
