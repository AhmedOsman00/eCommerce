var userNameDiv;
var oldUserName;
var newUserName;

var userPasswordDiv;
var oldUserPassword;
var newUserPassword;

var userJobDiv;
var oldUserJob;
var newUserJob;

var userEmailDiv;
var oldUserEmail;
var newUserEmail;

var userBirthdayDiv;
var oldUserBirthday;
var newUserBirthday;

var userAddressDiv;
var oldUserAddress;
var newUserAddress;

var chargeReq = null;
var editUserDataReq = null;
var currentUserId;

function chargeCreditCard(userId){
    //freeze charge div
    
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

        if (chargeReq.responseText == "correct") {
            chargeMsg.className = "chargeResultCorrect";
            chargeMsg.innerHTML = "Succeeded!"
            chargeMsg.style.visibility = "visible";
        } else {
            chargeMsg.className = "chargeResultWrong";
            chargeMsg.innerHTML = "Failed"
            chargeMsg.style.visibility = "visible";
        }
    }
}

window.onload = function () {
    userNameDiv = document.getElementById("userNameDiv");
    oldUserName = document.getElementById("userName");
    newUserName = document.createElement("INPUT");

    userPasswordDiv = document.getElementById("userPasswordDiv");
    oldUserPassword = document.getElementById("userPassword");
    newUserPassword = document.createElement("INPUT");

    userJobDiv = document.getElementById("userJobDiv");
    oldUserJob = document.getElementById("userJob");
    newUserJob = document.createElement("INPUT");

    userEmailDiv = document.getElementById("userEmailDiv");
    oldUserEmail = document.getElementById("userEmail");
    newUserEmail = document.createElement("INPUT");

    userBirthdayDiv = document.getElementById("userBirthdayDiv");
    oldUserBirthday = document.getElementById("userBirthday");
    newUserBirthday = document.createElement("INPUT");

    userAddressDiv = document.getElementById("userAddressDiv");
    oldUserAddress = document.getElementById("userAddress");
    newUserAddress = document.createElement("INPUT");
}

function editOrSaveProfileData(id) {
    var profileBtnValue = document.getElementById("profileBtn").value;
    currentUserId = id;
    if (profileBtnValue == "Edit Profile")
        editUserProfile();
    else if (profileBtnValue == "Save Changes")
        saveUserProfileChanges();
}

function editUserProfile() {
    document.getElementById("profileBtn").value = "Save Changes";
    editUserName();
    editUserJob();
    editUserEmail();
    editUserBirthday();
    editUserAddress();
    editUserPassword();
}

function editUserName() {
    newUserName.setAttribute("type", "text");
    newUserName.className = "newInput";
    newUserName.id = "newUserName";    
    newUserName.value = oldUserName.innerHTML;
    userNameDiv.replaceChild(newUserName, oldUserName);
}

function editUserJob() {
    newUserJob.setAttribute("type", "text");
    newUserJob.className = "newInput";
    newUserJob.id = "newUserJob";    
    newUserJob.value = oldUserJob.innerHTML;
    userJobDiv.replaceChild(newUserJob, oldUserJob);
}

function editUserEmail() {
    newUserEmail.setAttribute("type", "text");
    newUserEmail.className = "newInput";
    newUserEmail.id = "newUserEmail";    
    newUserEmail.value = oldUserEmail.innerHTML;
    userEmailDiv.replaceChild(newUserEmail, oldUserEmail);
}

function editUserBirthday() {
    newUserBirthday.setAttribute("type", "text");
    newUserBirthday.className = "newInput";
    newUserBirthday.id = "newUserBirthday";    
    newUserBirthday.value = oldUserBirthday.innerHTML;
    userBirthdayDiv.replaceChild(newUserBirthday, oldUserBirthday);
}

function editUserAddress() {
    newUserAddress.setAttribute("type", "text");
    newUserAddress.className = "newInput";
    newUserAddress.id = "newUserAddress";    
    newUserAddress.value = oldUserAddress.innerHTML;
    userAddressDiv.replaceChild(newUserAddress, oldUserAddress);
}

function editUserPassword() {
    newUserPassword.setAttribute("type", "password");
    newUserPassword.className = "newInput";
    newUserPassword.id = "newUserPassword";    
    newUserPassword.value = oldUserAddress.innerHTML;
    userPasswordDiv.replaceChild(newUserPassword, oldUserPassword);
}
function saveUserProfileChanges() {
    //validate data

    //update session
    
    //unfreeze charge div
    
    //back to showing data
    userNameValue = newUserName.value;
    userJobValue = newUserJob.value;
    userEmailValue = newUserEmail.value;
    userPasswordValue = newUserPassword.value;
    userBirthdayValue = newUserBirthday.value;
    userAddressValue = newUserAddress.value;
    
    document.getElementById("profileBtn").value = "Edit Profile";
    userJobDiv.replaceChild(oldUserJob, newUserJob);
    userNameDiv.replaceChild(oldUserName, newUserName);
    userEmailDiv.replaceChild(oldUserEmail, newUserEmail);
    userPasswordDiv.replaceChild(oldUserPassword, newUserPassword);
    userAddressDiv.replaceChild(oldUserAddress, newUserAddress);
    userBirthdayDiv.replaceChild(oldUserBirthday, newUserBirthday);    
    
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
}

function handleuserProfileChanges() {
    editUserDataReq = document.getElementById("chargeMsg");
    
    if (editUserDataReq.readyState == 4 && chargeReq.status == 200) {

        if (editUserDataReq.responseText == "ok") {
            alert("Ok");
        } else {
            alert("NOT Ok");
        }
    }
}