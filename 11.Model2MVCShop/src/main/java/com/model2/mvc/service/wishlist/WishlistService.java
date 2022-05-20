package com.model2.mvc.service.wishlist;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface WishlistService {
	
	//장바구니추가
	public void addWishlist(Wishlist wishlist) throws Exception;
	
	// 장바구니리스트 
	public List<Wishlist> getWishlist(String userId) throws Exception;
	
	// 장바구니수정(수량)
	public void updateWishlist(int wishNo, int buyNum) throws Exception;
	
	// 장바구니삭제
	public void deleteWishlist(int wishNo) throws Exception;
	
}