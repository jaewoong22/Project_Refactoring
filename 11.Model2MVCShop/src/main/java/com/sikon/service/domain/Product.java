package com.sikon.service.domain;

import java.sql.Date;


public class Product {
	
	private int prodNo;
	private String prodName;
	private String prodThumbnail;
	private String prodContent;
	private String prodDetail;	
	private int prodStock;
	private String prodTheme;
	private int prodPrice;
	private int prodDisRate;
	private int prodDisPrice;
	private Date prodRegDate;
	private String prodStatus;
	private String couponApply;
	


	public Product(){
	}
	
	
	

	public int getProdNo() {
		return prodNo;
	}




	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}




	public String getProdName() {
		return prodName;
	}




	public void setProdName(String prodName) {
		this.prodName = prodName;
	}




	public String getProdThumbnail() {
		return prodThumbnail;
	}




	public void setProdThumbnail(String prodThumbnail) {
		this.prodThumbnail = prodThumbnail;
	}




	public String getProdContent() {
		return prodContent;
	}




	public void setProdContent(String prodContent) {
		this.prodContent = prodContent;
	}




	public String getProdDetail() {
		return prodDetail;
	}




	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}




	public int getProdStock() {
		return prodStock;
	}




	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}




	public String getProdTheme() {
		return prodTheme;
	}




	public void setProdTheme(String prodTheme) {
		this.prodTheme = prodTheme;
	}




	public int getProdPrice() {
		return prodPrice;
	}




	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}




	public int getProdDisRate() {
		return prodDisRate;
	}




	public void setProdDisRate(int prodDisRate) {
		this.prodDisRate = prodDisRate;
	}




	public int getProdDisPrice() {
		return prodDisPrice;
	}




	public void setProdDisPrice(int prodDisPrice) {
		this.prodDisPrice = prodDisPrice;
	}




	public Date getProdRegDate() {
		return prodRegDate;
	}




	public void setProdRegDate(Date prodRegDate) {
		this.prodRegDate = prodRegDate;
	}




	public String getProdStatus() {
		return prodStatus;
	}




	public void setProdStatus(String prodStatus) {
		this.prodStatus = prodStatus;
	}




	public String getCouponApply() {
		return couponApply;
	}




	public void setCouponApply(String couponApply) {
		this.couponApply = couponApply;
	}




	public String toString() {
		return "Product :"+"[prodNo: "+prodNo+", prodName: "+prodName+", prodThumbnail: "+prodThumbnail+", prodDetail: "+prodDetail
				+", prodStock: "+prodStock+", prodTheme: "+prodTheme+", prodPrice: "+prodPrice+", prodDisRate: "+prodDisRate+", prodDisPrice: "+prodDisPrice
				+", prodRegDate: "+prodRegDate+", prodStatus: "+prodStatus+", couponApply: "+couponApply+"]";
	}	
}