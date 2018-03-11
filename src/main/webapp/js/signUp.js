var emailValidatorReq = null;
var passwordValidatorReq = null;
var confirmPasswordValidatorReq = null;
var birthdayValidatorReq = null;
var signUpUserReq = null;

function showBdPlaceholder() {
    document.getElementById("birthday").placeholder = "dd-mm-yyyy";
}

function hideBdPlaceholder() {
    document.getElementById("birthday").placeholder = "";
}

function validateEmail() {
    if (window.XMLHttpRequest)
        emailValidatorReq = new XMLHttpRequest();
    else
        emailValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    emailValidatorReq.onreadystatechange = handleValidateEmailReq;
    email = document.getElementById("email").value;

    url = "SignUpServlet?check=email&email=" + email + "&timeStamp=" + new Date().getTime();
    emailValidatorReq.open("GET", url, true);
    emailValidatorReq.send(null);
}

function handleValidateEmailReq() {
    if (emailValidatorReq.readyState == 4 && emailValidatorReq.status == 200) {

        if (emailValidatorReq.responseText == "valid") {
            console.log("Email Format: OK");
        } else {
            console.log("Email Format: NOT OK");
        }
    }
}
function validatePassword() {
    if (window.XMLHttpRequest)
        passwordValidatorReq = new XMLHttpRequest();
    else
        passwordValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    passwordValidatorReq.onreadystatechange = handleValidatePasswordReq;
    password = document.getElementById("password").value;

    url = "SignUpServlet?check=password&password=" + password + "&timeStamp=" + new Date().getTime();
    passwordValidatorReq.open("GET", url, true);
    passwordValidatorReq.send(null);
}

function handleValidatePasswordReq() {
    if (passwordValidatorReq.readyState == 4 && passwordValidatorReq.status == 200) {

        if (passwordValidatorReq.responseText == "valid") {
            console.log("Password Format: OK");
        } else {
            console.log("Password Format: NOT OK");
        }
    }
}

function validateConfirmPassword() {
    if (window.XMLHttpRequest)
        confirmPasswordValidatorReq = new XMLHttpRequest();
    else
        confirmPasswordValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    confirmPasswordValidatorReq.onreadystatechange = handleValidateConfirmPasswordReq;
    password = document.getElementById("password").value;
    confirmPassword = document.getElementById("confirmPassword").value;

    url = "SignUpServlet?check=confirm&password=" + password + "&confirmpassword=" + confirmPassword + "&timeStamp=" + new Date().getTime();
    confirmPasswordValidatorReq.open("GET", url, true);
    confirmPasswordValidatorReq.send(null);
}

function handleValidateConfirmPasswordReq() {
    if (confirmPasswordValidatorReq.readyState == 4 && confirmPasswordValidatorReq.status == 200) {

        if (confirmPasswordValidatorReq.responseText == "valid") {
            console.log("Password Confirmed");
        } else {
            console.log("Password NOT Confirmed");
        }
    }
}

function validateBirthday() {

    if (window.XMLHttpRequest)
        birthdayValidatorReq = new XMLHttpRequest();
    else
        birthdayValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    birthdayValidatorReq.onreadystatechange = handleValidateBirthdayReq;
    birthday = document.getElementById("birthday").value;

    url = "SignUpServlet?check=birthday&birthday=" + birthday + "&timeStamp=" + new Date().getTime();
    birthdayValidatorReq.open("GET", url, true);
    birthdayValidatorReq.send(null);
}

function handleValidateBirthdayReq() {
    if (birthdayValidatorReq.readyState == 4 && birthdayValidatorReq.status == 200) {

        if (birthdayValidatorReq.responseText == "valid") {
            console.log("Birthday Confirmed");
        } else {
            console.log("Birthday NOT Confirmed");
        }
    }
}

function signUpNewUser() {
    //Check if there are no error msgs

    if (window.XMLHttpRequest)
        signUpUserReq = new XMLHttpRequest();
    else
        signUpUserReq = new ActiveXObject(Microsoft.XMLHTTP);

    signUpUserReq.onreadystatechange = handleSignUpReq;
    name = document.getElementById("name").value;
    email = document.getElementById("email").value;
    password = document.getElementById("password").value;
    birthday = document.getElementById("birthday").value;
    job = document.getElementById("job").value;
    address = document.getElementById("address").value;

    url = "SignUpServlet?name=" + name + "&email=" + email + "&password=" + password + 
            "&birthday=" + birthday + "&job=" + job+ "&address=" + address + "&timeStamp=" + new Date().getTime();
    signUpUserReq.open("POST", url, true);
    signUpUserReq.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    signUpUserReq.send(null);
}

function handleSignUpReq() {
    if (signUpUserReq.readyState == 4 && signUpUserReq.status == 200) {
        
        if (signUpUserReq.responseText == "valid") {
            console.log("Signed Up Successfully");
        } else {
            console.log("Failed to Sign Up");
        }
    }
}