package com.model2.mvc.service.purchase.test;


import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/*.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void testAddPurchase() throws Exception {
		
		User user = new User();
		user.setUserId("user11");
		
		Product product = new Product();
		product.setProdNo(10037);
		
		Purchase purchase = new Purchase();
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("재웅");
		purchase.setReceiverPhone("010");
		purchase.setDivyAddr("수원");
		purchase.setDivyRequest("문앞");
		purchase.setDivyDate("22/04/22");
		purchase.setTranCode("001");
		
		purchaseService.addPurchase(purchase);

	}
	
	@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		//==> 필요하다면...
		purchase = purchaseService.getPurchase(10038);

		//==> console 확인
		System.out.println(purchase);
		
		//==> API 확인
		Assert.assertEquals(10037, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user11", purchase.getBuyer().getUserId());

		Assert.assertNotNull(purchaseService.getPurchase(10038));
	}
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		 Purchase purchase = purchaseService.getPurchase(10038);
		Assert.assertNotNull(purchase);
		
		
		Assert.assertEquals("재웅", purchase.getReceiverName());
		Assert.assertEquals("010", purchase.getReceiverPhone());
		Assert.assertEquals("수원", purchase.getDivyAddr());
		Assert.assertEquals("문앞", purchase.getDivyRequest());

		purchase.setPaymentOption("1");
		purchase.setReceiverName("재웅");
		purchase.setReceiverPhone("010");
		purchase.setDivyAddr("수원");
		purchase.setDivyRequest("문앞");
		purchase.setDivyDate("22/04/29");
		//purchase.setDivyDate("");
		
		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10038);
		
		//==> console 확인
		System.out.println(purchase);
			
		//==> API 확인
		
		Assert.assertEquals("재웅", purchase.getReceiverName());
		Assert.assertEquals("010", purchase.getReceiverPhone());
		Assert.assertEquals("수원", purchase.getDivyAddr());
		Assert.assertEquals("문앞", purchase.getDivyRequest());
		
		
	 }
	 
	 
	//@Test
	 public void testUpdateTranCode() throws Exception{
		 
		 Purchase purchase = purchaseService.getPurchase(10038);
		//Assert.assertNotNull(purchase);
		
		
		Assert.assertEquals("001", purchase.getTranCode());

		purchase.setTranCode("002");
		
		purchaseService.updateTranCode(purchase);
		
		purchase = purchaseService.getPurchase(10038);
		
		//==> console 확인
		System.out.println(purchase);
			
		//==> API 확인
		Assert.assertEquals("002", purchase.getTranCode());
		
		
	 }
	
	 //==>  주석을 풀고 실행하면....
	 //@Test
	 public void testGetPurchaseListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	String buyerId="admin";
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getPurchaseList(search, buyerId);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
}