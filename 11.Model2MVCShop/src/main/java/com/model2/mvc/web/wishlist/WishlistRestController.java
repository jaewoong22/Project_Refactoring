package com.model2.mvc.web.wishlist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.wishlist.WishlistService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/wishList/*")
public class WishlistRestController {
	
	///Field
	@Autowired
	@Qualifier("wishlistServiceImpl")
	private WishlistService wishlistService;
	//setter Method 구현 않음
		
	public WishlistRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	@RequestMapping( value="json/updateWishlist")
	public int updateWishlist( @RequestParam("wishNo") int wishNo, @RequestParam("buyNum") int buyNum, HttpSession session) throws Exception{
		
		System.out.println("/json/updateWishlist");
		
		wishlistService.updateWishlist(wishNo,buyNum);
		
		Wishlist wishlist = wishlistService.findWishlist(wishNo);
		
		return wishlist.getBuyNum();
	}
	
	
}