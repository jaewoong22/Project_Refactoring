package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface PurchaseService {
	
	// ȸ������
	public void addPurchase(Purchase purchase) throws Exception;
	
	// ������Ȯ�� / �α���
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	// ȸ����������
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
}