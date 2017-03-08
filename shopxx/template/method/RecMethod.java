package net.shopxx.template.method;

import java.util.List;
import java.util.Map;

import net.shopxx.entity.RecPosition;

import net.shopxx.service.RecPositionService;
import net.shopxx.service.impl.RecPositionServiceImpl;
import net.shopxx.util.FreeMarkerUtils;
import net.shopxx.util.PHPSerializer;
import net.shopxx.util.SpringUtils;

import org.springframework.stereotype.Component;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

@Component("recMethod")
public class RecMethod implements TemplateMethodModelEx{

	@Override
	public Object exec(List arguments) throws TemplateModelException {
	
		Long id = FreeMarkerUtils.getArgument(0, Long.class, arguments);
		RecPositionService recPositionService=SpringUtils.getBean("recPositionServiceImpl", RecPositionServiceImpl.class);
		
		
		RecPosition recPosition=recPositionService.find(id);
		if(null==recPosition){
			return "";
		}
		
		String str="";
		try {
			Map<String, Object> map2 =(Map<String, Object>)PHPSerializer.unserialize(recPosition.getContent().getBytes());
			
		
			String target="";
			
			if(map2.get("title").equals("2")){
				target="target='_blank'";
			}
			
			if(recPosition.getPicType()==RecPosition.Type.text){

				
			}else{
				
			}
			
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		}
		
		return str;
	}

}
