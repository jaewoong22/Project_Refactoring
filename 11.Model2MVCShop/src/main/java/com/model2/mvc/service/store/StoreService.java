package com.model2.mvc.service.store;

import com.model2.mvc.service.domain.Store;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface StoreService {
	
	
	public void addProduct(Store store) throws Exception;
	
	
	public Store getProduct(int storeNo) throws Exception;


	
	
}