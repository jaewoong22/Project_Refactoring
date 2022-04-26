package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;


//==> 회원관리 DAO CRUD 구현
@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}

	
	////////////////////////////////////////////////////////////////////////////////////////////////
	
	public void updateStock(int buyNum, int prodNo) throws Exception {
		
		String buyNumber = buyNum+"";
		String prodNumber = prodNo+"";
		
		System.out.println("buyNumber : "+buyNumber);
		System.out.println("prodNumber : "+prodNumber);
		Map<String, String> map = new HashMap<String, String>();
		map.put("buyNum", buyNumber);
		map.put("prodNo",  prodNumber );
		
		sqlSession.update("PurchaseMapper.updateStock", map);
	}
	
	public void cancelOrder(int buyNum, int prodNo) throws Exception {
		
		String buyNumber = buyNum+"";
		String prodNumber = prodNo+"";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("buyNum", buyNumber);
		map.put("prodNo",  prodNumber );
		
		sqlSession.update("PurchaseMapper.cancelOrder", map);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", search.getSearchCondition() );
		map.put("orderCondition",  search.getOrderCondition() );
		map.put("searchKeyword",  search.getSearchKeyword() );
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("buyerId", buyerId);
		
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search, String buyerId) throws Exception {		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", search.getSearchCondition() );
		map.put("orderCondition",  search.getOrderCondition() );
		map.put("searchKeyword",  search.getSearchKeyword() );
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("buyerId", buyerId);
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}
	
	////////////////////////////////////////////////////////////////////////////////////////
	
	public List<Purchase> getSalesList(Search search) throws Exception {
		
		return sqlSession.selectList("PurchaseMapper.getSalesList", search);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount2(Search search) throws Exception {		
		
		return sqlSession.selectOne("PurchaseMapper.getTotalCount2", search);
	}
}