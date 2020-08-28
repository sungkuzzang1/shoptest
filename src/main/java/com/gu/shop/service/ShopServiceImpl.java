package com.gu.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gu.shop.dao.ShopDAO;
import com.gu.shop.vo.CartListVO;
import com.gu.shop.vo.CartVO;
import com.gu.shop.vo.GoodsViewVO;
import com.gu.shop.vo.ReplyListVO;
import com.gu.shop.vo.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAO dao;
	
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception{
		
		int cateCodeRef = 0;
		
		if(level == 1) {
			cateCodeRef = cateCode;
			return dao.list(cateCode,cateCodeRef);
		}else {
			return dao.list(cateCode);
		}
				
	}
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	public void registReply(ReplyVO reply) throws Exception{
		dao.registReply(reply);
	}
	
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	public void addCart(CartVO cart) throws Exception{
		dao.addCart(cart);
	}
	
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}

}
