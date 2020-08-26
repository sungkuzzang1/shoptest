package com.gu.shop.service;

import java.util.List;

import com.gu.shop.vo.CategoryVO;
import com.gu.shop.vo.GoodsVO;
import com.gu.shop.vo.GoodsViewVO;

public interface AdminService {
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsViewVO> goodsList() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
}
