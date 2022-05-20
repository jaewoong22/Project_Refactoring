package com.model2.mvc.service.store;

import com.model2.mvc.service.domain.Store;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface StoreDao {
	
	// INSERT
	public void addProduct(Store store) throws Exception ;

	// SELECT ONE
	public Store getProduct(int storeNo) throws Exception ;

	
}