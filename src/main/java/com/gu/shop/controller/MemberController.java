package com.gu.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gu.shop.service.MemberService;
import com.gu.shop.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void getSignUp() throws Exception {

	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String postSignUp(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		try {
			if (result == 1) {
				return "/member/signUp";
			} else if (result == 0) {
				String inputPass = vo.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserPass(pwd);
				service.signUp(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/idChk")
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {

	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO vo,HttpSession session,RedirectAttributes rttr) throws Exception{
		session.getAttribute("member");
		MemberVO login =service.login(vo);		
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);			
		}else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/";
		}
		
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:/";
	}
}
