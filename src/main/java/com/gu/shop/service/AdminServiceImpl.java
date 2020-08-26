package com.gu.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gu.shop.dao.AdminDAO;
import com.gu.shop.vo.CategoryVO;
import com.gu.shop.vo.GoodsVO;
import com.gu.shop.vo.GoodsViewVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO dao;
	
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	public void register(GoodsVO vo) throws Exception{
		dao.register(vo);
	}
	
	public List<GoodsViewVO> goodsList() throws Exception{
		return dao.goodsList();
	}
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	} 
	
	public void goodsModify(GoodsVO vo) throws Exception{
		dao.goodsModify(vo);
	}
	
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
}
