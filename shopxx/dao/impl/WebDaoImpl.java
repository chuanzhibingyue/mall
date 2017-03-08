package net.shopxx.dao.impl;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import net.shopxx.dao.WebDao;
import net.shopxx.entity.Web;


@Repository("webDaoImpl")
public class WebDaoImpl extends BaseDaoImpl<Web, Long> implements WebDao{

	@Override
	public Web find(String webPage) {
		
		if (webPage == null) {
			return null;
		}
		try {
			String jpql = "select web from Web web where web.webPage = :webPage";
			return entityManager.createQuery(jpql, Web.class).setParameter("webPage", webPage).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
