package com.model;

 
import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Product {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String pid;
	private String company;
    private String name;
    private String qty;
    private String price;
    private String category;	
    private String tot_price;
    private String date;
    @Lob
    private byte[] pic;
    private String picContentType;
    
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTot_price() {
		return tot_price;
	}
	public void setTot_price(String tot_price) {
		this.tot_price = tot_price;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
		System.out.println("setting pic");
	}
	
	
	public String getPicContentType() {
		return picContentType;
	}
	public void setPicContentType(String imageContentType) {
		this.picContentType = imageContentType;
	}
	
	
	public String getBase64Image() {
		return pic !=null ? Base64.getEncoder().encodeToString(pic) : null;
		
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", pid=" + pid + ", company=" + company + ", name=" + name + ", qty=" + qty
				+ ", price=" + price + ", category=" + category + ", tot_price=" + tot_price + ", Date=" + date
				+ ", pic=" + Arrays.toString(pic) + ", picContentType=" + picContentType + "]";
	}
	
	

}
