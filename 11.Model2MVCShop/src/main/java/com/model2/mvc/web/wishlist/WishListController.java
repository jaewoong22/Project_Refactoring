package com.model2.mvc.web.wishlist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wishlist;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wishlist.WishlistService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/wishList/*")
public class WishListController {
	
	///Field
	@Autowired
	@Qualifier("wishlistServiceImpl")
	private WishlistService wishlistService;
	
		
	public WishListController(){
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping("addWishlist")
	public String addWishlist( @ModelAttribute("wishlist") Wishlist wishlist) throws Exception {

		System.out.println("/addWishlist");
		System.out.println("userId : "+wishlist.getUserId());
		System.out.println("prodNo : "+wishlist.getProdNo());
		
		wishlistService.addWishlist(wishlist);
		
		return "redirect:/product/getProduct?menu=search&prodNo="+wishlist.getProdNo();
	}
	
	
	@RequestMapping("getWishlist")
	public String listProduct( @RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("/getWishlist");
		
		List<Wishlist> list = wishlistService.getWishlist(userId);
		
		
		// Model 과 View 연결
		model.addAttribute("wishlist", list);
		
		return "forward:/wishlist/wishlist.jsp";
	}

}