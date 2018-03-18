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
        <!-- header -->
        <script>

            var rTwo = null;
            function submitF() {
                if (window.XMLHttpRequest) {
                    rTwo = new XMLHttpRequest;
                } else if (window.ActiveXObject)
                {
                    rTwo = new ActivXObject(Microsoft.XMLHTTP);
                }
                rTwo.onreadystatechange = handleRTwo;
                yourEmail = document.getElementById("t1").value;
                yourPassword = document.getElementById("t2").value;
                console.log(yourEmail);
                url = "LoginServlet" + "?timeStamp=" + new Date().getTime();
                rTwo.open("POST", url, true);
                rTwo.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                rTwo.send("&userName=" + yourEmail + "&userPass=" + yourPassword);
            }
            function handleRTwo() {
                if (rTwo.readyState == 4 && rTwo.status == 200) {
                    console.log("ajax :: response");
                    if (rTwo.responseText === "InValid") {
                        document.getElementById("inValidValue").innerHTML = rTwo.responseText;
                    } else {
                        window.location.replace("index.jsp");
                    }
                }
            }
        </script>
        <div class="header" id="home">
            <div class="container">
                <ul>
                    <c:if test="${empty sessionScope.userInformation}">
                        <li> <a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-unlock-alt" aria-hidden="true" ></i> Sign In </a></li>
                        <li> <a href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:info@example.com">info@example.com</a></li>
                        </c:if>
                        <c:if test="${!empty sessionScope.userInformation}">
                        <li> <a href="profile.html" data-toggle="modal" data-target="#myModal"><i class="fa fa-unlock-alt" aria-hidden="true" ></i> Welcome ${sessionScope.userInformation.userName} </a></li>
                        <li onclick="signUpModalStarted();"> <a href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:info@example.com">info@example.com</a></li>
                        </c:if>
                </ul>
            </div>
        </div>
        <!-- //header -->
        <!-- header-bot -->
        <div class="header-bot">
            <div class="header-bot_inner_wthreeinfo_header_mid">
                <div class="col-md-4 header-middle">
                    <form action="SearchServlet" method="get">
                        <input type="search" name="search" placeholder="Search here..." required="">
                        <input type="submit" value=" ">
                        <div class="clearfix"></div>
                    </form>
                </div>
                <!-- header-bot -->
                <div class="col-md-4 logo_agile">
                    <h1><a href="index.jsp"><span>E</span>lite Shoppy <i class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a></h1>
                </div>
                <!-- header-bot -->
                <div class="col-md-4 agileits-social top_content">
                    <ul class="social-nav model-3d-0 footer-social w3_agile_social">
                        <li class="share">Share On : </li>
                        <li><a href="#" class="facebook">
                                <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="twitter"> 
                                <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="instagram">
                                <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="pinterest">
                                <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
                    </ul>



                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //header-bot -->
        <!-- banner -->
        <div class="ban-top">
            <div class="container">
                <div class="top_nav_left">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav menu__list">
                                    <li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>                                   
                                    <li class=" menu__item"><a class="menu__link" href="about.html">About</a></li>
                                    <li class=" menu__item"><a class="menu__link" href="contact.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>	
                </div>
                <div class="top_nav_right">
                    <div class="wthreecartaits wthreecartaits2 cart cart box_1"> 
                        <form action="#" method="post" class="last">                           
                            <input type="hidden" name="cmd" value="_cart">
                            <input type="hidden" name="display" value="1">
                            <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                        </form>  

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //banner-top -->
        <!-- Modal1 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="col-md-8 modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Sign In <span>Now</span></h3>
                            <form>
                                <div class="styled-input agile-styled-input-top">
                                    <input type="text" name="Name" required="" id="t1">
                                    <label>Name</label>
                                    <span></span>
                                </div>
                                <div class="styled-input">
                                    <input type="email" name="Email" required="" id="t2"> 
                                    <label>Email</label>
                                    <span></span>
                                </div> 
                                <input type="button" value="Sign In" onclick="submitF();">
                                <span id ="inValidValue"></span>
                            </form>
                            <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
                                <li><a href="#" class="facebook">
                                        <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                                        <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
                                <li><a href="#" class="twitter"> 
                                        <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                                        <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
                                <li><a href="#" class="instagram">
                                        <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                                        <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
                                <li><a href="#" class="pinterest">
                                        <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                                        <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
                            </ul>
                            <div class="clearfix"></div>
                            <p><a href="#" data-toggle="modal" data-target="#myModal2" > Don't have an account?</a></p>

                        </div>
                        <div class="col-md-4 modal_body_right modal_body_right1">
                            <img src="images/log_pic.jpg" alt=" "/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- //Modal content-->
            </div>
        </div>
        <!-- //Modal1 -->
        <!-- Modal2 -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="col-md-8 modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Sign Up <span>Now</span></h3>
                            <form>
                                <div class="styled-input agile-styled-input-top">
                                    <input type="text" name="Name" id ="name" required="" onblur="checkIfEmpty('name')">
                                    <label>Name</label>
                                    <span></span>
                                </div>
                                <label class="errMsg" id="nameErrMsg">Name field is required</label>

                                <div class="styled-input">
                                    <input type="text" name="Email" id="email" onblur="validateEmail()" required=""> 
                                    <label>Email</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="emailErrMSg">Invalid Email</label>

                                <div class="styled-input">
                                    <input type="password" name="password" id="password" onblur="validatePassword()" required=""> 
                                    <label>Password</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="passwordErrMsg">Password should be at least 6 characters long</label>

                                <div class="styled-input">
                                    <input type="password" name="Confirm Password" id="confirmPassword" onblur="validateConfirmPassword()" required=""> 
                                    <label>Confirm Password</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="confirmPasswordErrMsg">Password does not match the confirm password</label>


                                <div class="styled-input" >
                                    <input type="text" name="birthday" id="birthday" onclick="showBdPlaceholder()" 
                                           onblur="hideBdPlaceholder();validateBirthday();" required="">
                                    <label>Birthday</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="birthdayErrMsg">Invalid Birthday</label>

                                <div class="styled-input">
                                    <input type="text" name="Job" id ="job" required="" onblur="checkIfEmpty('job')"> 
                                    <label>Job</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="jobErrMsg">Job field is required</label>

                                <div class="styled-input">
                                    <input type="text" name="Address" id="address" required="" onblur="checkIfEmpty('address')"> 
                                    <label>Address</label>
                                    <span></span>
                                </div>
                                <label class="errMsg" id="addressErrMsg">Address field is required</label>
                                <br><br>

                                <input type="button" value="Sign Up" onclick="signUpNewUser()">
                            </form>
                        </div>
                        <br><br><br><div class="col-md-4 modal_body_right modal_body_right1">
                            <img src="images/log_pic.jpg" alt=" "/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- //Modal content-->
            </div>
        </div>
        <!-- //Modal2 -->

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
                                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                                                <form action="#" method="post">
                                                    <fieldset>
                                                        <input type="hidden" name="cmd" value="_cart" />
                                                        <input type="hidden" name="add" value="1" />
                                                        <input type="hidden" name="business" value=" " />
                                                        <input type="hidden" name="item_name" value="Men's Black Jeans" />
                                                        <input type="hidden" name="amount" value="30.99" />
                                                        <input type="hidden" name="discount_amount" value="1.00" />
                                                        <input type="hidden" name="currency_code" value="USD" />
                                                        <input type="hidden" name="return" value=" " />
                                                        <input type="hidden" name="cancel_return" value=" " />
                                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                                    </fieldset>
                                                </form>
                                            </div>

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
        <!-- footer -->
        <div class="footer">
            <div class="footer_agile_inner_info_w3l">
                <div class="col-md-3 footer-left">
                    <h2><a href="index.jsp"><span>E</span>lite Shoppy </a></h2>
                    <p>Elite Shoppy is a website for e-commerce</p>
                    <ul class="social-nav model-3d-0 footer-social w3_agile_social two">
                        <li><a href="#" class="facebook">
                                <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="twitter"> 
                                <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="instagram">
                                <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
                        <li><a href="#" class="pinterest">
                                <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                                <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
                    </ul>
                </div>
                <div class="col-md-9 footer-right">
                    <div class="sign-grds">
                        <div class="col-md-4 sign-gd">
                            <h4>Our <span>Information</span> </h4>
                            <ul>
                                <li><a href="index.jsp">Home</a></li>                        
                                <li><a href="about.html">About</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>

                        <div class="col-md-5 sign-gd-two">
                            <h4>Store <span>Information</span></h4>
                            <div class="w3-address">
                                <div class="w3-address-grid">
                                    <div class="w3-address-left">
                                        <i class="fa fa-phone" aria-hidden="true"></i>
                                    </div>
                                    <div class="w3-address-right">
                                        <h6>Phone Number</h6>
                                        <p>+1 234 567 8901</p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="w3-address-grid">
                                    <div class="w3-address-left">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                    </div>
                                    <div class="w3-address-right">
                                        <h6>Email Address</h6>
                                        <p>Email :<a href="mailto:example@email.com"> mail@example.com</a></p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="w3-address-grid">
                                    <div class="w3-address-left">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    </div>
                                    <div class="w3-address-right">
                                        <h6>Location</h6>
                                        <p>Broome St, NY 10002,California, USA. 

                                        </p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <p class="copy-right">&copy 2017 Elite shoppy. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
            </div>
        </div>
        <!-- //footer -->

        <!-- login -->
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content modal-info">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                    </div>
                    <div class="modal-body modal-spa">
                        <div class="login-grids">
                            <div class="login">
                                <div class="login-bottom">
                                    <h3>Sign up for free</h3>
                                    <form>
                                        <div class="sign-up">
                                            <h4>Email :</h4>
                                            <input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Type here';
                                            }" required="">	
                                        </div>
                                        <div class="sign-up">
                                            <h4>Password :</h4>
                                            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Password';
                                            }" required="">

                                        </div>
                                        <div class="sign-up">
                                            <h4>Re-type Password :</h4>
                                            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Password';
                                            }" required="">

                                        </div>
                                        <div class="sign-up">
                                            <input type="submit" value="REGISTER NOW" >
                                        </div>

                                    </form>
                                </div>
                                <div class="login-right">
                                    <h3>Sign in with your account</h3>
                                    <form>
                                        <div class="sign-in">
                                            <h4>Email :</h4>
                                            <input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Type here';
                                            }" required="">	
                                        </div>
                                        <div class="sign-in">
                                            <h4>Password :</h4>
                                            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Password';
                                            }" required="">
                                            <a href="#">Forgot password?</a>
                                        </div>
                                        <div class="single-bottom">
                                            <input type="checkbox"  id="brand" value="">
                                            <label for="brand"><span></span>Remember Me.</label>
                                        </div>
                                        <div class="sign-in">
                                            <input type="submit" value="SIGNIN" >
                                        </div>
                                    </form>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //login -->
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
