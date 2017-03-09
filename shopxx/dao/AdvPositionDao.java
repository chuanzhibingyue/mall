package net.shopxx.dao;

import net.shopxx.entity.AdvPosition;



public interface AdvPositionDao extends BaseDao<AdvPosition, Long>{

	AdvPosition find(AdvPosition advPosition);

}
