package com.gu.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gu.shop.vo.CategoryVO;
import com.gu.shop.vo.GoodsVO;
import com.gu.shop.vo.GoodsViewVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sql;
	
	public List<CategoryVO> category() throws Exception{
		return sql.selectList("adminMapper.category");
	}
	
	public void register(GoodsVO vo) throws Exception{
		sql.insert("adminMapper.register",vo);
	}
	
	public List<GoodsViewVO> goodsList() throws Exception{
		return sql.selectList("adminMapper.goodslist");
	}
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne("adminMapper.goodsView",gdsNum);
	}
	
	public void goodsModify(GoodsVO vo) throws Exception{
		sql.update("adminMapper.goodsModify",vo);
	}
	
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete("adminMapper.goodsDelete",gdsNum);
	}
}
