package com.gu.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gu.shop.service.ShopService;
import com.gu.shop.vo.CartListVO;
import com.gu.shop.vo.CartVO;
import com.gu.shop.vo.GoodsViewVO;
import com.gu.shop.vo.MemberVO;
import com.gu.shop.vo.ReplyListVO;
import com.gu.shop.vo.ReplyVO;

@Controller
@RequestMapping("/shop/")
public class ShopController {

	@Autowired
	ShopService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model, @RequestParam("cateCode") int cateCode, @RequestParam("level") int level)
			throws Exception {
		List<GoodsViewVO> list = service.list(cateCode, level);
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(Model model, GoodsViewVO vo) throws Exception {
		model.addAttribute("view", service.goodsView(vo.getGdsNum()));

		List<ReplyListVO> reply = service.replyList(vo.getGdsNum());
		model.addAttribute("reply", reply);
	}

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());

		service.registReply(reply);

		return "redirect:/shop/view?gdsNum=" + reply.getGdsNum();
	}

	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			result = 1;
		}

		return result;
	}

	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {		

		MemberVO member = (MemberVO) session.getAttribute("member");		

		List<CartListVO> cartList = service.cartList(member.getUserId());

		model.addAttribute("cartList", cartList);

	}

}
