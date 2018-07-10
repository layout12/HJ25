package com.oz.hj25.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oz.hj25.filter.LogFilter;

public class LogFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(LogFilter.class);
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request =(HttpServletRequest) req;
		String RemoteAddr =StringUtils.defaultString(request.getRemoteAddr());
		String uri =StringUtils.defaultString(request.getRequestURI());
		String url=StringUtils.defaultString(request.getRequestURL().toString());
		String queryString =StringUtils.defaultString(request.getQueryString());
		String referer =StringUtils.defaultString(request.getHeader("referer"));
		String agent= StringUtils.defaultString(request.getHeader("User-Agent"));
		//System.out.println("***RemoteAddr :" + RemoteAddr);
		//System.out.println("***Uri :" + uri);
		System.out.println("***Url :" + url);
		System.out.println("***queryString :" + queryString);
		System.out.println("***referer :" + referer);
		//System.out.println("***agent :" + agent);
		StringBuffer result= new StringBuffer();
		result.append(":").append(RemoteAddr).append(url).append(queryString).append(":").append(referer).append(agent);
		logger.info("[LogFilter]"+result.toString());
		chain.doFilter(request, res);

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}
}
