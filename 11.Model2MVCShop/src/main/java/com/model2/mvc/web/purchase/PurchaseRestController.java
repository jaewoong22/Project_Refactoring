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

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
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
		
		int buyNum = purchase.getBuyNum();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		System.out.println(buyNum);
		System.out.println(prodNo);
		purchaseService.updateStock(buyNum, prodNo);
		
		Map map = new HashMap();
		map.put("purchase", purchase);
		
		return map;
	}
	

	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		User user = userService.getUser(purchase.getBuyer().getUserId());
		Product product = productService.getProduct(purchase.getPurchaseProd().getProdNo());
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		return purchase;
	}
	
	
	///*		
	@RequestMapping( value="json/updatePurchase", method=RequestMethod.POST )
	public Purchase updatePurchase( @RequestBody Purchase purchase) throws Exception{

		User user = userService.getUser(purchase.getBuyer().getUserId());
		Product product = productService.getProduct(purchase.getPurchaseProd().getProdNo());
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
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
	
	
	///*
	@RequestMapping(value="json/listPurchase/{buyerId}")
	public Map listPurchase( @RequestBody Search search, @PathVariable String buyerId) throws Exception{
		
		
		System.out.println("/purchase/listPurchase : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, buyerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		User user = userService.getUser(buyerId);

		Map map1 = new HashMap();
		map1.put("search", search);
		map1.put("resultPage", resultPage);
		map1.put("list", map.get("list"));
		map1.put("user", user);
		
		
		return map1;
	}
	
	@RequestMapping(value="json/listSales")
	public Map listSales( @RequestBody Search search) throws Exception{
		
		
		System.out.println("/purchase/listPurchase : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getSalesList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		

		Map map1 = new HashMap();
		map1.put("search", search);
		map1.put("resultPage", resultPage);
		map1.put("list", map.get("list"));
		
		
		return map1;
	}
//*/	
	
	
}