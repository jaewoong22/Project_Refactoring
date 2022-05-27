package com.model2.mvc.service.store;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Store;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface StoreDao {
	
	// INSERT
	public void addStore(Store store) throws Exception ;


	// SELECT LIST
	public List<Store> getStoreList(Search search) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
}