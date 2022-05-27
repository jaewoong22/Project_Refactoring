package com.model2.mvc.service.wishlist.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.wishlist.WishlistDao;


//==> 장바구니 DAO CRUD 구현
@Repository("wishlistDaoImpl")
public class WishlistDaoImpl implements WishlistDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public WishlistDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addWishlist(Wishlist wishlist) throws Exception {
		sqlSession.insert("WishlistMapper.addWishlist", wishlist);
	}

	@Override
	public List<Wishlist> getWishlist(String userId) throws Exception {
		
		return sqlSession.selectList("WishlistMapper.getWishlist", userId);
	}

	@Override
	public void deleteWishlist(int wishNo) throws Exception {
		sqlSession.delete("WishlistMapper.deleteWishlist",wishNo);
	}

	@Override
	public void updateWishlist(int wishNo, int buyNum) throws Exception {
		
		String buyNumber = buyNum+"";
		String wishNumber = wishNo+"";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("buyNum", buyNumber);
		map.put("wishNo",  wishNumber );
		
		sqlSession.update("WishlistMapper.updateWishlist",map);
	}

	@Override
	public Wishlist findWishlist(int wishNo) throws Exception {
		return sqlSession.selectOne("WishlistMapper.findWishlist", wishNo);
	}

}