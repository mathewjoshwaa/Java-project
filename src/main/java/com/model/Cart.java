// Cart.java
package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//Cart.java (modified)
@Entity
public class Cart {

 @Override
	public String toString() {
		return "Cart [id=" + id + ", productId=" + productId + ", productName=" + productName + ", productPrice="
				+ productPrice + ", userName=" + userName + ", quantity=" + quantity + "]";
	}

@Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id; // Primary key - remains Long

 private String productId;   // Changed to String
 private String productName; // Changed to String
 private String productPrice; // Changed to String
 private String userName;    // Changed to String

 private String quantity;    // Changed to String (to hold quantity as string)

 // Getters and Setters for all fields

 public Long getId() {
     return id;
 }

 public void setId(Long id) {
     this.id = id;
 }

 public String getProductId() {
     return productId;
 }

 public void setProductId(String productId) {
     this.productId = productId;
 }

 public String getProductName() {
     return productName;
 }

 public void setProductName(String productName) {
     this.productName = productName;
 }

 public String getProductPrice() {
     return productPrice;
 }

 public void setProductPrice(String productPrice) {
     this.productPrice = productPrice;
 }

 public String getUserName() {
     return userName;
 }

 public void setUserName(String userName) {
     this.userName = userName;
 }

 public String getQuantity() {
     return quantity;
 }

 public void setQuantity(String quantity) {
     this.quantity = quantity;
 }

 public void incrementQuantity() {
     if (this.quantity == null || this.quantity.isEmpty()) {
         this.quantity = "1";
     } else {
         this.quantity = String.valueOf(Integer.parseInt(this.quantity) + 1);
     }
 }
}

