<%-- 
    Document   : header
    Created on : Mar 19, 2018, 7:19:50 PM
    Author     : Hossam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        window.location.replace("ProductsServlet");
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
                        </c:if>
                        <c:if test="${!empty sessionScope.userInformation}">
                        <li> <a href="profile.jsp" ></i> Welcome ${sessionScope.userInformation.userName} </a></li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="logoutServelet">Log Out</a></li>
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
                <div class="col-md-4 logo_agile">
                    <h1><a href="ProductsServlet"><span>E</span>lite Shoppy <i class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a></h1>
                </div>
                <!-- header-bot -->
                
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
                                    <li class="active menu__item menu__item--current"><a class="menu__link" href="ProductsServlet">Home <span class="sr-only">(current)</span></a></li>                                   
                                    <li class=" menu__item"><a class="menu__link" href="about.jsp">About</a></li>
                                    <li class=" menu__item"><a class="menu__link" href="contact.jsp">Contact</a></li>
                                        <c:if test="${sessionScope.userInformation.type.equals('admin')}">
                                        <li class=" menu__item"><a class="menu__link" href="addProduct.html">Add Product</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </nav>	
                </div>
                <c:if test="${sessionScope.userInformation.type.equals('user')}">
                <div class="top_nav_right">
                    <div class="wthreecartaits wthreecartaits2 cart cart box_1"> 
                        <form action="#" method="post" class="last">                           
                            <input type="hidden" name="cmd" value="_cart">
                            <input type="hidden" name="display" value="1">
                            <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                        </form>  

                    </div>
                </div>
                </c:if>
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
                                    <input type="email" name="Email" required="" id="t1">
                                    <label>Email</label>
                                    <span></span>
                                </div>
                                <div class="styled-input">
                                    <input type="password" name="pass" required="" id="t2"> 
                                    <label>Password</label>
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
            </div>
        </div>
        
        <!-- //login -->
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
