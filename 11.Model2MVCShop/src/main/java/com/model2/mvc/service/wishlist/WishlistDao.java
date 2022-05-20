package com.model2.mvc.service.wishlist;

import java.util.List;

import com.model2.mvc.service.domain.Wishlist;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface WishlistDao {
	
	// INSERT
	public void addWishlist(Wishlist wishlist) throws Exception ;

	// SELECT LIST
	public List<Wishlist> getWishlist(String userId) throws Exception ;

	//update
	public void updateWishlist(int wishNo, int buyNum) throws Exception ;
		
	//delete
	public void deleteWishlist(int wishNo) throws Exception ;
	
}