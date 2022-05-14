package com.model2.mvc.service.kakao;

import com.model2.mvc.service.domain.kakao.KakaoPayApproval;

public interface KakaoService {
	
	public String kakaoPayReady();
	
	public KakaoPayApproval kakaoPayInfo(String pg_token);
	
}