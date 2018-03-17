var emailValidatorReq = null;
var passwordValidatorReq = null;
var confirmPasswordValidatorReq = null;
var birthdayValidatorReq = null;
var signUpUserReq = null;
var nameIsValid = false;
var emailIsValid = false;
var passwordIsValid = false;
var confirmPasswordIsValid = false;
var birthdayIsValid = false;
var jobIsValid = false;
var addressIsValid = false;

function showBdPlaceholder() {
    document.getElementById("birthday").placeholder = "dd-mm-yyyy";
}

function hideBdPlaceholder() {
    document.getElementById("birthday").placeholder = "";
}

function signUpModalStarted() {
    nameIsValid = false;
    emailIsValid = false;
    passwordIsValid = false;
    confirmPasswordIsValid = false;
    birthdayIsValid = false;
    jobIsValid = false;
    addressIsValid = false;
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
            //console.log("Email Format: OK");
            document.getElementById("emailErrMSg").style.visibility = "hidden";
            emailIsValid = true;
        } else {
            //console.log("Email Format: NOT OK");
            document.getElementById("emailErrMSg").style.visibility = "visible";
            emailIsValid = false;
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
            //console.log("Password Format: OK");
            document.getElementById("passwordErrMsg").style.visibility = "hidden";
            passwordIsValid = true;
        } else {
            //console.log("Password Format: NOT OK");
            document.getElementById("passwordErrMsg").style.visibility = "visible";
            passwordIsValid = false;
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
            //console.log("Password Confirmed");
            document.getElementById("confirmPasswordErrMsg").style.visibility = "hidden";
            confirmPasswordIsValid = true;
        } else {
            //console.log("Password NOT Confirmed");
            document.getElementById("confirmPasswordErrMsg").style.visibility = "visible";
            confirmPasswordIsValid = false;
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
            //console.log("Birthday Confirmed");
            document.getElementById("birthdayErrMsg").style.visibility = "hidden";
            birthdayIsValid = true;
        } else {
            //console.log("Birthday NOT Confirmed");
            document.getElementById("birthdayErrMsg").style.visibility = "visible";
            birthdayIsValid = false;
        }
    }
}

//Validator for name, job, address
function checkIfEmpty(objId) {

    if (document.getElementById(objId).value == "") {
        document.getElementById(objId.concat("ErrMsg")).style.visibility = "visible";
        if (objId == "name")
            nameIsValid = false;
        else if (objId == "job")
            jobIsValid = false;
        else if (objId == "address")
            addressIsValid = false;
    }

    else {
        document.getElementById(objId.concat("ErrMsg")).style.visibility = "hidden";
        if (objId == "name")
            nameIsValid = true;
        else if (objId == "job")
            jobIsValid = true;
        else if (objId == "address")
            addressIsValid = true;
    }
}

function signUpNewUser() {
    //Check if there are no error msgs
    if (nameIsValid && emailIsValid && passwordIsValid && confirmPasswordIsValid && birthdayIsValid && jobIsValid && addressIsValid) {
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
                "&birthday=" + birthday + "&job=" + job + "&address=" + address + "&timeStamp=" + new Date().getTime();
        signUpUserReq.open("POST", url, true);
        signUpUserReq.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        signUpUserReq.send(null);
    }
    
    else {
        checkIfEmpty("name");
        validateEmail();
        validatePassword();
        validateConfirmPassword();
        validateBirthday();
        checkIfEmpty("job");
        checkIfEmpty("address");
    }
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