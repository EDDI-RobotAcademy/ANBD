package com.anabada.web.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.KakaoVO;
import com.anabada.web.vo.MemberVO;

@Repository
public class KakaoDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//카카오 로그인값 조회
	public MemberVO findkakao(HashMap<String, Object> userInfo) throws Exception {
		System.out.println("name : " + userInfo.get("name")); //어차피 nick 컬럼에 저장 되는 값은 랜덤 문자열이기 때문에 service단에서 name컬럼에 저장된 nickname을 불러와서 확인
		System.out.println("email : " + userInfo.get("email"));
		System.out.println("id : " + userInfo.get("id"));
		return sql.selectOne("kakaoMapper.findkakao", userInfo);
	}

	//카카오 아이디 정보 db 추가
	public void kakaoinsert(HashMap<String, Object> userInfo) throws Exception {
		sql.insert("kakaoMapper.kakaoinsert", userInfo);
	}
	

}
