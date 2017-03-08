package net.shopxx.service;

import net.shopxx.entity.Web;



public interface WebService extends BaseService<Web, Long>{

	Web find(String webPage, boolean useCache);

}
