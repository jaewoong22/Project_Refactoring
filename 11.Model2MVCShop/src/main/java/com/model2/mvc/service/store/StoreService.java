package com.model2.mvc.service.store;

import com.model2.mvc.service.domain.Store;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface StoreService {
	
	
	public void addProduct(Store store) throws Exception;
	
	
	public Store getProduct(int storeNo) throws Exception;


	
	
}