/**
 * 
 */
package com.ys.ocean.commonInterCeptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author kys
 *
 */
public class CommonInterCeptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("·Î±× ÂïÇô¶ó");
		if (session.getAttribute("member") == null) {
			response.sendRedirect("/?authority=no");
			return false;
		} else
			return true;
	}
}
