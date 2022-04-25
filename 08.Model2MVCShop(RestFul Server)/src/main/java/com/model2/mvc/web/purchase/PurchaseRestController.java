package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	//@RequestMapping( value="json/addPurchase/{prodNo}", method=RequestMethod.GET )
	public Product addPurchase(@PathVariable int prodNo) throws Exception {

		
		System.out.println("/purchase/addPurchase : GET");
		
	
		return productService.getProduct(prodNo);
	}
	
	
	@RequestMapping( value="json/addPurchase", method=RequestMethod.POST )
	public Map addPurchase( @RequestBody Purchase purchase ) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		//Business Logic
		
		System.out.println(purchase.getBuyer().getUserId());
		System.out.println(purchase.getPurchaseProd().getProdNo());
		
		User user = userService.getUser(purchase.getBuyer().getUserId());
		System.out.println("user는 : "+user);
		Product product = productService.getProduct(purchase.getPurchaseProd().getProdNo());
		System.out.println("product는 : "+product);
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setTranCode("001");
		purchaseService.addPurchase(purchase);
		
		Map map = new HashMap();
		map.put("purchase", purchase);
		
		return map;
	}
	

	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception {
		
		
		return purchaseService.getPurchase(tranNo);
	}
	
	
	///*		
	@RequestMapping( value="json/updatePurchase", method=RequestMethod.POST )
	public Purchase updatePurchase( @RequestBody Purchase purchase) throws Exception{

		purchaseService.updatePurchase(purchase);
		
		return purchaseService.getPurchase(purchase.getTranNo());
	}
	
	
	@RequestMapping(value="json/updateTranCode/{tranNo}", method=RequestMethod.GET)
	public Purchase updateTranCode( @PathVariable int tranNo ) throws Exception{

		System.out.println("/purchsae/updateTranCode : GET");
		//Business Logic
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		String tranCode = purchase.getTranCode();
		
		if(tranCode.equals("001")) {
			tranCode = "002";
		}else if(tranCode.equals("002")) {
			tranCode = "003";
		}
		
		
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);

		
		return purchaseService.getPurchase(tranNo);
	}
	
	
	/*
	@RequestMapping(value="json/listProduct")
	public Map listProduct( @RequestBody Search search) throws Exception{
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", resultPage);
		map2.put("search", search);
		
		return map2;
	}
//*/	
	
	
}