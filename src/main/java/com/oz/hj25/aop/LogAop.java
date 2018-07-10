package com.oz.hj25.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {

	public void before(JoinPoint joinpoint) {
		Logger logger = LoggerFactory.getLogger(joinpoint.getTarget()+"");
		logger.info("\n---------loger start----------");
		Object args[]=joinpoint.getArgs();
		if(args != null) {
			logger.info("Method : \t"+joinpoint.getSignature().getName());
		}
	
	}
	public void after(JoinPoint joinpoint) {
		Logger logger = LoggerFactory.getLogger(joinpoint.getTarget()+"");
		logger.info("\n---------loger end----------");
	}
	public void afterTrowing (JoinPoint joinpoint) {
		Logger logger=LoggerFactory.getLogger(joinpoint.getTarget().toString());
		logger.info("error : \t"+joinpoint.getArgs());
		logger.info("error : \t"+joinpoint.toString());
	}
}
