package com.sikon.service.domain;

import java.sql.Date;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;


public class Purchase {
	
	private int tranNo;
	private Product purchaseProd;
	private User buyer;
	private String usedCoupon;
	private String receiverName;
	private String receiverPhone;
	private String receiverEmail;
	private String divyAddr;
	private String divyMessage;
	private int purchaseQuantity;
	private Date orderDate;
	private String invoiceNum;
	private int usedPoint;
	private int earnPoint;
	private String PaymentOpt;
	private String divyStatus;


	
	
	public Purchase(){
	}
	
	

	public int getTranNo() {
		return tranNo;
	}



	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}



	public Product getPurchaseProd() {
		return purchaseProd;
	}



	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}



	public User getBuyer() {
		return buyer;
	}



	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}



	public String getUsedCoupon() {
		return usedCoupon;
	}



	public void setUsedCoupon(String usedCoupon) {
		this.usedCoupon = usedCoupon;
	}



	public String getReceiverName() {
		return receiverName;
	}



	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}



	public String getReceiverPhone() {
		return receiverPhone;
	}



	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}



	public String getReceiverEmail() {
		return receiverEmail;
	}



	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}



	public String getDivyAddr() {
		return divyAddr;
	}



	public void setDivyAddr(String divyAddr) {
		this.divyAddr = divyAddr;
	}



	public String getDivyMessage() {
		return divyMessage;
	}



	public void setDivyMessage(String divyMessage) {
		this.divyMessage = divyMessage;
	}



	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}



	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public String getInvoiceNum() {
		return invoiceNum;
	}



	public void setInvoiceNum(String invoiceNum) {
		this.invoiceNum = invoiceNum;
	}



	public int getUsedPoint() {
		return usedPoint;
	}



	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}



	public int getEarnPoint() {
		return earnPoint;
	}



	public void setEarnPoint(int earnPoint) {
		this.earnPoint = earnPoint;
	}



	public String getPaymentOpt() {
		return PaymentOpt;
	}



	public void setPaymentOpt(String paymentOpt) {
		PaymentOpt = paymentOpt;
	}



	public String getDivyStatus() {
		return divyStatus;
	}



	public void setDivyStatus(String divyStatus) {
		this.divyStatus = divyStatus;
	}



	public String toString() {
		return "Purchase [tranNo=" + tranNo + ", usedCoupon=" + usedCoupon + ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone 
				+ ", receiverEmail=" + receiverEmail+ ", divyAddr=" + divyAddr + ", divyMessage="+ divyMessage + ", purchaseQuantity=" + purchaseQuantity
				+ ", orderDate=" + orderDate + ", invoiceNum="+ invoiceNum + ", usedPoint=" + usedPoint + ", earnPoint="+ earnPoint
				 + ", PaymentOpt="+ PaymentOpt + ", divyStatus="+ divyStatus + "]";
	}
}