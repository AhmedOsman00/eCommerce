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

function editOrSaveProfileData() {
    var profileBtnValue = document.getElementById("profileBtn").value;
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
function saveUserProfileChanges() {
    alert("Save Data");
}