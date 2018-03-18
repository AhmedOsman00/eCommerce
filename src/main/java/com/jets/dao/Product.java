package com.jets.dao;
// Generated Mar 4, 2018 5:20:16 PM by Hibernate Tools 4.3.1



/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private Integer productId;
     private String productName;
     private int productPrice;
     private String producctDescription;
     private Integer productQuantity;
     private String productImage;

    public Product() {
    }

	
    public Product(String productName, int productPrice, String producctDescription, String productImage) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.producctDescription = producctDescription;
        this.productImage = productImage;
    }
    public Product(String productName, int productPrice, String producctDescription, Integer productQuantity, String productImage) {
       this.productName = productName;
       this.productPrice = productPrice;
       this.producctDescription = producctDescription;
       this.productQuantity = productQuantity;
       this.productImage = productImage;
    }
   
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public int getProductPrice() {
        return this.productPrice;
    }
    
    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
    public String getProducctDescription() {
        return this.producctDescription;
    }
    
    public void setProducctDescription(String producctDescription) {
        this.producctDescription = producctDescription;
    }
    public Integer getProductQuantity() {
        return this.productQuantity;
    }
    
    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }
    public String getProductImage() {
        return this.productImage;
    }
    
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }




}


