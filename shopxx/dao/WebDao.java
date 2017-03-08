package net.shopxx.dao;

import net.shopxx.entity.Web;



public interface WebDao extends BaseDao<Web, Long>{

	Web find(String webPage);

}
