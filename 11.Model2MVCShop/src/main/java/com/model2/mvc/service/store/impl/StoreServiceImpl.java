package com.model2.mvc.service.store.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Store;
import com.model2.mvc.service.store.StoreDao;
import com.model2.mvc.service.store.StoreService;


//==> 회원관리 서비스 구현
@Service("storeServiceImpl")
public class StoreServiceImpl implements StoreService{
	
	///Field
	@Autowired
	@Qualifier("storeDaoImpl")
	private StoreDao storeDao;
	
	public void setStoreDao(StoreDao storetDao) {
		this.storeDao = storetDao;
	}
	
	///Constructor
	public StoreServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addStore(Store store) throws Exception{
		storeDao.addStore(store);
	}

	public Map<String , Object > getStoreList(Search search) throws Exception {
		List<Store> list= storeDao.getStoreList(search);
		int totalCount = storeDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
	}

	
	
}