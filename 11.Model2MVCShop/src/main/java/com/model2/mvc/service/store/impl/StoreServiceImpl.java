package com.model2.mvc.service.store.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Store;
import com.model2.mvc.service.store.StoreDao;
import com.model2.mvc.service.store.StoreService;


//==> 회원관리 서비스 구현
@Service("storeServiceImpl")
public class StoreServiceImpl implements StoreService{
	
	///Field
	@Autowired
	@Qualifier("storeDaoImpl")
	private StoreDao storetDao;
	
	public void setStoreDao(StoreDao storetDao) {
		this.storetDao = storetDao;
	}
	
	///Constructor
	public StoreServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addProduct(Store store) throws Exception{
		storetDao.addProduct(store);
	}

	public Store getProduct(int storeNo) throws Exception {
		return storetDao.getProduct(storeNo);
	}

	
}