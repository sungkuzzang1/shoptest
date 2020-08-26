package com.gu.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gu.shop.vo.MemberVO;

public class AdminIntercepter extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		HttpSession session = req.getSession();
		MemberVO member =(MemberVO)session.getAttribute("member");
		
		if(member == null) {
			res.sendRedirect("/member/login");
			return false;
		}
		
		if(member.getVerify() != 1) {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}
