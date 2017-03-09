/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.template.directive;

import java.io.IOException;
import java.io.StringReader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;

import net.shopxx.entity.Ad;

import net.shopxx.entity.AdvPosition;

import net.shopxx.service.AdvPositionService;
import net.shopxx.util.FreeMarkerUtils;
import net.shopxx.util.PHPSerializer;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import freemarker.core.Environment;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 广告位
 * 
 */
@Component("advPositionDirective")
public class AdPositionDirective extends BaseDirective {

	/** 变量名称 */
	private static final String VARIABLE_NAME = "advPosition";

	@Resource(name = "freeMarkerConfigurer")
	private FreeMarkerConfigurer freeMarkerConfigurer;
	@Resource(name = "advPositionServiceImpl")
	private AdvPositionService advPositionService;

	/**
	 * 执行
	 * 
	 * @param env
	 *            环境变量
	 * @param params
	 *            参数
	 * @param loopVars
	 *            循环变量
	 * @param body
	 *            模板内容
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		
		Long apId = getId(params);
		String type=FreeMarkerUtils.getParameter("type", String.class, params);
		boolean useCache = useCache(env, params);
		AdvPosition advPosition = advPositionService.find(apId, useCache);
		
		
		if(CollectionUtils.isNotEmpty(advPosition.getAds())){
			Set<Ad> set = new HashSet<Ad>();  
			Set<Ad> ads=advPosition.getAds();
			Iterator<Ad> it = ads.iterator();  
			while (it.hasNext()) {  
			  Ad ad1 = it.next();  
			  set.add(ad1);
			}
			advPosition.setAds(set);
		}
		
		StringBuffer content=new StringBuffer();
		StringBuffer template=new StringBuffer();
		
		if (body != null) {
			setLocalVariable(VARIABLE_NAME, advPosition, env, body);
		} else {
			if (advPosition != null ) {
				try {
					Map<String, Object> model = new HashMap<String, Object>();
					model.put(VARIABLE_NAME, advPosition);
					Writer out = env.getOut();
					
					
					
					if(CollectionUtils.isEmpty(advPosition.getAds())){
						
						if(advPosition.getApClass()==AdvPosition.ApClass.text){
							content.append("<a href=''>");
							content.append(advPosition.getDefaultContent());
							content.append("</a>");
						}else{
							content.append("<a href='' title='").append(advPosition.getApName()).append("'>");
							content.append("<img style='width:").append(advPosition.getApWidth()).append("px;height:").append(advPosition.getApHeight()).append("px' border='0' src='");
							content.append("").append("/").append("adv").append("/").append(advPosition.getDefaultContent());
							content.append("' alt=''/>");
							content.append("</a>");
							
							
						}
						
					}else{
						int select=0;
						if(advPosition.getApDisplay()==AdvPosition.ApDisplay.mul){
							
						   java.util.Random random=new java.util.Random();
						   select=random.nextInt(advPosition.getAds().size());
						}
						
						
						List<Ad> list2 = new ArrayList<Ad> ();  
                        list2.addAll(advPosition.getAds()); 
                        
                        Ad ad=list2.get(select);
						
						//图片广告
						if(advPosition.getApClass()==AdvPosition.ApClass.image){
							
                                
							    
							    		
							    Map<String, Object> picContent=(Map<String, Object>) PHPSerializer.unserialize(ad.getAdvContent().getBytes());
								
							    Integer width=advPosition.getApWidth();
							    Integer height=advPosition.getApHeight();
							    String pic=(String) picContent.get("adv_pic");
							    String url=(String) picContent.get("adv_pic_url");
							    
							    content.append("<a href='http://").append(picContent.get("adv_pic_url")).append("' target='_blank' title='").append(ad.getAdvTitle()).append("'>");
								content.append("<img style='width:").append(advPosition.getApWidth()).append("px;height:").append(advPosition.getApHeight()).append("px' border='0' src='");
								content.append("").append("/").append("").append("/").append(pic);
								content.append("' alt='").append(ad.getAdvTitle()).append("'/>");
								content.append("</a>");
						}
						//文字广告
						if(advPosition.getApClass()==AdvPosition.ApClass.text){
							Map<String, Object> wordContent=(Map<String, Object>) PHPSerializer.unserialize(ad.getAdvContent().getBytes());
							
							String word=(String) wordContent.get("adv_word");
							String url=(String) wordContent.get("adv_word_url");
							content.append("<a href='http://").append(wordContent.get("adv_word_url")).append("' target='_blank'>");
							content.append(word);
							content.append("</a>");
						  
						}
						//Flash广告
                        if(advPosition.getApClass()==AdvPosition.ApClass.flash){
							
                        	Integer width=advPosition.getApWidth();
                        	Integer height=advPosition.getApHeight();
                        	
                        	
                        	Map<String, Object> flashContent =(Map<String, Object>) PHPSerializer.unserialize(ad.getAdvContent().getBytes());
                        	
                        	String flash=(String) flashContent.get("flash_swf");
                        	String url=(String) flashContent.get("flash_url");
                        	
                        	content.append("<a href='http://").append(url).append("' target='_blank'><button style='width:").append(width).append("px; height:").append(height).append("px; border:none; padding:0; background:none;' disabled><object id='FlashID' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='").append(width).append("' height='").append(height).append("'>");
                        	content.append("<param name='movie' value='");
                        	content.append("").append("/").append("").append("/").append(flash);
                        	content.append("' /><param name='quality' value='high' /><param name='wmode' value='opaque' /><param name='swfversion' value='9.0.45.0' /><!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 --><param name='expressinstall' value='");
                        	content.append("").append("/").append("").append(flash);
                        	content.append("' width='").append(width).append("' height='").append(height).append("'><!--<![endif]--><param name='quality' value='high' /><param name='wmode' value='opaque' /><param name='swfversion' value='9.0.45.0' /><param name='expressinstall' value='");
                        	content.append("").append("/js/expressInstall.swf'/><!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 --><div><h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4><p><a href='http://www.adobe.com/go/getflashplayer'><img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='获取 Adobe Flash Player' width='112' height='33' /></a></p></div><!--[if !IE]>--></object><!--<![endif]--></object></button></a>");
                        	
                        	
						}
						
						
					}
					
					if(type.equals("array") && advPosition.getApClass()==AdvPosition.ApClass.image){
						
						
					}
					if (type.equals("js")){
						template.append("document.write(\"").append(content).append("\");");
						new Template("adTemplate", new StringReader(template.toString()), freeMarkerConfigurer.getConfiguration()).process(model, out);
					}
					
					
					
					
				} catch (TemplateException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}