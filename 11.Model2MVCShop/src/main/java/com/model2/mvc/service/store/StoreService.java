package com.model2.mvc.service.store;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Store;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface StoreService {
	
	
	public void addStore(Store store) throws Exception;
	

	public Map<String , Object> getStoreList(Search search) throws Exception;
	
	
}