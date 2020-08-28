package com.gu.shop.service;

import java.util.List;

import com.gu.shop.vo.CartListVO;
import com.gu.shop.vo.CartVO;
import com.gu.shop.vo.GoodsViewVO;
import com.gu.shop.vo.ReplyListVO;
import com.gu.shop.vo.ReplyVO;

public interface ShopService {
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void registReply(ReplyVO reply) throws Exception;
	
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	public void addCart(CartVO cart) throws Exception;
	
	public List<CartListVO> cartList(String userId) throws Exception;
}
