<%-- 
    Document   : Profile
    Created on : 18-Mar-2018, 1:20:48 AM
    Author     : Fadwa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
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
        <!--SignUp JS and Style-->
        <link rel="stylesheet" type="text/css" href="css/signUpModal.css">
        <script type="text/javascript" src="js/signUp.js"></script>
        <!--Profile Style-->
        <link rel="stylesheet" type="text/css" href="css/profile.css">

    </head>
    <body>
        <!-- header -->
        <jsp:include page="header.jsp"/>


        <!-- Edit-Profile-Modal -->
        <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modal-body-sub_agile">
                        <div class="col-md-8 modal_body_left modal_body_left1">
                            <h3 class="agileinfo_sign">Edit Your Profile</h3>
                            <form>
                                <div class="styled-input">
                                    <input type="text" name="Name" id ="newName" required="" onblur="checkIfEmpty('newName')">
                                    <label>Name</label>
                                    <span></span>
                                </div>
                                <label class="errMsg" id="newNameErrMsg">Name field is required</label>

                                <div class="styled-input">
                                    <input type="text" name="gender" id="newGender" onclick="showGenderPlaceholder('newGender')" 
                                           onblur="hideGenderPlaceholder('newGender');validateGender('newGender');" required=""> 
                                    <label>Gender</label>
                                    <span></span>
                                </div>
                                <label class="errMsg" id="newGenderErrMsg">Invalid Input</label>

                                <div class="styled-input">
                                    <input type="text" name="Email" id="newEmail" onblur="validateEmail('newEmail')" required=""> 
                                    <label>Email</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="newEmailErrMSg">Invalid Email</label>

                                <div class="styled-input">
                                    <input type="password" name="password" id="newPassword" onblur="validatePassword('newPassword')" required=""> 
                                    <label>Password</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="newPasswordErrMsg">Password should be at least 6 characters long</label>

                                <div class="styled-input">
                                    <input type="password" name="Confirm Password" id="newConfirmPassword" onblur="validateConfirmPassword('newPassword', 'newConfirmPassword')" required=""> 
                                    <label>Confirm Password</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="newConfirmPasswordErrMsg">Password does not match the confirm password</label>


                                <div class="styled-input" >
                                    <input type="text" name="birthday" id="newBirthday" onclick="showBdPlaceholder('newBirthday')" 
                                           onblur="hideBdPlaceholder('newBirthday');validateBirthday('newBirthday');" required="">
                                    <label>Birthday</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="newBirthdayErrMsg">Invalid Birthday</label>

                                <div class="styled-input">
                                    <input type="text" name="Job" id ="newJob" required="" onblur="checkIfEmpty('newJob')"> 
                                    <label>Job</label>
                                    <span></span>
                                </div> 
                                <label class="errMsg" id="newJobErrMsg">Job field is required</label>

                                <div class="styled-input">
                                    <input type="text" name="Address" id="newAddress" required="" onblur="checkIfEmpty('newAddress')"> 
                                    <label>Address</label>
                                    <span></span>
                                </div>
                                <label class="errMsg" id="newAddressErrMsg">Address field is required</label>
                                <br><br>

                                <input type="button" value="Save" onclick="saveEditing()">
                                <label id="editResult"></label>
                            </form>
                            <div class="clearfix"></div>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- //Modal content-->
            </div>
        </div>
        <!-- Edit-Profile-Modal -->

        <!--Profile-Div-->
        <div class="profileDiv">

            <br>

            <input type="text" placeholder="Enter the code here..." class="newInput" id="creditCode">
            <input type="button" value="Charge" id = "chargeCreditBtn" onclick="chargeCreditCard(${sessionScope.userInformation.userId})">
            <a href="#" data-toggle="modal" data-target="#editProfileModal"><input type="button" value="Edit Profile" id = "profileBtn" onclick="editUserProfile(${sessionScope.userInformation.userId}, ${sessionScope.userInformation.userPassword})"></a>
            <br>
            <div class="chargeResultCorrect" id="chargeMsg">charged successfully</div>
            <br>
            <center>
                <br><br>
                <div id="userNameDiv"><h2 id="userName">${sessionScope.userInformation.userName}</h2></div>
                <div id="userJobDiv"><h3 id="userJob">${sessionScope.userInformation.userJob}</h3></div>

                <br><br>
                <h4>
                    <div id="userEmailDiv">
                        <b>Email:&nbsp;&nbsp;</b> 
                        <span id="userEmail">${sessionScope.userInformation.userEmail}</span>
                    </div>
                    <br><br>

                    <div id="userPasswordDiv">
                        <b>Password:&nbsp;&nbsp;</b>
                        <span id="userPassword"><c:forEach begin="0" end="${fn:length(sessionScope.userInformation.userPassword) - 1}" step="1"><c:out value = "*"/></c:forEach></span>
                        </div>
                        <br><br>

                        <div id="userGenderDiv">
                            <b>Gender:&nbsp;&nbsp;</b>
                            <span id="userGender">${sessionScope.userInformation.gender}</span>
                    </div>
                    <br><br>

                    <div id="userBirthdayDiv">
                        <b>Birthday:&nbsp;&nbsp;</b>
                        <span id="userBirthday">${sessionScope.userInformation.userBirthday}</span>
                    </div>
                    <br><br>

                    <div id="userAddressDiv">
                        <b>Address:&nbsp;&nbsp;</b>
                        <span id="userAddress">${sessionScope.userInformation.address}</span>
                    </div>
                    <br><br>

                    <div id="userCreditLimitDiv">
                        <b>Credit Limit:&nbsp;&nbsp;</b> 
                        <span id="userCreditLimit">
                            ${sessionScope.userInformation.userCreditLimt}
                        </span>
                    </div>
                    <br><br>

                </h4>

            </center> 

            <br><br><br>
        </div>
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
        <!-- //here ends scrolling icon -->


        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>

