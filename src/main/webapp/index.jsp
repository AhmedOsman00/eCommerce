<%-- 
    Document   : index
    Created on : Mar 12, 2018, 1:49:55 PM
    Author     : Ahmed Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>Elite Shoppy an Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Elite Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--//tags -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
        <!-- //for bootstrap working -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/signUp.js"></script>
        <!--SignUp JS and Style-->
        <link rel="stylesheet" type="text/css" href="css/signUpModal.css">
        <script type="text/javascript" src="js/signUp.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!-- //Modal1 -->
        

        <!-- banner -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                <li data-target="#myCarousel" data-slide-to="4" class=""></li> 
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active"> 
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>The Biggest <span>Sale</span></h3>
                            <p>Special for today</p>                           
                        </div>
                    </div>
                </div>
                <div class="item item2"> 
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Summer <span>Collection</span></h3>
                            <p>New Arrivals On Sale</p>
                        </div>
                    </div>
                </div>
                <div class="item item3"> 
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>The Biggest <span>Sale</span></h3>
                            <p>Special for today</p>                            
                        </div>
                    </div>
                </div>
                <div class="item item4"> 
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Summer <span>Collection</span></h3>
                            <p>New Arrivals On Sale</p>
                        </div>
                    </div>
                </div>
                <div class="item item5"> 
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>The Biggest <span>Sale</span></h3>
                            <p>Special for today</p>
                        </div>
                    </div>
                </div> 
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!-- The Modal -->
        </div> 
        <!-- /new_arrivals --> 
        <div class="new_arrivals_agile_w3ls_info"> 
            <div class="container">                	                
                <div class="resp-tabs-container">
                    <!--/tab_one-->
                    <div class="tab1">
                        <c:forEach items="${products}" var="product" varStatus="count" >
                            <div class="col-md-3 product-men">
                                <div class="men-pro-item simpleCart_shelfItem">
                                    <div class="men-thumb-item">
                                        <img src="${product.productImage}" alt="" class="pro-image-front">
                                        <img src="${product.productImage}" alt="" class="pro-image-back">
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">
                                                <form id="${count.index}"  method="POST" action="ProductsServlet">
                                                    <a href="javascript:document.getElementById('${count.index}').submit()" class="link-product-add-cart">Quick View</a>
                                            </div>
                                        </div>                                                                       
                                    </div>
                                    <div class="item-info-product ">
                                        <input type="hidden" name="id" value="${product.productId}"/>
                                        <h4><a href="javascript:document.getElementById('${count.index}').submit()">${product.productName}</a></h4>
                                        </form>
                                        <div class="info-product-price">
                                            <span class="item_price">$${product.productPrice}</span>
                                        </div>
                                       <c:if test="${sessionScope.userInformation.type.equals('user')}"> 
                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                                            <form action="#" method="post">
                                                <fieldset>
                                                    <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="id" value ="${product.productId}"/>
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="business" value=" " />
                                                    <input type="hidden" name="item_name" value="${product.productName}" />
                                                    <input type="hidden" name="amount" value="${product.productPrice}" />
                                                    <input type="hidden" name="discount_amount" value="0.00" />
                                                    <input type="hidden" name="currency_code" value="USD" />
                                                    <input type="hidden" name="return" value=" " />
                                                    <input type="hidden" name="cancel_return" value=" " />
                                                    <input type="submit" name="submit" value="Add to cart" class="button" />
                                                </fieldset>
                                            </form>
                                        </div>
                                       </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </div>
                    <!--//tab_one-->                                               
                </div>                	
            </div>
        </div>       
        <!--/grids-->
        <div class="coupons">
            <div class="coupons-grids text-center">
                <div class="w3layouts_mail_grid">
                    <div class="col-md-3 w3layouts_mail_grid_left">
                        <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                            <i class="fa fa-truck" aria-hidden="true"></i>
                        </div>
                        <div class="w3layouts_mail_grid_left2">
                            <h3>FREE SHIPPING</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3layouts_mail_grid_left">
                        <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                            <i class="fa fa-headphones" aria-hidden="true"></i>
                        </div>
                        <div class="w3layouts_mail_grid_left2">
                            <h3>24/7 SUPPORT</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3layouts_mail_grid_left">
                        <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                            <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                        </div>
                        <div class="w3layouts_mail_grid_left2">
                            <h3>MONEY BACK GUARANTEE</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3layouts_mail_grid_left">
                        <div class="w3layouts_mail_grid_left1 hvr-radial-out">
                            <i class="fa fa-gift" aria-hidden="true"></i>
                        </div>
                        <div class="w3layouts_mail_grid_left2">
                            <h3>FREE GIFT COUPONS</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>

            </div>
        </div>
        <!--grids-->
        <jsp:include page="footer.jsp"/>
        <a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <script src="js/modernizr.custom.js"></script>
        <!-- Custom-JavaScript-File-Links --> 
        <!-- cart-js -->
        <script src="js/minicart.min.js"></script>
        <script>
                                                // Mini Cart
                                                paypal.minicart.render({
                                                    action: '#'
                                                });

                                                if (~window.location.search.indexOf('reset=true')) {
                                                    paypal.minicart.reset();
                                                }
        </script>

        <!-- //cart-js --> 
        <!-- script for responsive tabs -->						
        <script src="js/easy-responsive-tabs.js"></script>
        <script>
                                                $(document).ready(function () {
                                                    $('#horizontalTab').easyResponsiveTabs({
                                                        type: 'default', //Types: default, vertical, accordion           
                                                        width: 'auto', //auto or any width like 600px
                                                        fit: true, // 100% fit in a container
                                                        closed: 'accordion', // Start closed if in accordion view
                                                        activate: function (event) { // Callback function if tab is switched
                                                            var $tab = $(this);
                                                            var $info = $('#tabInfo');
                                                            var $name = $('span', $info);
                                                            $name.text($tab.text());
                                                            $info.show();
                                                        }
                                                    });
                                                    $('#verticalTab').easyResponsiveTabs({
                                                        type: 'vertical',
                                                        width: 'auto',
                                                        fit: true
                                                    });
                                                });
        </script>
        <!-- //script for responsive tabs -->		
        <!-- stats -->
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.countup.js"></script>
        <script>
                                                $('.counter').countUp();
        </script>
        <!-- //stats -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/jquery.easing.min.js"></script>
        <script type="text/javascript">
                                                jQuery(document).ready(function ($) {
                                                    $(".scroll").click(function (event) {
                                                        event.preventDefault();
                                                        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                                    });
                                                });
        </script>
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <!-- //here ends scrolling icon in
        
        
        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/minicart.min.js"></script>
    </body>
</html>