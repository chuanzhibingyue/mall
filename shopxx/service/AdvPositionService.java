package net.shopxx.service;

import net.shopxx.entity.AdvPosition;



public interface AdvPositionService extends BaseService<AdvPosition, Long>{

	AdvPosition find(Long apId, boolean useCache);

}
