package com.model2.mvc.service.store;

import com.model2.mvc.service.domain.Store;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface StoreDao {
	
	// INSERT
	public void addProduct(Store store) throws Exception ;

	// SELECT ONE
	public Store getProduct(int storeNo) throws Exception ;

	
}