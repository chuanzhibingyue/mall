/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx.service.impl;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;

import net.shopxx.Setting;
import net.shopxx.service.CaptchaService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.octo.captcha.service.CaptchaServiceException;

/**
 * Service - 验证码
 * 
 * @author JSHOP Team
 \* @version 3.X
 */
@Service("captchaServiceImpl")
public class CaptchaServiceImpl implements CaptchaService {

	@Resource(name = "imageCaptchaService")
	private com.octo.captcha.service.CaptchaService imageCaptchaService;
	//private CustomGenericManageableCaptchaService imageCaptchaService;

	public BufferedImage buildImage(String captchaId) {
		Assert.hasText(captchaId);

		return (BufferedImage) imageCaptchaService.getChallengeForID(captchaId);
	}

	public boolean isValid(Setting.CaptchaType captchaType, String captchaId, String captcha) {
		Assert.notNull(captchaType);

		Setting setting = SystemUtils.getSetting();
		if (!ArrayUtils.contains(setting.getCaptchaTypes(), captchaType)) {
			return true;
		}
		if (StringUtils.isEmpty(captchaId) || StringUtils.isEmpty(captcha)) {
			return false;
		}
		try {
			return imageCaptchaService.validateResponseForID(captchaId, captcha.toUpperCase());
		} catch (CaptchaServiceException e) {
			return false;
		}
	}

}