package com.site.common.log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggerAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LoggerAdvice.class);
	
	@Before("execution(* com.site..*Impl.*(..))")
	public void printLogging(JoinPoint jp) {
		logger.info("---------------------------");
		logger.info("[공통logging]");
		logger.info(jp.getSignature().getName());
	}
}
