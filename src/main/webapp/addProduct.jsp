
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/productForm.css">
      
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <div style="margin: auto; width: 500px; padding: 40px">
        <form class="productForm" action="AddProductServlet" method="post">
            <fieldset>
                <legend>Add Product:</legend>
                Product name:<br>
                <input type="text" name="productName" value="${product.productName}"><br>
                
                
                Product Price:<br>
                <input type="text" name="productPrice" value="${product.productPrice}"><br>
      
                
                 Product Description :<br>
                 <input type="text" name="productDescription" value="${product.producctDescription}"><br>
                 
                  Product Quantity :<br>
                 <input type="text" name="productQuan" value="${product.productQuantity}"><br>
                 
                 Product image :<br>
                 <input type="text" name="productImage"  value="${product.productImage}"><br>
                <input id="submit" type="submit" value="Submit">
               
            </fieldset>
        </form> 
        </div>
        
        <jsp:include page="footer.jsp"/>
    </body>
</html>

