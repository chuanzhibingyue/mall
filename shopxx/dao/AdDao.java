/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.dao;

import java.util.List;

import net.shopxx.entity.Ad;
import net.shopxx.entity.AdvPosition;

/**
 * Dao - 广告
 * 
 */
public interface AdDao extends BaseDao<Ad, Long> {

	List<Ad> find(AdvPosition advPosition);

}