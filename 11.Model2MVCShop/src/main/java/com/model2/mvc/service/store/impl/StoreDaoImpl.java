package com.model2.mvc.service.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
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
	public void addStore(Store store) throws Exception {
		sqlSession.insert("StoreMapper.addStoret", store);
	}

	public Store getStore(int storeNo) throws Exception {
		return sqlSession.selectOne("StoreMapper.getStore", storeNo);
	}
	
	public List<Store> getStoreList(Search search) throws Exception {
		return sqlSession.selectList("StoreMapper.getStoreList", search);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("StoreMapper.getTotalCount", search);
	}
}