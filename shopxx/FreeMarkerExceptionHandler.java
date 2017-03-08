/*
 * Copyright 2005-2015 jshop.com. All rights reserved.
 * File Head

 */
package net.shopxx;

import java.io.Writer;

import net.shopxx.exception.IllegalLicenseException;

import org.apache.commons.lang.exception.ExceptionUtils;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

/**
 * FreeMarker异常处理
 * 
 * @author JSHOP Team
 \* @version 3.X
 */
public class FreeMarkerExceptionHandler implements TemplateExceptionHandler {

	/** 默认模板异常处理 */
	private static final TemplateExceptionHandler DEFAULT_TEMPLATE_EXCEPTION_HANDLER = TemplateExceptionHandler.DEBUG_HANDLER;

	/**
	 * 模板异常处理
	 * 
	 * @param te
	 *            模板异常
	 * @param env
	 *            环境变量
	 * @param out
	 *            输出
	 */
	public void handleTemplateException(TemplateException te, Environment env, Writer out) throws TemplateException {
		if (ExceptionUtils.indexOfThrowable(te, IllegalLicenseException.class) >= 0) {
			throw new IllegalLicenseException();
		}
		DEFAULT_TEMPLATE_EXCEPTION_HANDLER.handleTemplateException(te, env, out);
	}

}