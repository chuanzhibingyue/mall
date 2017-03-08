package net.shopxx.template.directive;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;


import net.shopxx.entity.Web;
import net.shopxx.service.WebService;
import net.shopxx.util.FreeMarkerUtils;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("webhtmlDirective")
public class WebHtmlDirective extends BaseDirective{


	private static final String WEBPAGE_PARAMETER_NAME = "webpage";
	
	/** 变量名称 */
	private static final String VARIABLE_NAME = "webhtml";

	@Resource(name = "webServiceImpl")
	private WebService webService;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		
		String webPage = FreeMarkerUtils.getParameter(WEBPAGE_PARAMETER_NAME, String.class, params);
		boolean useCache = useCache(env, params);
		
		Web web=webService.find(webPage,useCache);
		setLocalVariable(VARIABLE_NAME, web, env, body);
		
	}

}
