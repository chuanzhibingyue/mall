package net.shopxx.service.impl;



import javax.annotation.Resource;


import net.shopxx.dao.WebDao;
import net.shopxx.entity.Web;
import net.shopxx.service.WebService;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("webServiceImpl")
public class WebServiceImpl extends BaseServiceImpl<Web, Long> implements WebService{

	
	@Resource(name = "webDaoImpl")
	private WebDao webDao;
	
	@Override
	@Transactional(readOnly = true)
	@Cacheable(value = "web", condition = "#useCache")
	public Web find(String webPage, boolean useCache) {
		
		return webDao.find(webPage);
	}

	
}
