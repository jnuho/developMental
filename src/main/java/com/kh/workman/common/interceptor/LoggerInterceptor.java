package com.kh.workman.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {

  private Logger logger=LoggerFactory.getLogger(LoggerInterceptor.class);

  //전 처리용 매소드
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    // TODO Auto-generated method stub
    logger.debug("======================start======================");
    logger.debug(request.getRequestURI());
    logger.debug("-------------------------------------------------");

    return super.preHandle(request, response, handler);
  }
  
//  후 처리용 매소드
//  @Override
//  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//      ModelAndView modelAndView) throws Exception {
//    // TODO Auto-generated method stub
//    super.postHandle(request, response, handler, modelAndView);
//  }
  

}
