package com.jets.dao;
// Generated Mar 18, 2018 7:53:02 PM by Hibernate Tools 4.3.1



/**
 * Credit generated by hbm2java
 */
public class Credit  implements java.io.Serializable {


     private int code;
     private int value;

    public Credit() {
    }

    public Credit(int code, int value) {
       this.code = code;
       this.value = value;
    }
   
    public int getCode() {
        return this.code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    public int getValue() {
        return this.value;
    }
    
    public void setValue(int value) {
        this.value = value;
    }




}


