package com.model2.mvc.service.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Store;
import com.model2.mvc.service.store.StoreDao;


//==> 회원관리 DAO CRUD 구현
@Repository("storeDaoImpl")
public class StoreDaoImpl implements StoreDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public StoreDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addProduct(Store store) throws Exception {
		sqlSession.insert("StoreMapper.addProduct", store);
	}

	public Store getProduct(int storeNo) throws Exception {
		return sqlSession.selectOne("StoreMapper.getProduct", storeNo);
	}
	
}