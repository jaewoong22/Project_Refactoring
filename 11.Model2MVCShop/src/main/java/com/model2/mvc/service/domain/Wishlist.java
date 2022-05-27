package com.model2.mvc.service.domain;


public class Wishlist {
	
	private int wishNo;
	private int prodNo;
	private String userId;
	private int buyNum;
	private String prodName;
	private String fileName;
	private int price;	
	
	


	public Wishlist(){
	}


	public int getWishNo() {
		return wishNo;
	}


	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getProdNo() {
		return prodNo;
	}


	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getBuyNum() {
		return buyNum;
	}


	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	
	
	public String getProdName() {
		return prodName;
	}


	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	
	
	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	

	public String toString() {
		return "WishlisVO :"+"[wishNo: "+wishNo+", userId: "+userId+", prodNo: "+prodNo+", prodName: "+prodName+", fileName: "+fileName+", buyNum: "+buyNum+", price: "+price +"]";
	}
}