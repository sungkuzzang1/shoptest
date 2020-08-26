package com.gu.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gu.shop.dao.MemberDAO;
import com.gu.shop.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	
	public void signUp(MemberVO vo) throws Exception{
		dao.signUp(vo);
	}
	
	public int idChk(MemberVO vo) throws Exception{
		int result =dao.idChk(vo);
		return result;
	}
	
	public MemberVO login(MemberVO vo) throws Exception{
		return dao.login(vo);
	}
}
