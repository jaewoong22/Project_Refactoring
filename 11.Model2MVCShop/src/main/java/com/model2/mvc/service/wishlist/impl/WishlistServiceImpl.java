package com.model2.mvc.service.wishlist.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.wishlist.WishlistDao;
import com.model2.mvc.service.wishlist.WishlistService;


//==> 회원관리 서비스 구현
@Service("wishlistServiceImpl")
public class WishlistServiceImpl implements WishlistService{
	
	///Field
	@Autowired
	@Qualifier("wishlistDaoImpl")
	private WishlistDao wishlistDao;
	public void setWishlistDao(WishlistDao wishlistDao) {
		this.wishlistDao = wishlistDao;
	}
	
	///Constructor
	public WishlistServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addWishlist(Wishlist wishlist) throws Exception {
		wishlistDao.addWishlist(wishlist);		
	}

	@Override
	public List<Wishlist> getWishlist(String userId) throws Exception {
		
		return wishlistDao.getWishlist(userId);	
	}

	@Override
	public void deleteWishlist(int wishNo) throws Exception {
		wishlistDao.deleteWishlist(wishNo);
	}

	@Override
	public void updateWishlist(int wishNo, int buyNum) throws Exception {
		
		wishlistDao.updateWishlist(wishNo, buyNum);
	}

	@Override
	public Wishlist findWishlist(int wishNo) throws Exception {
		return wishlistDao.findWishlist(wishNo);
	}

}

