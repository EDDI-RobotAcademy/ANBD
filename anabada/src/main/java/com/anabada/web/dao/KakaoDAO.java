package com.anabada.web.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.KakaoVO;

@Repository
public class KakaoDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sql.insert("memberMapper.kakaoinsert", userInfo);
	}
	
	public KakaoVO findkakao(HashMap<String, Object> userInfo) {
		System.out.println("nickname : " + userInfo.get("nickname"));
		System.out.println("email : " + userInfo.get("email"));
		return sql.selectOne("memberMapper.findkakao", userInfo);
	}

}
