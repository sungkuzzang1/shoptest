package com.gu.shop.service;

import com.gu.shop.vo.MemberVO;

public interface MemberService {
	public void signUp(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
}
