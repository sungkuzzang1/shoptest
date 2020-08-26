package com.gu.shop.dao;

import com.gu.shop.vo.MemberVO;

public interface MemberDAO {
	public void signUp(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
}
