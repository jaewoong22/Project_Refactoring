package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Map addUser( @RequestBody Product product ) throws Exception {

		System.out.println("/product/addProduct : POST");
		//Business Logic
		System.out.println(product);
		System.out.println("start");
		productService.addProduct(product);
		System.out.println("end");
		
		Map map = new HashMap();
		map.put("product", product);
		
		return map;
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo ) throws Exception {
		
		
		return productService.getProduct(prodNo);
	}
	
	
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Product updateupdateProductUser( @RequestBody Product product) throws Exception{

		productService.updateProduct(product);
		
		System.out.println(productService.getProduct(product.getProdNo()));
		
		return productService.getProduct(product.getProdNo());
	}
	
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
	
	
	
}