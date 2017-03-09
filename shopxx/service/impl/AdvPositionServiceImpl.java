package net.shopxx.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import net.shopxx.dao.AdDao;
import net.shopxx.dao.AdvPositionDao;
import net.shopxx.entity.Ad;
import net.shopxx.entity.AdvPosition;
import net.shopxx.service.AdvPositionService;



@Service("advPositionServiceImpl")
public class AdvPositionServiceImpl  extends BaseServiceImpl<AdvPosition, Long> implements AdvPositionService{

	@Resource(name = "advPositionDaoImpl")
	private AdvPositionDao advPositionDao;
	

	@Resource(name = "adDaoImpl")
	private AdDao adDao;
	
	@Override
	@Transactional(readOnly = true)
	@Cacheable(value = "adv", condition = "#useCache")
	public AdvPosition find(Long apId, boolean useCache) {
		
		AdvPosition advPosition=advPositionDao.find(apId);
		List<Ad>ads=adDao.find(advPosition);
		Set<Ad> set=new HashSet();
		set.addAll(ads);
		advPosition.setAds(set);
		return advPosition;
	}

}
