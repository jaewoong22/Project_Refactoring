package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface PurchaseService {
	
	// 회원가입
	public void addPurchase(Purchase purchase) throws Exception;
	
	// 내정보확인 / 로그인
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// 회원정보리스트 
	public Map<String , Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	// 회원정보수정
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
}