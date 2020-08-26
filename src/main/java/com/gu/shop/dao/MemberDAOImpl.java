package com.gu.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gu.shop.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sql;
	
	public void signUp(MemberVO vo) throws Exception{
		sql.insert("memberMapper.signup",vo);
	}
	
	public int idChk(MemberVO vo) throws Exception{
		int result = sql.selectOne("memberMapper.idChk",vo);
		return result;
	}
	
	public MemberVO login(MemberVO vo) throws Exception{
		return sql.selectOne("memberMapper.login",vo);
	}
}
