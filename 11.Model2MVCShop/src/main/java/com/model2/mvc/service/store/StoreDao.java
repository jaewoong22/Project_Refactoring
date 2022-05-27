package com.model2.mvc.service.store;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Store;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface StoreDao {
	
	// INSERT
	public void addStore(Store store) throws Exception ;


	// SELECT LIST
	public List<Store> getStoreList(Search search) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
}