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
var genderIsValid = false;

var newNameIsValid = false;
var newEmailIsValid = false;
var newPasswordIsValid = false;
var newConfirmPasswordIsValid = false;
var newBirthdayIsValid = false;
var newJobIsValid = false;
var newAddressIsValid = false;
var newGenderIsValid = false;

var userNameId, userEmailId, userPasswordId, userConfirmPasswordId, userBirthdayId, userJobId, userAddressId, userGenderId;

var oldUserName;
var newUserName;

var oldUserPassword;
var newUserPassword;

var oldUserJob;
var newUserJob;

var oldUserEmail;
var newUserEmail;

var oldUserBirthday;
var newUserBirthday;

var oldUserAddress;
var newUserAddress;

var chargeReq = null;
var editUserDataReq = null;
var currentUserId;

function showBdPlaceholder(birthdayId) {
    document.getElementById(birthdayId).placeholder = "dd-mm-yyyy";
}

function hideBdPlaceholder(birthdayId) {
    document.getElementById(birthdayId).placeholder = "";
}

function showGenderPlaceholder(genderId) {
    document.getElementById(genderId).placeholder = "\'m\' for Male and \'f\' for Female";
}

function hideGenderPlaceholder(genderId) {
    document.getElementById(genderId).placeholder = "";
}

function validateGender(genderId) {

    if (document.getElementById(genderId).value != "m" && document.getElementById(genderId).value != "f") {
        document.getElementById(genderId.concat("ErrMsg")).style.visibility = "visible";
        if (genderId == "gender")
            genderIsValid = false;
        else
            newGenderIsValid = false;
    } else {
        document.getElementById(genderId.concat("ErrMsg")).style.visibility = "hidden";
        if (genderId == "gender")
            genderIsValid = true;
        else
            newGenderIsValid = true;
    }
}

window.onload = function () {
    oldUserName = document.getElementById("userName");
    newUserName = document.getElementById("newName");

    oldUserJob = document.getElementById("userJob");
    newUserJob = document.getElementById("newJob");

    oldUserEmail = document.getElementById("userEmail");
    newUserEmail = document.getElementById("newEmail");

    oldUserBirthday = document.getElementById("userBirthday");
    newUserBirthday = document.getElementById("newBirthday");

    oldUserAddress = document.getElementById("userAddress");
    newUserAddress = document.getElementById("newAddress");

    newUserPassword = document.getElementById("newPassword");
    newUserConfirmPassword = document.getElementById("newConfirmPassword");

    oldUserGender = document.getElementById("userGender")
    newUserGender = document.getElementById("newGender");
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

function validateEmail(emailId) {
    userEmailId = emailId;
    console.log(userEmailId);
    if (window.XMLHttpRequest)
        emailValidatorReq = new XMLHttpRequest();
    else
        emailValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    emailValidatorReq.onreadystatechange = handleValidateEmailReq;
    email = document.getElementById(userEmailId).value;

    url = "SignUpServlet?check=email&email=" + email + "&timeStamp=" + new Date().getTime();
    emailValidatorReq.open("GET", url, true);
    emailValidatorReq.send(null);
}

function handleValidateEmailReq() {
    if (emailValidatorReq.readyState == 4 && emailValidatorReq.status == 200) {

        if (emailValidatorReq.responseText == "valid") {
            //console.log("Email Format: OK");
            if (userEmailId == "email") {
                document.getElementById("emailErrMSg").style.visibility = "hidden";
                emailIsValid = true;
            } else {
                document.getElementById("newEmailErrMSg").style.visibility = "hidden";
                newEmailIsValid = true;
            }
        } else {
            //console.log("Email Format: NOT OK");
            if (userEmailId == "email") {
                document.getElementById("emailErrMSg").style.visibility = "visible";
                emailIsValid = false;
            } else {
                document.getElementById("newEmailErrMSg").style.visibility = "visible";
                newEmailIsValid = false;
            }
        }
    }
}
function validatePassword(passwordId) {
    userPasswordId = passwordId;
    if (window.XMLHttpRequest)
        passwordValidatorReq = new XMLHttpRequest();
    else
        passwordValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    passwordValidatorReq.onreadystatechange = handleValidatePasswordReq;
    password = document.getElementById(userPasswordId).value;

    url = "SignUpServlet?check=password&password=" + password + "&timeStamp=" + new Date().getTime();
    passwordValidatorReq.open("GET", url, true);
    passwordValidatorReq.send(null);
}

function handleValidatePasswordReq() {
    if (passwordValidatorReq.readyState == 4 && passwordValidatorReq.status == 200) {

        if (passwordValidatorReq.responseText == "valid") {
            //console.log("Password Format: OK");
            if (userPasswordId == "password") {
                document.getElementById("passwordErrMsg").style.visibility = "hidden";
                passwordIsValid = true;
            } else {
                document.getElementById("newPasswordErrMsg").style.visibility = "hidden";
                newPasswordIsValid = true;
            }
        } else {
            //console.log("Password Format: NOT OK");
            if (userPasswordId == "password") {
                document.getElementById("passwordErrMsg").style.visibility = "visible";
                passwordIsValid = false;
            } else {
                document.getElementById("newPasswordErrMsg").style.visibility = "visible";
                newPasswordIsValid = false;
            }
        }
    }
}

function validateConfirmPassword(passwordId, confirmPasswordId) {
    userPasswordId = passwordId;
    userConfirmPasswordId = confirmPasswordId;
    if (window.XMLHttpRequest)
        confirmPasswordValidatorReq = new XMLHttpRequest();
    else
        confirmPasswordValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    confirmPasswordValidatorReq.onreadystatechange = handleValidateConfirmPasswordReq;
    password = document.getElementById(userPasswordId).value;
    confirmPassword = document.getElementById(userConfirmPasswordId).value;

    url = "SignUpServlet?check=confirm&password=" + password + "&confirmpassword=" + confirmPassword + "&timeStamp=" + new Date().getTime();
    confirmPasswordValidatorReq.open("GET", url, true);
    confirmPasswordValidatorReq.send(null);
}

function handleValidateConfirmPasswordReq() {
    if (confirmPasswordValidatorReq.readyState == 4 && confirmPasswordValidatorReq.status == 200) {

        if (confirmPasswordValidatorReq.responseText == "valid") {
            //console.log("Password Confirmed");
            if (userPasswordId == "password") {
                document.getElementById("confirmPasswordErrMsg").style.visibility = "hidden";
                confirmPasswordIsValid = true;
            } else {
                document.getElementById("newConfirmPasswordErrMsg").style.visibility = "hidden";
                newConfirmPasswordIsValid = true;
            }

        } else {
            //console.log("Password NOT Confirmed");
            if (userPasswordId == "password") {
                document.getElementById("confirmPasswordErrMsg").style.visibility = "visible";
                confirmPasswordIsValid = false;
            } else {
                document.getElementById("newConfirmPasswordErrMsg").style.visibility = "visible";
                newConfirmPasswordIsValid = false;
            }
        }
    }
}

function validateBirthday(birthdayId) {

    userBirthdayId = birthdayId;
    if (window.XMLHttpRequest)
        birthdayValidatorReq = new XMLHttpRequest();
    else
        birthdayValidatorReq = new ActiveXObject(Microsoft.XMLHTTP);

    birthdayValidatorReq.onreadystatechange = handleValidateBirthdayReq;
    birthday = document.getElementById(userBirthdayId).value;

    url = "SignUpServlet?check=birthday&birthday=" + birthday + "&timeStamp=" + new Date().getTime();
    birthdayValidatorReq.open("GET", url, true);
    birthdayValidatorReq.send(null);
}

function handleValidateBirthdayReq() {
    if (birthdayValidatorReq.readyState == 4 && birthdayValidatorReq.status == 200) {

        if (birthdayValidatorReq.responseText == "valid") {
            //console.log("Birthday Confirmed");
            if (userBirthdayId == "birthday") {
                document.getElementById("birthdayErrMsg").style.visibility = "hidden";
                birthdayIsValid = true;
            } else {
                document.getElementById("newBirthdayErrMsg").style.visibility = "hidden";
                newBirthdayIsValid = true;
            }

        } else {
            //console.log("Birthday NOT Confirmed");
            if (userBirthdayId == "birthday") {
                document.getElementById("birthdayErrMsg").style.visibility = "visible";
                birthdayIsValid = false;
            } else {
                document.getElementById("newBirthdayErrMsg").style.visibility = "visible";
                newBirthdayIsValid = false;
            }
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
        else if (objId == "newName")
            newNameIsValid = false;
        else if (objId == "newJob")
            newJobIsValid = false;
        else if (objId == "newAddress")
            newAddressIsValid = false;
    } else {
        document.getElementById(objId.concat("ErrMsg")).style.visibility = "hidden";
        if (objId == "name")
            nameIsValid = true;
        else if (objId == "job")
            jobIsValid = true;
        else if (objId == "address")
            addressIsValid = true;
        if (objId == "newName")
            newNameIsValid = true;
        else if (objId == "newJob")
            newJobIsValid = true;
        else if (objId == "newAddress")
            newAddressIsValid = true;
    }
}

function signUpNewUser() {
    //Check if there are no error msgs
    if (nameIsValid && emailIsValid && passwordIsValid && confirmPasswordIsValid
            && birthdayIsValid && jobIsValid && addressIsValid && genderIsValid) {
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
        gender = document.getElementById("gender").value;

        url = "SignUpServlet?name=" + name + "&email=" + email + "&password=" + password +
                "&birthday=" + birthday + "&job=" + job + "&address=" + address +
                "&gender=" + gender + "&timeStamp=" + new Date().getTime();
        signUpUserReq.open("POST", url, true);
        signUpUserReq.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        signUpUserReq.send(null);
    } else {
        checkIfEmpty("name");
        validateEmail("email");
        validatePassword("password");
        validateConfirmPassword("password", "confirmPassword");
        validateBirthday("birthday");
        validateGender("gender")
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

function chargeCreditCard(userId) {

    var creditCode = document.getElementById("creditCode").value;

    if (window.XMLHttpRequest)
        chargeReq = new XMLHttpRequest();
    else
        chargeReq = new ActiveXObject(Microsoft.XMLHTTP);

    chargeReq.onreadystatechange = handleChargeCredit;

    url = "CreditChargeServlet?code=" + creditCode + "&userId=" + userId + "&timeStamp=" + new Date().getTime();
    chargeReq.open("POST", url, true);
    chargeReq.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    chargeReq.send(null);
}

function handleChargeCredit() {
    chargeMsg = document.getElementById("chargeMsg");

    if (chargeReq.readyState == 4 && chargeReq.status == 200) {

       if(chargeReq.responseText == "wrong") {
            chargeMsg.className = "chargeResultWrong";
            chargeMsg.innerHTML = "Failed"
            chargeMsg.style.visibility = "visible";
        } else {
            document.getElementById("userCreditLimit").innerHTML = chargeReq.responseText;
            chargeMsg.className = "chargeResultCorrect";
            chargeMsg.innerHTML = "Succeeded!"
            chargeMsg.style.visibility = "visible";

        }
    }
}

function editUserProfile(id, password) {
    oldUserPasswordValue = password;
    currentUserId = id;
    newUserName.value = oldUserName.innerHTML;
    newUserPassword.value = oldUserPasswordValue;
    newUserConfirmPassword.value = oldUserPasswordValue;
    newUserJob.value = oldUserJob.innerHTML;
    newUserEmail.value = oldUserEmail.innerHTML;
    newUserBirthday.value = oldUserBirthday.innerHTML;
    newUserAddress.value = oldUserAddress.innerHTML;
    newUserGender.value = oldUserGender.innerHTML;
    newNameIsValid = true;
    newEmailIsValid = true;
    newPasswordIsValid = true;
    newConfirmPasswordIsValid = true;
    newBirthdayIsValid = true;
    newJobIsValid = true;
    newAddressIsValid = true;
    newGenderIsValid = true;
}

function saveEditing() {
    //validate data
    if (newNameIsValid && newJobIsValid && newEmailIsValid && newBirthdayIsValid && newPasswordIsValid
            && newConfirmPasswordIsValid && newAddressIsValid) {

        //get parameters
        userNameValue = newUserName.value;
        userJobValue = newUserJob.value;
        userEmailValue = newUserEmail.value;
        userPasswordValue = newUserPassword.value;
        userBirthdayValue = newUserBirthday.value;
        userAddressValue = newUserAddress.value;

        if (window.XMLHttpRequest)
            editUserDataReq = new XMLHttpRequest();
        else
            editUserDataReq = new ActiveXObject(Microsoft.XMLHTTP);

        editUserDataReq.onreadystatechange = handleuserProfileChanges;

        url = "EditUserProfileServlet?userId=" + currentUserId + "&userName=" + userNameValue +
                "&userJob=" + userJobValue + "&userEmail=" + userEmailValue
                + "&userPassword=" + userPasswordValue + "&userbirthday=" + userBirthdayValue
                + "&userAddress=" + userAddressValue + "&timeStamp=" + new Date().getTime();
        editUserDataReq.open("POST", url, true);
        editUserDataReq.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        editUserDataReq.send(null);
    } else {
        checkIfEmpty("newName");
        validateEmail("newEmail");
        validatePassword("newPassword");
        validateConfirmPassword("newPassword", "newConfirmPassword");
        validateBirthday("newBirthday");
        validateGender("newGender")
        checkIfEmpty("newJob");
        checkIfEmpty("newAddress");
    }
}

function handleuserProfileChanges() {

    if (editUserDataReq.readyState == 4 && editUserDataReq.status == 200) {
        var editResult = document.getElementById("editResult");

        if (editUserDataReq.responseText == "ok") {
            /*
             editResult.className = "editResultCorrect"
             editResult.style.visibility = "visible"
             editResult.innerHTML = "Data has been updated successfully!"*/
            location.reload();
        } else {
            editResult.className = "editResultWrong"
            editResult.style.visibility = "visible"
            editResult.innerHTML = "Failed to update data!"
        }
    }
}