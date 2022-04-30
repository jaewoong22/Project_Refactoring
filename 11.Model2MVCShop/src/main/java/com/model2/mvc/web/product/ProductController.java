package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
///*
	@RequestMapping(value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("uploadfiles[]") MultipartFile[] fileArray, Model model ) throws Exception {
		
		System.out.println("/product/addProduct : POST");
		
		String temDir = "C:\\Users\\bitcamp\\git\\Project_Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		String fileName = "";
	
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(temDir, fileArray[i].getOriginalFilename()));
				System.out.println("파일명 :: "+fileArray[i].getOriginalFilename());
				
			}else {
				System.out.println("파일업로드 실패...?");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"&";
			
			System.out.println("저장될 파일이름 : "+fileName);
		}
				
		String manuDate = "";
		String[]  manuDates = product.getManuDate().split("/");
		manuDate = manuDates[2]+manuDates[0]+manuDates[1];
		
		System.out.println(manuDate);
		
		product.setFileName(fileName);
		product.setManuDate(manuDate);
		productService.addProduct(product);
		
		model.addAttribute(product);
		
		return "forward:/product/readProduct.jsp";
	}
//*/

	
/*	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product, Model model ) throws Exception {

		System.out.println("/product/addProduct : POST");
		//Business Logic
		System.out.println(product);
		
		product.setManuDate(product.getManuDate().replace("-", ""));
		productService.addProduct(product);
		
		model.addAttribute(product);
		
		return "forward:/product/readProduct.jsp";
	}
//*/
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , @CookieValue(value="history", required=false) Cookie cookie,  
										HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		
		String img = product.getFileName();
		String prod = product.getProdName();
		String pn = "/"+prodNo+"&"+img+"&"+prod;
		String first = prodNo+"&"+img+"&"+prod;
		
		if (cookie == null) {
			
			Cookie prodCookie = new Cookie("history",first);
			prodCookie.setPath("/");
			response.addCookie(prodCookie);
					
		}else{
	
			String str1 = cookie.getValue()+ pn;
			
			Cookie prodCookie02 = new Cookie("history",str1);
			prodCookie02.setPath("/");
			response.addCookie(prodCookie02);
			
			System.out.println("Not NULL일 때 저장된 prod쿠키값"+cookie.getValue());
			System.out.println("Not NULL일 때 저장될 prod쿠키값"+str1);
		}
		
		return "forward:/product/getProduct.jsp";
	}
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET )
	public String updateProduct( @ModelAttribute("product") Product product , Model model) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		product = productService.getProduct(product.getProdNo());
		
		model.addAttribute("product", product);

		return "forward:/product/updateProduct.jsp";
	}
	
/*	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
//*/	
///*	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , @RequestParam("uploadfiles[]") MultipartFile[] fileArray) throws Exception{

		System.out.println("/product/updateProduct : POST");
		
		String temDir = "C:\\Users\\bitcamp\\git\\Project_Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		String fileName = "";
	
		System.out.println("prodNo"+product.getProdNo());
		
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(temDir, fileArray[i].getOriginalFilename()));
				System.out.println("파일명 :: "+fileArray[i].getOriginalFilename());
				
			}else {
				System.out.println("파일업로드 실패...?");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"&";
			
			System.out.println("저장될 파일이름 : "+fileName);
		}
		
		String manuDate = product.getManuDate();
		
		if(product.getManuDate().contains("/")) {
			String[]  manuDates = product.getManuDate().split("/");
			manuDate = manuDates[2]+manuDates[0]+manuDates[1];
		}
		
		System.out.println(manuDate);
		
		product.setFileName(fileName);
		product.setManuDate(manuDate);
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
//*/	
	@RequestMapping( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct :  GET / POST ");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		Map<String , Object> mapName = productService.getProdNames(search);
		
		String names = "";
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("prodNames",mapName.get("list"));
		
		
		return "forward:/product/listProduct.jsp";
	}
}