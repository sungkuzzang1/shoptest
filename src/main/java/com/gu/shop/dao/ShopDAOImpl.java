package com.gu.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gu.shop.vo.CartListVO;
import com.gu.shop.vo.CartVO;
import com.gu.shop.vo.GoodsViewVO;
import com.gu.shop.vo.ReplyListVO;
import com.gu.shop.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSession sql;
	
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception{
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList("shopMapper.list1",map);
	}
	
	public List<GoodsViewVO> list(int cateCode) throws Exception{
		return sql.selectList("shopMapper.list2",cateCode);
	}
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne("adminMapper.goodsView",gdsNum);
	}
	
	public void registReply(ReplyVO reply) throws Exception{
		sql.insert("shopMapper.registReply",reply);
	}
	
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList("shopMapper.replyList",gdsNum);
	}
	
	public void addCart(CartVO cart) throws Exception{
		sql.insert("shopMapper.addCart",cart);
	}
	
	public List<CartListVO> cartList(String userId) throws Exception{
		return sql.selectList("shopMapper.cartList",userId);
	}
}
